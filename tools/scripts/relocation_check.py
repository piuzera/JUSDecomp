#!/usr/bin/env python3
"""Check direct dsd ARM RELA destinations against a native linked ELF.

Supports ABS32, legacy ARM PC24 B/BL and Thumb1 PC22 BL/BLX for the current
one-original-gap-object-per-module baseline. The input objects retain dsd's
original symbol offsets and mapping symbols. Input section placement comes
from linked LCF *_START symbols; multiple objects in one module require
per-object placement evidence and remain unresolved. Module hashes and symbol
layout must also be checked by the caller. Veneers and other relocation forms
are not supported and never earn a passing result. Results expose every use
of enclosing-function mode when a source mapping is absent or stale $d.
"""
import argparse
import bisect
import json
import re
import struct
from collections import defaultdict
from pathlib import Path

from native_link import Elf32


class Unresolved(ValueError):
    """The input cannot be checked with the supported direct-relocation rules."""


def _checked_elf(path):
    data = Path(path).read_bytes()
    elf = Elf32(data)
    if struct.unpack_from('<H', data, 40)[0] != 52:
        raise Unresolved('unsupported ELF header size')
    for section in elf.sections:
        if section[1] not in (0, 8) and section[4] + section[5] > len(data):
            raise Unresolved('file-backed section extent exceeds ELF file')
    symtabs = [i for i, s in enumerate(elf.sections) if s[1] == 2]
    if len(symtabs) != 1:
        raise Unresolved('requires exactly one symbol table')
    symtab = elf.sections[elf.sym_index]
    if symtab[9] != 16 or symtab[5] % 16:
        raise Unresolved('unsupported symbol table entry size')
    if not 0 < symtab[6] < len(elf.sections) or elf.sections[symtab[6]][1] != 3:
        raise Unresolved('symbol table sh_link must identify a string table')
    if elf.sections[elf.names_index][1] != 3:
        raise Unresolved('section name table must be a string table')
    for section in elf.sections:
        if section[1] in (4, 9) and section[6] != elf.sym_index:
            raise Unresolved('relocation sh_link must identify the selected symbol table')
    return elf


def _module(path):
    match = re.search(r'@(main|itcm|dtcm|ov\d{3})_\d+\.o$', path.name)
    if not match:
        raise Unresolved(f'unsupported reference module filename: {path.name}')
    name = match[1]
    return 'ARM9' if name == 'main' else name.upper()


def _signed(value, bits):
    return value - (1 << bits) if value & (1 << (bits - 1)) else value


def _decode_branch(kind, raw, place):
    """Return instruction target/state and call flag, rejecting unknown opcodes."""
    if len(raw) != 4:
        raise Unresolved('relocation instruction is outside linked section')
    if kind == 1:
        opcode = struct.unpack('<I', raw)[0]
        if opcode & 0xFE000000 == 0xFA000000:
            delta = _signed(((opcode & 0xFFFFFF) << 2) | ((opcode >> 23) & 2), 26)
            return (place + 8 + delta) & 0xFFFFFFFF, 't', True
        if opcode >> 24 not in (0xEA, 0xEB):
            raise Unresolved('unsupported ARM PC24 opcode; requires unconditional B/BL/BLX')
        delta = _signed((opcode & 0xFFFFFF) << 2, 26)
        return (place + 8 + delta) & 0xFFFFFFFF, 'a', bool(opcode & 0x1000000)
    high, low = struct.unpack('<HH', raw)
    if high & 0xF800 != 0xF000 or low & 0xF800 not in (0xF800, 0xE800):
        raise Unresolved('unsupported Thumb PC22 opcode; requires Thumb1 BL/BLX')
    thumb = bool(low & 0x1000)
    if not thumb and low & 1:
        raise Unresolved('invalid Thumb BLX alignment encoding')
    delta = _signed(((high & 0x7FF) << 12) | ((low & 0x7FF) << 1), 23)
    pc = place + 4 if thumb else (place + 4) & ~3
    return (pc + delta) & 0xFFFFFFFF, 't' if thumb else 'a', True


def validate_relocations(reference_objects: list[Path], linked_elf: Path) -> dict:
    """Return passed/failed/unresolved plus counts and up to 100 findings.

    Every RELA slot contributes exactly once to validated, failed or unresolved.
    Unknown relocation types, absent symbols, ambiguous provenance and implicit
    REL inputs are unresolved. A wrong direct target, mode or section is failed.
    Empty inputs and inventories with no relocations cannot pass.
    """
    counts = {'total': 0, 'validated': 0, 'failed': 0, 'unresolved': 0}
    result = {'status': 'unresolved', 'counts': counts, 'relocation_types': {},
              'modules': {}, 'findings': [], 'findings_truncated': False,
              'placement_scope': 'one_original_gap_object_per_module',
              'source_mode_fallbacks': {'count': 0, 'contexts': []}}

    def record(status, reason, context=None):
        counts[status] += 1
        if context and context.get('module'):
            module_counts = result['modules'][context['module']]
            module_counts[status] += 1
        if status != 'validated':
            if len(result['findings']) < 100:
                result['findings'].append(dict(context or {}, reason=reason, status=status))
            else:
                result['findings_truncated'] = True

    try:
        if not reference_objects:
            raise Unresolved('empty reference object inventory')
        linked = _checked_elf(linked_elf)
        if struct.unpack_from('<H', linked.data, 16)[0] != 2:
            raise Unresolved('linked ELF must be executable ET_EXEC')
        linked_symbols = defaultdict(list)
        for symbol in linked.symbols():
            if symbol[5]:
                linked_symbols[linked.symbol_name(symbol)].append(symbol)
        linked_sections = {}
        for index, section in enumerate(linked.sections):
            name = linked.section_name(section)
            region = {'.arm9': 'ARM9', '.itcm': 'ITCM', '.dtcm': 'DTCM'}.get(name)
            if re.fullmatch(r'\.ov\d{3}', name):
                region = name[1:].upper()
            if re.fullmatch(r'ARM9|ITCM|DTCM|OV\d{3}', name):
                region = name
            if region:
                if region in linked_sections:
                    raise Unresolved(f'duplicate linked module section: {region}')
                linked_sections[region] = index

        references = []
        definitions = defaultdict(list)
        branch_names = set()
        reference_modules = set()
        for path in reference_objects:
            path = Path(path)
            region = _module(path)
            if region in reference_modules:
                raise Unresolved(f'multiple reference objects in {region}: per-object section placement evidence required')
            reference_modules.add(region)
            if region not in linked_sections:
                raise Unresolved(f'linked module section missing: {region}')
            elf = _checked_elf(path)
            if struct.unpack_from('<H', elf.data, 16)[0] != 1:
                raise Unresolved(f'reference must be relocatable ET_REL: {path.name}')
            symbols = elf.symbols()
            reference = {'path': path, 'module': region, 'elf': elf,
                         'symbols': symbols, 'mappings': defaultdict(list)}
            references.append(reference)
            for index, symbol in enumerate(symbols):
                name = elf.symbol_name(symbol)
                if name in ('$a', '$t', '$d') or re.fullmatch(r'\$[atd]\..+', name):
                    reference['mappings'][symbol[5]].append((symbol[1], name[1]))
                if symbol[5] and symbol[3] >> 4:
                    definitions[name].append((reference, index))
            for entries in reference['mappings'].values():
                entries.sort()
            for section in elf.sections:
                if section[1] == 4:
                    if section[9] != 12 or section[5] % 12:
                        raise Unresolved('invalid ARM RELA entry size')
                    for _, info, _ in struct.iter_unpack('<IIi', elf.content(section)):
                        if info >> 8 >= len(symbols):
                            raise Unresolved('RELA symbol index is outside symbol table')
                        if info & 255 in (1, 10):
                            branch_names.add(elf.symbol_name(symbols[info >> 8]))
                elif section[1] == 9:
                    raise Unresolved('implicit REL input unsupported; requires explicit RELA')

        def marker(name, region):
            candidates = [s for s in linked_symbols[name]
                          if s[5] == linked_sections[region]]
            if len(candidates) != 1:
                raise Unresolved(f'missing or ambiguous layout marker {name} in {region}')
            return candidates[0][1]

        def placement(reference, section_index):
            elf, region = reference['elf'], reference['module']
            if not 0 < section_index < len(elf.sections):
                raise Unresolved('unsupported reference symbol section index')
            name = elf.section_name(elf.sections[section_index])
            if name not in ('.text', '.init', '.rodata', '.ctor', '.data', '.bss'):
                raise Unresolved(f'unsupported input section {name}')
            return marker(region + '_' + name[1:].upper() + '_START', region)

        def mode(reference, symbol):
            mappings = reference['mappings'].get(symbol[5], ())
            index = bisect.bisect_right(mappings, (symbol[1] & ~1, 'z')) - 1
            return mappings[index][1] if index >= 0 else None

        def resolve(reference, symbol_index):
            symbol = reference['symbols'][symbol_index]
            name = reference['elf'].symbol_name(symbol)
            if not symbol[5]:
                candidates = definitions[name]
                if len(candidates) == 1:
                    reference, symbol_index = candidates[0]
                    symbol = reference['symbols'][symbol_index]
                elif not candidates and name in ('ARM9_CTOR_START',
                                                '__exception_table_start__',
                                                '__exception_table_end__'):
                    anchor = {'ARM9_CTOR_START': 'ARM9_CTOR_START',
                              '__exception_table_start__': 'ARM9_TEXT_END',
                              '__exception_table_end__': 'ARM9_INIT_START'}[name]
                    return name, marker(anchor, 'ARM9'), None, 'ARM9', False
                else:
                    raise Unresolved(f'undefined or ambiguous target symbol: {name}')
            if symbol[5] == 0xFFF1:
                return name, symbol[1], None, None, False
            address = placement(reference, symbol[5]) + symbol[1]
            state = mode(reference, symbol)
            callable_symbol = symbol[3] & 15 == 2 or name in branch_names
            return name, address, state, reference['module'], callable_symbol

        for reference in references:
            elf, region = reference['elf'], reference['module']
            module_counts = result['modules'].setdefault(region, dict.fromkeys(counts, 0))
            for section in elf.sections:
                if section[1] != 4:
                    continue
                for offset, info, addend in struct.iter_unpack('<IIi', elf.content(section)):
                    kind, symbol_index = info & 255, info >> 8
                    counts['total'] += 1
                    module_counts['total'] += 1
                    key = str(kind)
                    result['relocation_types'][key] = result['relocation_types'].get(key, 0) + 1
                    context = {'object': reference['path'].name, 'module': region,
                               'offset': offset, 'type': kind, 'addend': addend}
                    try:
                        if kind not in (1, 2, 10):
                            raise Unresolved(f'unsupported relocation type: {kind}')
                        # sh_info, rather than a .rela.* name, selects the input section.
                        source_base = placement(reference, section[7])
                        source = source_base + offset
                        context['source'] = source
                        input_section = elf.sections[section[7]]
                        if offset + 4 > input_section[5]:
                            raise Unresolved('RELA slot exceeds its input section')
                        name, address, target_mode, target_region, callable_symbol = resolve(reference, symbol_index)
                        context.update(symbol=name, target_module=target_region)
                        target_value = address | int(callable_symbol and target_mode == 't')
                        expected_value = (target_value + addend) & 0xFFFFFFFF
                        candidates = linked_symbols[name]
                        if not candidates:
                            raise Unresolved(f'target symbol missing from linked ELF: {name}')
                        target_index = linked_sections.get(target_region, 0xFFF1)
                        matching_section = [s for s in candidates if s[5] == target_index]
                        if not matching_section:
                            record('failed', 'target symbol belongs to wrong module section', context)
                            continue
                        if not any(s[1] == target_value for s in matching_section):
                            record('failed', 'linked target symbol address or mode differs from reference', context)
                            continue
                        output_section = linked.sections[linked_sections[region]]
                        relative = source - output_section[3]
                        if relative < 0 or relative + 4 > output_section[5] or output_section[1] != 1:
                            raise Unresolved('source slot is outside initialized linked module section')
                        raw = linked.content(output_section)[relative:relative + 4]
                        if kind == 2:
                            actual = struct.unpack('<I', raw)[0]
                            context.update(expected=expected_value, actual=actual)
                            if actual != expected_value:
                                record('failed', 'ABS32 pointer destination/addend differs', context)
                                continue
                        else:
                            source_symbol = (0, offset, 0, 0, 0, section[7])
                            source_mode = mode(reference, source_symbol)
                            if source_mode in (None, 'd'):
                                # dsd may omit a new mapping when code resumes after a literal pool.
                                owners = {mode(reference, s) for s in reference['symbols']
                                          if s[3] & 15 == 2 and s[5] == section[7]
                                          and s[1] <= offset < s[1] + s[2]}
                                if len(owners) == 1 and owners <= {'a', 't'}:
                                    original_mapping = source_mode
                                    source_mode = owners.pop()
                                    fallbacks = result['source_mode_fallbacks']
                                    fallbacks['count'] += 1
                                    fallbacks['contexts'].append(dict(context,
                                        mapping_mode=original_mapping, function_mode=source_mode))
                            if source_mode != ('a' if kind == 1 else 't'):
                                raise Unresolved('reference source mapping disagrees with branch encoding')
                            if target_mode not in ('a', 't'):
                                raise Unresolved('branch target has no reference ARM/Thumb mapping')
                            raw_instruction = elf.content(input_section)[offset:offset + 4]
                            _, _, expected_call = _decode_branch(kind, raw_instruction, source)
                            actual, actual_mode, actual_call = _decode_branch(kind, raw, source)
                            if kind == 1:
                                expected = (address + addend + 8) & 0xFFFFFFFF
                            else:
                                # BLX rounds its relocation displacement, then uses aligned PC.
                                expected = (address + addend + 4) & 0xFFFFFFFF
                                if target_mode == 'a':
                                    delta = address + addend - source
                                    expected = (((source + 4) & ~3) + ((delta + 3) & ~3)) & 0xFFFFFFFF
                            context.update(expected=expected, actual=actual,
                                           expected_mode=target_mode, actual_mode=actual_mode)
                            if actual != expected or actual_mode != target_mode or actual_call != expected_call:
                                record('failed', 'direct branch destination/mode differs; veneers unsupported', context)
                                continue
                        record('validated', '', context)
                    except (Unresolved, ValueError, IndexError, struct.error) as error:
                        record('unresolved', str(error), context)
        if counts['total'] == 0:
            raise Unresolved('reference inventory contains no RELA slots')
    except (OSError, ValueError, IndexError, StopIteration, struct.error) as error:
        record('unresolved', str(error))
    result['status'] = ('failed' if counts['failed'] else
                        'unresolved' if counts['unresolved'] else 'passed')
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--reference', type=Path, action='append', required=True)
    parser.add_argument('--linked-elf', type=Path, required=True)
    args = parser.parse_args()
    result = validate_relocations(args.reference, args.linked_elf)
    print(json.dumps(result, indent=2))
    return 0 if result['status'] == 'passed' else 1


if __name__ == '__main__':
    raise SystemExit(main())
