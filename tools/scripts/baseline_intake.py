#!/usr/bin/env python3
"""Gate a local, owner-supplied ROM by the upstream Track A identity.

Run before extraction/build: --rom <local dump> --output <metadata.json>.
No extraction or build is performed. Output contains hashes, header fields and
module tables, with no program/asset bytes or local input paths. Stored ARM9
regions include autoload data; this is not dsd's split/decompressed inventory.
"""
import argparse
import hashlib
import json
import struct
import sys
from pathlib import Path

EXPECTED_SHA1 = 'ba58e20ee60eb81c33dcd4934a21271baa9f954a'
# NitroFS path/file ID independently established for this exact upstream ROM.
KNOWN_EMBEDDED_FILES = [('ChildRom/JSS2Child.srl', 79)]


def read_verified_rom(path):
    data = path.read_bytes()
    actual = hashlib.sha1(data).hexdigest()
    if actual != EXPECTED_SHA1:
        raise ValueError(f'ROM SHA1 mismatch: expected {EXPECTED_SHA1}, got {actual}')
    return data


def region(data, offset, size):
    if offset < 0 or size < 0 or offset + size > len(data):
        raise ValueError(f'region {offset:#x}+{size:#x} outside ROM')
    return data[offset:offset + size]


def header_inventory(data):
    region(data, 0, 0x160)
    header = {
        'title': data[:12].rstrip(b'\0').decode('ascii', errors='replace'),
        'game_code': data[12:16].decode('ascii', errors='replace'),
        'maker_code': data[16:18].decode('ascii', errors='replace'),
        'unit_code': data[0x12],
        'device_capacity': data[0x14],
        'revision': data[0x1E],
        'used_rom_size_bytes': struct.unpack_from('<I', data, 0x80)[0],
        'header_size_bytes': struct.unpack_from('<I', data, 0x84)[0],
    }
    modules = []
    overlays = {}
    fat_offset, fat_size = struct.unpack_from('<2I', data, 0x48)
    fat = region(data, fat_offset, fat_size)
    if fat_size % 8:
        raise ValueError('FAT size is not a multiple of 8')
    files = list(struct.iter_unpack('<2I', fat))
    for cpu, header_offset, table_header in (('arm9', 0x20, 0x50), ('arm7', 0x30, 0x58)):
        offset, entry, ram, size = struct.unpack_from('<4I', data, header_offset)
        modules.append({
            'cpu': cpu, 'kind': 'main', 'rom_offset': offset,
            'rom_size_bytes': size, 'ram_address': ram, 'entry_address': entry,
            'sha256': hashlib.sha256(region(data, offset, size)).hexdigest(),
            'build_status': 'unbuilt',
        })
        table_offset, table_size = struct.unpack_from('<2I', data, table_header)
        table = region(data, table_offset, table_size)
        if table_size % 32:
            raise ValueError(f'{cpu} overlay table size is not a multiple of 32')
        header[cpu + '_overlay_table'] = {'rom_offset': table_offset, 'size_bytes': table_size}
        entries = []
        for ident, ram, size, bss, init_start, init_end, file_id, flags in struct.iter_unpack('<8I', table):
            if file_id >= len(files):
                raise ValueError(f'overlay {ident} has invalid FAT file ID {file_id}')
            start, end = files[file_id]
            content = region(data, start, end - start)
            entries.append({
                'id': ident, 'cpu': cpu, 'file_id': file_id, 'ram_address': ram,
                'ram_size_bytes': size, 'bss_size_bytes': bss,
                'static_init_start': init_start, 'static_init_end': init_end,
                'rom_offset': start, 'rom_size_bytes': len(content),
                'compressed_size_bytes': flags & 0xFFFFFF,
                'flags': flags >> 24, 'compressed': bool(flags & 0x01000000),
                'sha256': hashlib.sha256(content).hexdigest(), 'build_status': 'unbuilt',
            })
        overlays[cpu] = entries
    return header, modules, overlays, files


def inventory_rom(data, embedded_files=()):
    """Inventory header/FAT metadata; caller must enforce identity before public use.

    Embedded file names/IDs come from a separately established NitroFS inventory.
    An empty list means not assessed, never proof that embedded programs are absent.
    ROM sizes/hashes describe stored regions, not dsd's decompressed/autoload split.
    """
    header, modules, overlays, files = header_inventory(data)
    embedded = []
    for path, file_id in embedded_files:
        if file_id >= len(files):
            raise ValueError(f'embedded executable has invalid FAT file ID {file_id}')
        start, end = files[file_id]
        content = region(data, start, end - start)
        child_header, child_modules, child_overlays, _ = header_inventory(content)
        embedded.append({
            'path': path, 'file_id': file_id, 'rom_offset': start,
            'size_bytes': len(content), 'sha256': hashlib.sha256(content).hexdigest(),
            'header': child_header, 'modules': child_modules, 'overlays': child_overlays,
            'build_status': 'unbuilt',
        })
    return {
        'schema_version': 1,
        'rom': {'sha1': hashlib.sha1(data).hexdigest(),
                'sha256': hashlib.sha256(data).hexdigest(), 'size_bytes': len(data),
                'header': header},
        'modules': modules, 'overlays': overlays,
        'embedded_executables': embedded,
        'embedded_inventory_status': 'known files inventoried' if embedded else 'not assessed',
        'build_scope': {'arm7': 'inventoried only; unbuilt',
                        'embedded_executables': 'inventoried only; unbuilt'},
        'source_coverage': {'reconstructed_bytes': 0, 'percent': 0,
                            'scope': 'intake only; no reconstructed source linked'},
        'baseline_verified': False,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rom', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    try:
        data = read_verified_rom(args.rom)
        manifest = inventory_rom(data, embedded_files=KNOWN_EMBEDDED_FILES)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')
    except (OSError, ValueError) as error:
        print(str(error), file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    sys.exit(main())
