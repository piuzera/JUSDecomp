"""Verify preserved executable scope; this bootstrap grants no source credit."""
import argparse
import hashlib
import json
import struct
import subprocess
from pathlib import Path


CPU_TARGETS = {'arm7': ('arm7tdmi', 'armv4t'), 'arm9': ('arm946e', 'armv5te')}


def _number(value):
    return int(value, 0) if isinstance(value, str) else value


def _sha(data):
    return hashlib.sha256(data).hexdigest()


def _region(data, start, size):
    if start < 0 or size < 0 or start + size > len(data):
        raise ValueError('executable layout outside program extent')
    return data[start:start + size]


def _words(data, offset, count):
    return struct.unpack('<' + 'I' * count, _region(data, offset, count * 4))


def validate_cpu_policy(cpu, policy):
    """Require a CPU-specific choice; no inherited ARM9 compiler defaults."""
    expected = CPU_TARGETS.get(cpu)
    pins = [policy.get(key, '') for key in ('compiler_sha256', 'runner_sha256')]
    if (expected is None or policy.get('cpu') != cpu or
            (policy.get('processor'), policy.get('isa')) != expected or
            any(len(pin) != 64 or any(c not in '0123456789abcdef' for c in pin) for pin in pins)):
        raise ValueError(f'CPU policy for {cpu} requires explicit processor, ISA and independent compiler/runner pins')
    return dict(policy)


def probe_cpu_compiler(policy, compiler, runner, source, output, instruction_mode):
    """Compile a public fixture to prove CPU selection support, not original matching."""
    if instruction_mode not in ('arm', 'thumb'):
        raise ValueError('CPU probe requires an explicit instruction mode')
    validate_cpu_policy(policy.get('cpu'), policy)
    paths = [Path(path).resolve() for path in (compiler, runner, source)]
    compiler, runner, source = paths
    hashes = [_sha(path.read_bytes()) for path in paths]
    if hashes[:2] != [policy['compiler_sha256'], policy['runner_sha256']]:
        raise ValueError('actual compiler/runner pin differs from CPU-specific policy')
    output = Path(output).resolve()
    if output.exists():
        raise ValueError('CPU probe requires a fresh output path')
    output.parent.mkdir(parents=True, exist_ok=True)
    command = [str(runner), str(compiler), '-proc', policy['processor'],
               '-thumb' if instruction_mode == 'thumb' else '-nothumb',
               '-interworking', '-nostdinc', '-c', str(source), '-o', str(output)]
    process = subprocess.run(command, capture_output=True, text=True)
    if process.returncode or not output.is_file():
        raise ValueError(f'CPU-specific public fixture compilation failed: {process.stderr}')
    if hashes != [_sha(path.read_bytes()) for path in paths]:
        raise ValueError('CPU probe inputs changed during compilation')
    from source_build import _object, _functions
    elf, symbols, _ = _object(output)
    functions = list(_functions(elf, symbols).values())
    if not functions or any(function['mode'] != instruction_mode for function in functions):
        raise ValueError('CPU-specific public fixture instruction mode differs')
    return {'status': 'cpu_target_supported', 'policy': dict(policy),
            'instruction_mode': instruction_mode, 'source_sha256': hashes[2],
            'compiled_sha256': _sha(output.read_bytes()), 'functions': functions,
            'command': command, 'original_compiler_match_verified': False,
            'matched_source_bytes': 0, 'matched_source_functions': 0}


def _nitrofs(data):
    fnt_start, fnt_size = _words(data, 0x40, 2)
    fat_start, fat_size = _words(data, 0x48, 2)
    fnt = _region(data, fnt_start, fnt_size)
    if fat_size % 8 or len(fnt) < 8:
        raise ValueError('NitroFS layout is invalid')
    fat = list(struct.iter_unpack('<II', _region(data, fat_start, fat_size)))
    count = struct.unpack('<H', fnt[6:8])[0]
    _region(fnt, 0, count * 8)
    found, visited = {}, set()

    def walk(index, prefix):
        if index >= count or index in visited:
            raise ValueError('NitroFS directory layout is invalid')
        visited.add(index)
        cursor, file_id, _ = struct.unpack('<IHH', _region(fnt, index * 8, 8))
        while True:
            tag = _region(fnt, cursor, 1)[0]
            cursor += 1
            if not tag:
                break
            name = _region(fnt, cursor, tag & 127).decode('ascii')
            cursor += tag & 127
            path = prefix + name
            if tag & 128:
                child = struct.unpack('<H', _region(fnt, cursor, 2))[0] - 0xf000
                cursor += 2
                walk(child, path + '/')
            else:
                if file_id >= len(fat) or path in found:
                    raise ValueError('NitroFS file layout is invalid')
                found[path] = (file_id, *fat[file_id])
                file_id += 1
    walk(0, '')
    return found


def expand_blz(data):
    """Decode backward LZ with bounds checks and preserve module-parameter bytes."""
    length_header, extra = _words(data, len(data) - 8, 2)
    length, header = length_header & 0xffffff, length_header >> 24
    if not extra or header < 8 or length < header or length > len(data):
        raise ValueError('invalid compressed ARM9 footer')
    prefix, cursor = len(data) - length, len(data) - header
    out = bytearray(data) + bytearray(extra)
    write = len(out)
    while cursor > prefix:
        cursor -= 1
        flags = data[cursor]
        for bit in range(7, -1, -1):
            if cursor == prefix:
                break
            if flags & (1 << bit):
                if cursor - 2 < prefix:
                    raise ValueError('compressed ARM9 token underflow')
                cursor -= 2
                token = data[cursor] | (data[cursor + 1] << 8)
                size, distance = (token >> 12) + 3, (token & 0xfff) + 3
                for _ in range(size):
                    write -= 1
                    if write < prefix or write + distance >= len(out):
                        raise ValueError('compressed ARM9 back reference outside output')
                    out[write] = out[write + distance]
            else:
                cursor -= 1
                write -= 1
                if write < prefix:
                    raise ValueError('compressed ARM9 output underflow')
                out[write] = data[cursor]
    if write != prefix:
        raise ValueError('compressed ARM9 output extent differs')
    return bytes(out)


def _cpu_region(program, item, cpu, program_id, parent_sha):
    label = f'{program_id}/{cpu}'
    expected = (_number(item['rom_offset']), _number(item['entry']),
                _number(item['base']), item['stored_bytes'])
    actual = _words(program, 0x30 if cpu == 'arm7' else 0x20, 4)
    if actual != expected:
        raise ValueError(f'{label} executable layout differs from pinned header')
    offset, entry, base, size = actual
    payload = _region(program, offset, size)
    if _sha(payload) != item['stored_hashes']['sha256']:
        raise ValueError(f'{label} executable payload differs from pinned original')
    row = {'identity': {'rom_sha256': parent_sha, 'program': program_id,
                       'program_sha256': _sha(program), 'cpu': cpu},
           'module': cpu, 'base': base, 'entry': entry, 'stored_bytes': size,
           'stored_sha256': _sha(payload), 'rom_offset_in_program': offset,
           'cpu': cpu, 'processor': CPU_TARGETS[cpu][0], 'isa': CPU_TARGETS[cpu][1],
           'compression': item.get('compressed', 'unresolved'),
           'source_bytes': 0, 'source_functions': 0, 'linked_baseline': False,
           'remaining_symbols': None, 'symbol_inventory_status': 'unresolved',
           'fallback_stored_bytes': size, 'internal_sections': item.get('internal_sections', {}),
           'compiler_match': 'unresolved', 'link_metadata': 'unresolved'}
    if cpu == 'arm9':
        expanded = expand_blz(payload) if item['compressed'] else payload
        if item.get('expanded_hashes') and _sha(expanded) != item['expanded_hashes']['sha256']:
            raise ValueError(f'{label} expanded payload differs from pinned original')
        main, autos = item['main'], item['autoloads']
        intervals = [dict(main, module='main', source_offset=0)]
        intervals += [dict(auto, module=auto['kind'], source_offset=_number(auto['source_offset_in_expanded_arm9']))
                      for auto in autos]
        for interval in intervals:
            blob = _region(expanded, interval['source_offset'], interval['bytes'])
            if _sha(blob) != interval['hashes']['sha256']:
                raise ValueError(f'{label} {interval["module"]} expanded payload differs')
            interval.update(source_bytes=0, remaining_symbols=None)
        covered_end = max(interval['source_offset'] + interval['bytes'] for interval in intervals)
        if covered_end < len(expanded):
            intervals.append({'module': 'autoload_table_or_footer', 'kind': 'layout_metadata',
                              'source_offset': covered_end, 'bytes': len(expanded) - covered_end,
                              'hashes': {'sha256': _sha(expanded[covered_end:])}, 'source_bytes': 0,
                              'remaining_symbols': None})
        row.update(expanded_bytes=len(expanded), expanded_sha256=_sha(expanded),
                   remaining_intervals=intervals, module_params=item.get('module_params', {}))
    else:
        row['remaining_intervals'] = [{'module': 'unclassified', 'load_base': base,
                                      'stored_offset_start': 0, 'stored_offset_end': size,
                                      'expanded_layout': 'unresolved', 'stored_bytes': size, 'source_bytes': 0,
                                      'remaining_symbols': None, 'kind': 'unknown'}]
    overlay_offset, overlay_size = _words(program, 0x58 if cpu == 'arm7' else 0x50, 2)
    if overlay_offset or overlay_size:
        raise ValueError(f'{label} overlay scope requires explicit inventory and verification')
    return row


def verify_other_executables(rom, pinned_inventory):
    """Return a precise residual ledger after checking the pinned program bytes."""
    inventory = pinned_inventory
    expected_sha = inventory['rom']['hashes']['sha256']
    entries = inventory['embedded_executables']
    paths = [entry['path'] for entry in entries]
    if len(paths) != len(set(paths)) or set(paths) != set(inventory['nitrofs']['direct_nds_header_candidates']):
        raise ValueError('embedded executable scope differs from pinned inventory')
    if inventory['regions']['arm7_overlays']:
        raise ValueError('ARM7 overlay scope unsupported by this bootstrap')
    rows = [_cpu_region(rom, inventory['regions']['arm7'], 'arm7', 'parent', expected_sha)]
    files = _nitrofs(rom)
    for entry in entries:
        path = entry['path']
        start, size = _number(entry['rom_offset']), entry['bytes']
        if files.get(path) != (entry['file_id'], start, start + size):
            raise ValueError(f'embedded executable NitroFS layout differs for {path}')
        child = _region(rom, start, size)
        for cpu in ('arm9', 'arm7'):
            rows.append(_cpu_region(child, entry['regions'][cpu], cpu, path, expected_sha))
        if _sha(child) != entry['hashes']['sha256']:
            raise ValueError(f'embedded program identity differs for {path}')
    if len(rom) != inventory['rom']['bytes'] or _sha(rom) != expected_sha:
        raise ValueError('ROM identity differs from pinned original')
    return {'schema_version': 1, 'task': 'jus-bjry.10', 'status': 'preserved_binary_verified',
            'linked_baseline': False, 'source_complete': False, 'task_complete': False,
            'rom_sha256': expected_sha, 'executables': rows,
            'coverage': {'matched_source_bytes': 0, 'matched_source_functions': 0,
                         'known_stored_fallback_bytes': sum(row['stored_bytes'] for row in rows),
                         'global_percent': None, 'scope_uncertainty': inventory['nitrofs']['scope_uncertainty']},
            'remaining_work': ['CPU-specific ARM7 section/function/relocation discovery and link baseline',
                               'Independently matched compiler/ABI policy for each CPU and program',
                               'Source promotion of every residual executable interval',
                               'Recursive executable discovery in proprietary asset containers']}


def verify_extracted_payload(executable, payload):
    if len(payload) != executable['stored_bytes'] or _sha(payload) != executable['stored_sha256']:
        raise ValueError('fresh extracted payload differs from pinned executable')
    return {'status': 'passed', 'sha256': _sha(payload), 'bytes': len(payload), 'matched_source_bytes': 0}


def verify_extracted_arm9_modules(executable, modules):
    intervals = [row for row in executable['remaining_intervals'] if row.get('kind') != 'layout_metadata']
    if set(modules) != {row['module'] for row in intervals}:
        raise ValueError('fresh extracted ARM9 module scope differs')
    results = {}
    for row in intervals:
        name, payload = row['module'], bytes(modules[row['module']])
        raw_hash = _sha(payload)
        domain = 'original expanded module bytes'
        if name == 'main' and executable['compression'] is True:
            params = executable['module_params']
            offset = _number(params['offset']) + 20
            value = _words(payload, offset, 1)[0]
            expected = _number(params['compressed_static_end'])
            if value not in (0, expected):
                raise ValueError('fresh extracted ARM9 module compression pointer differs')
            if value == 0:
                patched = bytearray(payload)
                struct.pack_into('<I', patched, offset, expected)
                payload = bytes(patched)
                domain = 'original pointer restored from pinned metadata'
        if len(payload) != row['bytes'] or _sha(payload) != row['hashes']['sha256']:
            raise ValueError(f'fresh extracted ARM9 module {name} differs from pinned original')
        results[name] = {'status': 'passed', 'bytes': len(payload), 'raw_extracted_sha256': raw_hash,
                         'compared_sha256': _sha(payload), 'hash_domain': domain, 'matched_source_bytes': 0}
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rom', type=Path, required=True)
    parser.add_argument('--inventory', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    report = verify_other_executables(args.rom.read_bytes(), json.loads(args.inventory.read_text()))
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + '\n')


if __name__ == '__main__':
    main()
