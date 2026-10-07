#!/usr/bin/env python3
"""Compile declared source TUs and gate their raw objects against dsd references."""
import bisect
import hashlib
import os
import re
import struct
import subprocess
import sys
from pathlib import Path

# The shared ELF validator also serves the independent relocation checker.
_scripts = str(Path(__file__).resolve().parent)
sys.path.insert(0, _scripts)
try:
    from relocation_check import _checked_elf
finally:
    sys.path.pop(0)


class Unresolved(ValueError):
    pass


def require_unit_context(unit, compiler_hash, runner_hash, source):
    compiler = unit.get('compiler', {})
    if not compiler.get('package') or compiler.get('sha256') != compiler_hash:
        raise ValueError('TU compiler differs from declared compiler pin')
    if compiler.get('runner_sha256') != runner_hash:
        raise ValueError('TU compiler runner differs from declared runner pin')
    abi = unit.get('abi', {})
    if (abi.get('language') not in ('C', 'C++') or abi.get('instruction_mode') not in ('arm', 'thumb')
            or abi.get('endianness') != 'little' or abi.get('pointer_bits') != 32
            or abi.get('settings') != 'pinned compiler defaults'):
        raise ValueError('TU ABI context missing or unsupported')
    require_header_free(source, unit.get('flags', []), unit.get('headers'), unit.get('include_paths'))


def require_header_free(source, flags, headers, include_paths):
    if headers != {} or include_paths:
        raise Unresolved('declared header dependencies require compiler dependency capture')
    if any(flag.startswith(('-I', '-ir', '-isystem', '-prefix', '-include', '-stdinc',
                            '-trigraphs', '@')) for flag in flags):
        raise ValueError('header-free TU cannot force headers or untracked compiler context')
    text = re.sub(r'\\\r?\n', '', source.read_text())
    tokens = r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*.*?\*/|//[^\n]*'
    text = re.sub(tokens, lambda match: re.sub(r'[^\n]', ' ', match[0])
                  if match[0].startswith(('/*', '//')) else match[0], text, flags=re.S)
    if re.search(r'^\s*(?:#|%:)\s*include', text, re.M):
        raise ValueError('header-free TU includes an untracked header')
    if '-nostdinc' not in flags:
        raise ValueError('header-free TU must disable ambient include paths')


def sha256(path):
    digest = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b''):
            digest.update(chunk)
    return digest.hexdigest()


def _object(path):
    elf = _checked_elf(path)
    if struct.unpack_from('<H', elf.data, 16)[0] != 1:
        raise ValueError('source/reference object must be ET_REL')
    symbols = elf.symbols()
    for symbol in symbols:
        if symbol[5] == 0xFFF2:
            raise ValueError('COMMON definition is not an explicit TU placement')
    allocated = {}
    for index, section in enumerate(elf.sections):
        name = elf.section_name(section)
        if section[2] & 2 and section[5]:
            if section[1] not in (1, 8):
                raise Unresolved(f'unsupported allocated section type: {name}')
            if name in allocated:
                raise ValueError(f'duplicate allocated section: {name}')
            allocated[name] = (index, section)
        elif section[1] == 1 and section[5] and not (section[2] & 2):
            if name not in ('.comment', '.ARM.attributes') and not name.startswith('.debug'):
                raise Unresolved(f'unsupported meaningful nonallocated section: {name}')
    return elf, symbols, allocated


def _functions(elf, symbols):
    mappings = {}
    for symbol in symbols:
        name = elf.symbol_name(symbol)
        if name.startswith(('$a', '$t', '$d')) and 0 < symbol[5] < len(elf.sections):
            mappings.setdefault(symbol[5], []).append((symbol[1] & ~1, name[1]))
    for entries in mappings.values():
        entries.sort()
    result = {}
    for symbol in symbols:
        name = elf.symbol_name(symbol)
        if symbol[3] & 15 != 2 or not symbol[5] or name.startswith('$'):
            continue
        if not 0 < symbol[5] < len(elf.sections) or not symbol[2]:
            raise Unresolved(f'function has no concrete extent: {name}')
        section = elf.sections[symbol[5]]
        start = symbol[1] & ~1
        if start + symbol[2] > section[5]:
            raise ValueError(f'function extent exceeds section: {name}')
        entries = mappings.get(symbol[5], ())
        index = bisect.bisect_right(entries, (start, 'z')) - 1
        mode = 't' if symbol[1] & 1 else entries[index][1] if index >= 0 else None
        if mode not in ('a', 't'):
            raise Unresolved(f'function instruction mode unavailable: {name}')
        value = {'name': name, 'offset': start, 'size': symbol[2],
                 'mode': 'arm' if mode == 'a' else 'thumb', 'section': elf.section_name(section)}
        if name in result:
            raise ValueError(f'duplicate function definition: {name}')
        result[name] = value
    return result


def _relocations(elf, symbols, allocated):
    result = []
    for section in elf.sections:
        if section[1] == 9 and section[5]:
            raise Unresolved('unsupported REL input; this compiler contract requires RELA')
        if section[1] != 4 or not section[5]:
            continue
        if section[9] != 12 or section[5] % 12:
            raise Unresolved('unsupported RELA entry size')
        if not 0 < section[7] < len(elf.sections):
            raise ValueError('relocation sh_info outside section table')
        name = elf.section_name(elf.sections[section[7]])
        if name not in allocated:
            # Debug relocations are metadata, not linked initialized bytes.
            if name.startswith('.debug'):
                continue
            raise Unresolved(f'relocation targets an unaccounted section: {name}')
        target = allocated[name][1]
        for offset, info, addend in struct.iter_unpack('<IIi', elf.content(section)):
            ident, kind = info >> 8, info & 255
            if kind not in (1, 2, 10):
                raise Unresolved(f'unsupported source relocation type: {kind}')
            if ident >= len(symbols) or offset + 4 > target[5] or target[1] != 1:
                raise ValueError('relocation symbol/offset outside initialized section')
            raw = elf.content(target)[offset:offset + 4]
            if kind == 1 and struct.unpack('<I', raw)[0] >> 24 not in (0xEA, 0xEB):
                raise Unresolved('unsupported ARM PC24 encoding')
            if kind == 10:
                high, low = struct.unpack('<HH', raw)
                if high & 0xF800 != 0xF000 or low & 0xF800 not in (0xF800, 0xE800):
                    raise Unresolved('unsupported Thumb PC22 encoding')
            symbol = elf.symbol_name(symbols[ident])
            if not symbol:
                raise Unresolved('unnamed section relocation requires canonical target resolution')
            result.append({'section': name, 'offset': offset, 'type': kind,
                           'symbol': symbol, 'addend': addend})
    result.sort(key=lambda r: (r['section'], r['offset']))
    slots = [(r['section'], r['offset']) for r in result]
    if len(slots) != len(set(slots)):
        raise ValueError('overlapping relocation slots')
    for left, right in zip(result, result[1:]):
        if left['section'] == right['section'] and left['offset'] + 4 > right['offset']:
            raise ValueError('overlapping relocation fields')
    return result


def _masked(content, relocations):
    result = bytearray(content)
    for relocation in relocations:
        offset, kind = relocation['offset'], relocation['type']
        if kind == 2:
            result[offset:offset + 4] = bytes(4)
        elif kind == 1:
            word = struct.unpack_from('<I', result, offset)[0]
            struct.pack_into('<I', result, offset, word & 0xFF000000)
        else:
            high, low = struct.unpack_from('<HH', result, offset)
            struct.pack_into('<HH', result, offset, high & 0xF800, low & 0xF800)
    return result


def compare_objects(reference, compiled, functions):
    ref, ref_symbols, ref_sections = _object(reference)
    obj, obj_symbols, obj_sections = _object(compiled)
    if set(ref_sections) != set(obj_sections):
        raise ValueError('allocated section inventory differs; unexpected BSS/extra sections')
    reference_functions, compiled_functions = _functions(ref, ref_symbols), _functions(obj, obj_symbols)
    if set(reference_functions) != set(functions) or reference_functions != compiled_functions:
        raise ValueError('function identities/extents/modes differ from declared reference TU')
    ref_relocations = _relocations(ref, ref_symbols, ref_sections)
    obj_relocations = _relocations(obj, obj_symbols, obj_sections)
    if ref_relocations != obj_relocations:
        raise ValueError('relocation identities/offsets/types/symbols/addends differ')
    sections = []
    for name, (_, expected) in ref_sections.items():
        actual = obj_sections[name][1]
        if (expected[1], expected[2], expected[5]) != (actual[1], actual[2], actual[5]):
            raise ValueError(f'section type/flags/size differ: {name}')
        if expected[1] == 1:
            slots = [r for r in ref_relocations if r['section'] == name]
            if _masked(ref.content(expected), slots) != _masked(obj.content(actual), slots):
                raise ValueError(f'initialized section bytes differ: {name}')
        sections.append({'name': name, 'size': expected[5], 'flags': expected[2],
                         'kind': 'bss' if expected[1] == 8 else 'initialized'})
    return {'status': 'passed', 'sections': sections,
            'functions': list(reference_functions.values()), 'relocations': ref_relocations}


def _inside(root, relative):
    path = (root / relative).resolve()
    if not path.is_relative_to(root.resolve()):
        raise ValueError(f'path escapes declared root: {relative}')
    return path


def build_sources(manifest, root, output, reference_dir, compiler, runner):
    result = {'status': 'failed', 'accepted_units': 0, 'objects': {}, 'units': []}
    try:
        if manifest['schema_version'] != 1 or not manifest['translation_units']:
            raise ValueError('source manifest must declare at least one TU under schema 1')
        names = [Path(unit['object']).name for unit in manifest['translation_units']]
        if len(names) != len(set(names)):
            raise ValueError('duplicate object basenames are ambiguous in dsd LCF')
        root, output, reference_dir = Path(root).resolve(), Path(output).resolve(), Path(reference_dir).resolve()
        compiler, runner = Path(compiler).absolute(), Path(runner).absolute()
        if not compiler.is_file() or not runner.is_file():
            raise ValueError('source compiler/runner missing')
        compiler_hash, runner_hash = sha256(compiler), sha256(runner)
        input_hashes = {str(compiler): compiler_hash, str(runner): runner_hash}
        if output.exists():
            raise ValueError('source output already exists; require a fresh compiler output directory')
        output.mkdir(parents=True)
        for specification in manifest['translation_units']:
            unit = dict(specification, link_name=Path(specification['object']).name, status='failed',
                        compiler_sha256=compiler_hash, runner_sha256=runner_hash)
            result['units'].append(unit)
            source = _inside(root, specification['source'])
            reference = _inside(reference_dir, specification['object'])
            destination = _inside(output, specification['object'])
            if not source.is_file() or source.suffix not in ('.c', '.cc', '.cpp', '.cxx'):
                raise ValueError('declared C/C++ source missing or unsupported')
            if not reference.is_file():
                raise ValueError('declared reference TU missing')
            unit['source_sha256'] = sha256(source)
            unit['reference'] = {'path': str(reference), 'sha256': sha256(reference)}
            if 'compiler' in specification:
                require_unit_context(specification, compiler_hash, runner_hash, source)
            includes = [_inside(root, name) for name in specification['include_paths']]
            if any(not path.is_dir() for path in includes):
                raise ValueError('declared include directory missing')
            unit['include_hashes'] = {str(p.relative_to(root)): sha256(p) for directory in includes
                                      for p in sorted(directory.rglob('*')) if p.is_file()}
            input_hashes.update({str(source): unit['source_sha256'],
                                 str(reference): unit['reference']['sha256']})
            input_hashes.update({str(root / name): digest for name, digest in unit['include_hashes'].items()})
            unit['cpu_flags'] = ['-proc', specification['cpu'], *specification['flags']]
            command = [str(runner), str(compiler), '-c', *unit['cpu_flags']]
            for directory in includes:
                command += ['-I', str(directory)]
            command += ['-o', str(destination), str(source)]
            unit['command'] = command
            destination.parent.mkdir(parents=True, exist_ok=True)
            environment = {key: value for key, value in os.environ.items()
                           if not key.upper().startswith(('MWC', 'MWARM'))}
            completed = subprocess.run(command, cwd=root, env=environment, capture_output=True, text=True)
            unit.update(stdout=completed.stdout, stderr=completed.stderr, exit_status=completed.returncode)
            if destination.is_file():
                unit['compiled'] = {'path': str(destination), 'sha256': sha256(destination)}
            if completed.returncode or not destination.is_file() or destination.is_symlink():
                raise ValueError('source compilation failed or produced no fresh object')
            if sha256(source) != unit['source_sha256'] or sha256(reference) != unit['reference']['sha256']:
                raise ValueError('source/reference changed during compilation')
            unit['checks'] = compare_objects(reference, destination, specification['functions'])
            if 'abi' in specification and any(function['mode'] != specification['abi']['instruction_mode']
                                             for function in unit['checks']['functions']):
                raise ValueError('compiled function mode differs from declared TU ABI')
            unit['status'] = 'passed'
        for name, digest in input_hashes.items():
            if sha256(Path(name)) != digest:
                raise ValueError('source/reference/include/tool changed during build')
        result['input_hashes'] = input_hashes
        result['status'] = 'passed'
        result['accepted_units'] = len(result['units'])
        result['objects'] = {unit['link_name']: unit['compiled']['path'] for unit in result['units']}
    except Exception as error:
        result['status'] = 'unresolved' if isinstance(error, Unresolved) else 'failed'
        result['failure'] = str(error)
    return result
