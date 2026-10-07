#!/usr/bin/env python3
"""Fresh original-only readback and mathematical predictions; no instruction execution."""
if not __debug__:
    raise SystemExit('Run without -O or -OO; optimized Python disables verification assertions.')
import argparse
import hashlib
import json
import os
import stat
import struct
import subprocess
import sys
from pathlib import Path
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[4]
CAPSULE = Path(__file__).resolve().parent


def sha(data):
    return hashlib.sha256(data).hexdigest()


def checked_files(snapshot):
    for name, expected in snapshot.items():
        path = Path(name)
        if path.is_symlink() or not path.is_file() or sha(path.read_bytes()) != expected:
            raise ValueError('changed/missing/nonordinary pinned file: ' + name)


def inputs():
    path = CAPSULE / 'contract.json'; data = path.read_bytes(); record = json.loads(data)
    snapshot = {str(ROOT / name): value for name, value in record['source_pins'].items()}
    snapshot.update({str(CAPSULE / name): value for name, value in record['owned_pins'].items()})
    snapshot[str(path)] = sha(data); checked_files(snapshot)
    return record, snapshot


def inspect_objects(paths):
    record, _ = inputs()
    actual = {p.name: sha(p.read_bytes()) for p in paths}
    if actual != record['original_object_inventory'] or any(p.is_symlink() for p in paths):
        raise ValueError('fresh original object inventory/bytes differ')
    sys.path.insert(0, str(ROOT / 'tools/scripts'))
    from native_link import Elf32
    target = None; references = []
    for path in paths:
        elf = Elf32(path.read_bytes()); symbols = elf.symbols()
        function = next((s for s in symbols if elf.symbol_name(s) == 'func_020326b0' and s[5]), None)
        if function:
            section = elf.sections[function[5]]
            body = elf.content(section)[function[1]:function[1] + function[2]]
            target = {'object': path.name, 'object_sha256': sha(path.read_bytes()),
                      'symbol': {'name': elf.symbol_name(function), 'value': function[1], 'size': function[2], 'info': function[3], 'section_index': function[5]},
                      'payload_sha256': sha(body),
                      'allocated_sections': [{'name': elf.section_name(s), 'type': s[1], 'flags': s[2], 'address': s[3], 'size': s[5]} for s in elf.sections if s[2] & 2 and s[5]],
                      'outgoing_relocations': []}
        for section in elf.sections:
            if section[1] != 4: continue
            for offset, info, addend in struct.iter_unpack('<IIi', elf.content(section)):
                name = elf.symbol_name(symbols[info >> 8])
                if function and section[7] == function[5] and function[1] <= offset < function[1] + function[2]:
                    target['outgoing_relocations'].append({'offset': offset - function[1], 'type': info & 255, 'symbol': name, 'addend': addend})
                if name != 'func_020326b0': continue
                owners = [s for s in symbols if s[3] & 15 == 2 and s[5] == section[7] and (s[1] & ~1) <= offset < (s[1] & ~1) + s[2]]
                if len(owners) != 1: raise ValueError('incoming relocation lacks unique original function owner')
                owner = owners[0]; caller = elf.symbol_name(owner)
                address = int(caller[-8:], 16) + offset - (owner[1] & ~1)
                references.append({'object': path.name, 'section': elf.section_name(elf.sections[section[7]]), 'offset': offset,
                                   'type': info & 255, 'addend': addend, 'module': path.name.split('@')[1].rsplit('_', 1)[0],
                                   'caller_symbol': caller, 'address': f'0x{address:08x}'})
    if target != record['original_target']: raise ValueError('original helper symbol/full44/sections/outgoing RELA differ')
    expected = [{k: v for k, v in row.items() if k not in ('decoded_target', 'loaded_instruction_hex')} for row in record['incoming_references']]
    if references != expected: raise ValueError('all-region original incoming RELA/owners differ')
    return {'target': target, 'references': references}


def branch_target(data, address, kind):
    if kind == 1:
        word, = struct.unpack('<I', data)
        if word >> 24 != 0xeb: raise ValueError('expected actual ARM BL')
        displacement = word & 0xffffff
        if displacement & 0x800000: displacement -= 0x1000000
        return address + 8 + (displacement << 2)
    if kind != 10: raise ValueError('unsupported inbound relocation kind')
    high, low = struct.unpack('<HH', data)
    if high & 0xf800 != 0xf000 or low & 0xf800 != 0xe800: raise ValueError('expected actual Thumb BLX')
    displacement = high & 0x7ff
    if displacement & 0x400: displacement -= 0x800
    return (address + 4 + (displacement << 12) + ((low & 0x7ff) << 1)) & ~3


def predicted_fold(data):
    h = 0
    for byte in data:
        if byte == 0: return h
        signed = byte if byte < 128 else byte - 256
        h ^= (signed | (h << 1)) & 0xffff
    raise ValueError('prediction requires an explicit NUL terminator')


def bit_step(h, byte):
    # Independent per-bit Boolean form, not an ARM interpreter.
    value = 0
    for bit in range(16):
        signed_bit = (byte >> bit) & 1 if bit < 8 else byte >> 7
        previous_bit = (h >> (bit - 1)) & 1 if bit else 0
        value |= (((h >> bit) & 1) ^ bool(signed_bit or previous_bit)) << bit
    return value


def arithmetic_checks(record):
    states = set(range(0, 65536, 257)) | {1, 0x7fff, 0x8000, 0xff80, 0xffff}
    count = 0
    for h in states:
        for byte in range(1, 256):
            signed = byte if byte < 128 else byte - 256
            if bit_step(h, byte) != h ^ ((signed | (h << 1)) & 0xffff): raise ValueError('independent arithmetic disagreement')
            count += 1
    for vector in record['predicted_vectors']:
        data = bytes.fromhex(vector['input_hex']); expected = int(vector['predicted_return'], 16)
        if predicted_fold(data) != expected: raise ValueError('static mathematical vector differs')
        h = 0
        for byte in data:
            if not byte: break
            h = bit_step(h, byte)
        if h != expected: raise ValueError('independent bit-form vector differs')
    # Concrete refuters: signed vs unsigned, OR vs addition/XOR, omitted truncation.
    if predicted_fold(b'\x80\0') == 0x80: raise ValueError('unsigned-byte refuter lost')
    if predicted_fold(b'AB\0') in (0x41 ^ (0x42 + (0x41 << 1)), 0x41 ^ (0x42 ^ (0x41 << 1))): raise ValueError('OR refuter lost')
    if predicted_fold(b'\x80\0') == ((-128) & 0xffffffff): raise ValueError('truncation refuter lost')
    return {'independent_one_step_cases': count, 'vectors': record['predicted_vectors'], 'classification': 'derived mathematical predictions; no original-runtime execution'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('rom', 'dsd', 'output'): parser.add_argument('--' + name, required=True, type=Path)
    args = parser.parse_args(); record, snapshot = inputs()
    rom_path = args.rom.absolute(); dsd = args.dsd.absolute(); output = args.output.absolute()
    checked_files({str(rom_path): record['rom']['sha256'], str(dsd): record['dsd']['sha256']})
    rom = rom_path.read_bytes()
    if len(rom) != record['rom']['bytes']: raise ValueError('ROM size differs')
    snapshot.update({str(rom_path): sha(rom), str(dsd): record['dsd']['sha256']})
    if output.exists() or output.is_symlink(): raise ValueError('output exists; use a fresh directory')
    output.mkdir(parents=True)
    version = subprocess.run([str(dsd), '--version'], capture_output=True, text=True)
    if version.returncode or version.stdout.strip() != record['dsd']['version_stdout']: raise ValueError('DSD version differs')
    sys.path.insert(0, str(ROOT / 'tools/scripts'))
    from verify import prepare_config, expected_modules
    regions = json.loads((ROOT / 'decomp/matching-notes/baseline-t01/executable-regions.json').read_text())
    prepare_config(ROOT, output, expected_modules(regions)); commands = []
    for command in ([dsd, 'rom', 'extract', '-r', rom_path, '-o', output / 'extract'], [dsd, 'delink', '-c', output / 'config/config.yaml']):
        result = subprocess.run(list(map(str, command)), capture_output=True, text=True)
        commands.append({'command': result.args, 'exit_status': result.returncode, 'stdout': result.stdout, 'stderr': result.stderr})
        if result.returncode: raise ValueError('genuine original DSD process failed')
    objects = sorted((output / 'delinks').glob('*.o')); readback = inspect_objects(objects)
    arm9_offset, entry, base, stored_size = struct.unpack_from('<4I', rom, 0x20)
    if (arm9_offset, entry, base, stored_size) != (0x4000, 0x02000800, 0x02000000, 692568): raise ValueError('original ARM9 coordinates differ')
    payload = rom[arm9_offset + 0x326b0:arm9_offset + 0x326dc]
    if sha(payload) != record['identity']['payload_sha256']: raise ValueError('original loaded44 differs')
    images = {'main': (base, rom[arm9_offset:arm9_offset + 656832])}
    table, table_size = struct.unpack_from('<II', rom, 0x50); fat, _ = struct.unpack_from('<II', rom, 0x48)
    if table_size != 14 * 32: raise ValueError('original overlay inventory differs')
    for i in range(14):
        row = struct.unpack_from('<8I', rom, table + i * 32)
        if row[0] != i or row[7]: raise ValueError('unsupported overlay identity/compression')
        start, end = struct.unpack_from('<II', rom, fat + row[6] * 8); images[f'ov{i:03}'] = (row[1], rom[start:end])
    for module, (base, data) in images.items():
        extracted = output / ('extract/arm9/arm9.bin' if module == 'main' else f'extract/arm9_overlays/{module}.bin')
        if extracted.read_bytes() != data: raise ValueError('fresh extracted region differs from original ROM: ' + module)
    for actual, expected in zip(readback['references'], record['incoming_references']):
        base, image = images[actual['module']]; address = int(actual['address'], 16); data = image[address - base:address - base + 4]
        if branch_target(data, address, actual['type']) != 0x020326b0 or data.hex() != expected['loaded_instruction_hex']: raise ValueError('actual incoming loaded branch differs')
    predictions = arithmetic_checks(record)
    snapshot.update({str(p): sha(p.read_bytes()) for p in output.rglob('*') if p.is_file()})
    checked_files(snapshot)
    report = {'status': 'passed', 'scope': 'original-only static grounding', 'target': readback['target'], 'incoming_sites': len(readback['references']),
              'region_qualified_callers': len({(r['module'], r['caller_symbol']) for r in readback['references']}),
              'loaded44_sha256': sha(payload), 'commands': commands, 'arithmetic': predictions,
              'input_and_artifact_sha256': snapshot, 'compiler_or_original_runtime_invoked': False}
    encoded = (json.dumps(report, indent=2) + '\n').encode(); path = output / 'readback.json'
    with path.open('xb') as stream:
        stream.write(encoded); stream.flush(); original = os.fstat(stream.fileno())
        try:
            checked_files(snapshot); current = path.lstat()
            if not stat.S_ISREG(current.st_mode) or (current.st_dev, current.st_ino) != (original.st_dev, original.st_ino) or path.read_bytes() != encoded:
                raise ValueError('published readback ownership/bytes changed')
        except BaseException:
            path.unlink(missing_ok=True); raise
    print(json.dumps({'status': 'passed', 'readback': str(path), 'sites': 62, 'predictions_only': True}))


if __name__ == '__main__':
    try: main()
    except (ValueError, OSError) as error:
        print('blocked: ' + str(error), file=sys.stderr); raise SystemExit(1)
