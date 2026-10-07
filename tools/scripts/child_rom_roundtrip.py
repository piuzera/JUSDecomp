"""Re-encode a verified child ARM9 into its pinned original layout; source credit is zero."""
import argparse
import json
import struct
import subprocess
import tempfile
from pathlib import Path

from other_executables import _number, _region, _sha, expand_blz, verify_extracted_arm9_modules


def repack_child_arm9(child_path, executable_row, native_modules, encoder_path, encoder_sha256, output_path):
    """Require live native images and fresh codec output, preserving all other child bytes.

    The caller must independently establish native link provenance and approve the
    encoder source/hash. This bounded experiment does not grant pipeline or source
    completion based on a caller-provided metadata report.
    """
    row = executable_row
    if row.get('cpu') != 'arm9' or row.get('compression') is not True:
        raise ValueError('child packer scope requires explicitly compressed ARM9')
    child_path, encoder_path, output_path = map(Path, (child_path, encoder_path, output_path))
    paths = {name: Path(path) for name, path in native_modules.items()}
    if output_path.exists():
        raise ValueError('child packer requires a fresh output path')
    input_paths = {'original_child': child_path, 'encoder': encoder_path,
                   **{f'native/{name}': path for name, path in paths.items()}}
    input_hashes = {name: _sha(path.read_bytes()) for name, path in input_paths.items()}
    if input_hashes['encoder'] != encoder_sha256:
        raise ValueError('actual encoder pin differs from approved codec hash')
    child = child_path.read_bytes()
    if _sha(child) != row['identity']['program_sha256']:
        raise ValueError('original child identity differs from pinned inventory')
    offset, entry, base, size = struct.unpack_from('<IIII', child, 0x20)
    if (offset, entry, base, size) != tuple(_number(row[key]) for key in
            ('rom_offset_in_program', 'entry', 'base', 'stored_bytes')):
        raise ValueError('child ARM9 header layout differs from pinned inventory')
    stored = _region(child, offset, size)
    if _sha(stored) != row['stored_sha256']:
        raise ValueError('original compressed ARM9 differs from pinned inventory')
    original_expanded = expand_blz(stored)
    if len(original_expanded) != row['expanded_bytes'] or _sha(original_expanded) != row['expanded_sha256']:
        raise ValueError('original expanded ARM9 differs from pinned inventory')
    modules = {name: path.read_bytes() for name, path in paths.items()}
    module_checks = verify_extracted_arm9_modules(row, modules)
    assembled = bytearray(len(original_expanded))
    cursor = 0
    metadata_bytes = 0
    for interval in sorted(row['remaining_intervals'], key=lambda interval: _number(interval['source_offset'])):
        start, length = _number(interval['source_offset']), interval['bytes']
        if start != cursor or length < 0 or start + length > len(assembled):
            raise ValueError('expanded layout has a gap, overlap or out-of-range interval')
        if interval.get('kind') == 'layout_metadata':
            data = _region(original_expanded, start, length)
            if _sha(data) != interval['hashes']['sha256']:
                raise ValueError('autoload layout metadata differs from pinned inventory')
            metadata_bytes += length
        else:
            data = modules[interval['module']]
        assembled[start:start + length] = data
        cursor += length
    if cursor != len(assembled):
        raise ValueError('expanded layout does not cover the entire ARM9 image')
    pointer_offset = _number(row['module_params']['offset']) + 20
    prefix_size = len(stored) - (struct.unpack_from('<I', stored, len(stored) - 8)[0] & 0xffffff)
    if pointer_offset < 0 or pointer_offset + 4 > prefix_size:
        raise ValueError('generated compression pointer lies outside uncompressed prefix')
    struct.pack_into('<I', assembled, pointer_offset, 0)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='child-arm9-', dir=output_path.parent) as temporary:
        temporary = Path(temporary)
        expanded_path, encoded_path = temporary / 'expanded.bin', temporary / 'encoded.bin'
        expanded_path.write_bytes(assembled)
        command = [str(encoder_path.resolve()), str(expanded_path.resolve()), str(encoded_path.resolve()),
                   str(min(0x4000, prefix_size))]
        process = subprocess.run(command, capture_output=True, text=True)
        if input_hashes != {name: _sha(path.read_bytes()) for name, path in input_paths.items()}:
            raise ValueError('child roundtrip inputs changed during encoding')
        if process.returncode or not encoded_path.is_file():
            raise ValueError(f'fresh encoder output failed: {process.stderr}')
        encoded = bytearray(encoded_path.read_bytes())
    if expand_blz(encoded) != assembled:
        raise ValueError('expanded encoder output differs from joined native images')
    raw_encoded_sha256 = _sha(encoded)
    if len(encoded) != size:
        raise ValueError('compressed encoder size differs from original stored ARM9')
    encoded_prefix = len(encoded) - (struct.unpack_from('<I', encoded, len(encoded) - 8)[0] & 0xffffff)
    if pointer_offset + 4 > encoded_prefix:
        raise ValueError('encoded compression pointer lies outside uncompressed prefix')
    struct.pack_into('<I', encoded, pointer_offset, base + len(encoded))
    if _sha(encoded) != row['stored_sha256']:
        raise ValueError('compressed encoder bytes differ from original stored ARM9')
    rebuilt = bytearray(child)
    rebuilt[offset:offset + size] = encoded
    if _sha(rebuilt) != row['identity']['program_sha256']:
        raise ValueError('whole child ROM hash differs from original')
    with output_path.open('xb') as stream:
        stream.write(rebuilt)
    return {'status': 'binary_roundtrip_verified', 'source_bytes': 0, 'source_functions': 0,
            'source_complete': False, 'task_complete': False,
            'native_modules': module_checks,
            'encoder': {'path': str(encoder_path), 'sha256': encoder_sha256, 'command': command,
                        'raw_encoded_sha256': raw_encoded_sha256},
            'input_hashes': input_hashes, 'expanded_input_sha256': _sha(assembled),
            'stored_arm9_sha256': _sha(encoded), 'stored_arm9_bytes': len(encoded),
            'preserved_layout_metadata_bytes': metadata_bytes,
            'preserved_other_bytes': len(child) - size, 'arm7': 'preserved_binary',
            'output': {'path': str(output_path), 'bytes': len(rebuilt), 'sha256': _sha(rebuilt)},
            'native_link_provenance': 'caller_must_verify_independently'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for option in ('child', 'ledger', 'native', 'encoder', 'encoder-sha256', 'output', 'report'):
        parser.add_argument('--' + option, required=True)
    args = parser.parse_args()
    ledger = json.loads(Path(args.ledger).read_text())
    row = next(row for row in ledger['executables'] if row['cpu'] == 'arm9')
    native = Path(args.native)
    result = repack_child_arm9(args.child, row,
        {name: native / file for name, file in [('main', 'arm9.bin'), ('ITCM', 'itcm.bin'), ('DTCM', 'dtcm.bin')]},
        args.encoder, args.encoder_sha256, args.output)
    Path(args.report).write_text(json.dumps(result, indent=2) + '\n')


if __name__ == '__main__':
    main()
