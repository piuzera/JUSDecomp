"""Prove source section ownership; credit coverage only after the final gate."""
import hashlib
import re
from collections import defaultdict
from pathlib import Path

from relocation_check import _checked_elf


def _hash(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def _region(module):
    return 'ARM9' if module in ('main', 'ARM9') else module.upper()


def _layout(config_dir):
    layout = {}
    pattern = re.compile(r'\s*(\.\w+)\s+start:(0x[0-9a-fA-F]+)\s+'
                         r'end:(0x[0-9a-fA-F]+)(?:\s+kind:(\w+))?(?:\s+.*)?')
    for path in sorted(Path(config_dir).rglob('delinks.txt')):
        region = _region(path.parent.name if path.parent != Path(config_dir) else 'main')
        sections, units = {}, {}
        target = sections
        for line in path.read_text().splitlines():
            line = line.split('#', 1)[0].rstrip()
            if not line.strip():
                continue
            if line.strip() == 'complete' and target is not sections:
                continue
            match = pattern.fullmatch(line)
            if match:
                name, start, end, kind = match.groups()
                start, end = int(start, 16), int(end, 16)
                if end < start or name in target:
                    raise ValueError('invalid or duplicate authoritative section extent')
                if target is not sections:
                    original = sections.get(name)
                    if not original or not (original['start'] <= start <= end <= original['end']):
                        raise ValueError('authoritative TU extent exceeds module section')
                    if kind and kind != original['kind']:
                        raise ValueError('authoritative TU section kind differs from module')
                    kind = original['kind']
                if kind is None:
                    raise ValueError('module section lacks authoritative kind')
                target[name] = {'start': start, 'end': end, 'kind': kind}
            elif line.strip().endswith(':'):
                name = line.strip()[:-1]
                if name in units:
                    raise ValueError('duplicate authoritative TU declaration')
                target = units.setdefault(name, {})
            else:
                raise ValueError(f'unsupported delinks declaration: {line.strip()}')
        layout[region] = {'sections': sections, 'units': units, 'symbols': path.with_name('symbols.txt')}
    if not layout:
        raise ValueError('missing authoritative module layout')
    return layout


def _allocated(elf):
    result = {}
    for index, section in enumerate(elf.sections):
        if section[2] & 2 and section[5]:
            name = elf.section_name(section)
            if name in result:
                raise ValueError('duplicate allocated input section')
            result[name] = (index, section)
    return result


def _functions(elf):
    return {elf.symbol_name(symbol): symbol for symbol in elf.symbols()
            if symbol[5] and symbol[3] & 15 == 2 and symbol[2]
            and not elf.symbol_name(symbol).startswith('$')}


def _map_sections(path):
    rows = []
    output_section = None
    output_pattern = re.compile(r'\s*[0-9a-fA-F]+\s+[0-9a-fA-F]+\s+'
                                r'[0-9a-fA-F]+\s+\d+ (\.\w+)\s*')
    pattern = re.compile(r'\s*([0-9a-fA-F]+)\s+([0-9a-fA-F]+)\s+'
                         r'([0-9a-fA-F]+)\s+\d+\s+(.+):\(([^)]+)\)\s*')
    for line in Path(path).read_text().splitlines():
        output_match = output_pattern.fullmatch(line)
        if output_match:
            output_section = output_match[1]
        match = pattern.fullmatch(line)
        if match:
            address, _, size, owner, section = match.groups()
            owner = Path(owner.strip('"'))
            if not owner.is_absolute():
                owner = Path(path).parent / owner
            rows.append({'owner': owner.resolve(), 'section': section,
                         'start': int(address, 16), 'bytes': int(size, 16),
                         'output_section': output_section})
    return rows


def _code_intervals(elf, index, start, size, region, name):
    mappings = defaultdict(set)
    for symbol in elf.symbols():
        symbol_name = elf.symbol_name(symbol)
        if symbol[5] == index and re.fullmatch(r'\$[atd](?:\..*)?', symbol_name):
            offset = symbol[1] & ~1
            if offset <= size:
                mappings[offset].add(symbol_name[1])
    if any(len(modes) != 1 for modes in mappings.values()):
        raise ValueError('conflicting source reference mapping symbols')
    points = sorted({0, size, *mappings})
    mode = None
    intervals = []
    for left, right in zip(points, points[1:]):
        if left in mappings:
            mode = next(iter(mappings[left]))
        category = 'instructions' if mode in ('a', 't') else 'literals' if mode == 'd' else 'unknown'
        intervals.append({'module': region, 'section': name, 'start': start + left,
                          'end': start + right, 'category': category})
    return intervals


def verify_source_ownership(source_build, link_inputs, lcf, link_map_path, linked_elf, config_dir):
    """Return verified source extents. This does not grant source coverage."""
    if source_build.get('status') != 'passed':
        raise ValueError('source build did not pass')
    units = source_build.get('units', [])
    if not units:
        return {'status': 'passed', 'accepted_intervals': [], 'functions': []}
    layout = _layout(config_dir)
    map_record = link_inputs['link_map']
    if Path(map_record['path']).resolve() != Path(link_map_path).resolve() or _hash(link_map_path) != map_record['sha256']:
        raise ValueError('link map path/hash differs from actual link record')
    rows = _map_sections(link_map_path)
    linked = _checked_elf(linked_elf)
    linked_functions = _functions(linked)
    actual_inputs = {Path(item['path']).resolve(): item['sha256'] for item in link_inputs['inputs']}
    command_inputs = {Path(token).resolve() for token in link_inputs['command'] if token.endswith('.o')}
    accepted, functions = [], []
    seen = set()
    for unit in units:
        if unit.get('status') != 'passed':
            raise ValueError('source TU did not pass object checks')
        region, object_name = _region(unit['module']), unit['object']
        link_name = unit.get('link_name', object_name)
        if (region, object_name) in seen:
            raise ValueError('duplicate promoted source TU')
        seen.add((region, object_name))
        matches = [o for o in link_inputs['objects'] if o['filename'] == link_name]
        if len(matches) != 1 or matches[0].get('kind') != 'source':
            raise ValueError('source TU is not the actual selected object')
        record = matches[0]
        compiled = Path(unit['compiled']['path']).resolve()
        reference = Path(unit['reference']['path']).resolve()
        selected = Path(record['normalized']).resolve()
        if compiled != Path(record['compiled']).resolve() or reference != Path(record['reference']).resolve():
            raise ValueError('source/reference object paths differ between build and link')
        if reference in actual_inputs or reference in command_inputs or str(reference) in lcf:
            raise ValueError('original TU reference is still selected')
        if '-T' in link_inputs['command']:
            script = Path(link_inputs['command'][link_inputs['command'].index('-T') + 1]).read_text()
            if str(reference) in script:
                raise ValueError('original TU reference is still selected by linker script')
        if selected not in actual_inputs or selected not in command_inputs:
            raise ValueError('source object is absent from actual linker argv')
        for path, expected in ((compiled, unit['compiled']['sha256']),
                               (compiled, record['compiled_sha256']),
                               (reference, unit['reference']['sha256']),
                               (reference, record['reference_sha256']),
                               (selected, record['normalized_sha256']),
                               (selected, actual_inputs[selected])):
            if _hash(path) != expected:
                raise ValueError('source/reference/selected object hash differs')
        if not re.search(r'(?<![\w/])' + re.escape(link_name) + r'\(', lcf):
            raise ValueError('promoted source TU is absent from LCF')
        declarations = layout[region]['units']
        authoritative = declarations.get(unit['source'])
        if authoritative is None:
            authoritative = declarations.get(unit['source'].removeprefix('decomp/'))
        if authoritative is None:
            authoritative = declarations.get(object_name.removesuffix('.o'))
        if authoritative is None:
            raise ValueError('source TU lacks authoritative delinks extents')
        ref, raw, chosen = map(_checked_elf, (reference, compiled, selected))
        ref_sections, raw_sections, chosen_sections = map(_allocated, (ref, raw, chosen))
        nonempty = {name: extent for name, extent in authoritative.items() if extent['end'] > extent['start']}
        if not (set(ref_sections) == set(raw_sections) == set(chosen_sections) == set(nonempty)):
            raise ValueError('source allocated sections differ from authoritative TU sections')
        placements = {}
        first_interval = len(accepted)
        for name, extent in nonempty.items():
            index, ref_section = ref_sections[name]
            _, raw_section = raw_sections[name]
            _, selected_section = chosen_sections[name]
            expected_size = extent['end'] - extent['start']
            if any(section[5] != expected_size for section in (ref_section, raw_section, selected_section)):
                raise ValueError('source input section size differs from authoritative extent')
            if (raw_section[1], raw_section[2]) != (selected_section[1], selected_section[2]):
                raise ValueError('selected source section type/flags changed')
            if raw_section[1] != 8 and raw.content(raw_section) != chosen.content(selected_section):
                raise ValueError('selected source allocated section bytes changed')
            owners = [row for row in rows if row['owner'] == selected and row['section'] == name]
            if len(owners) != 1:
                raise ValueError('link map does not prove unique source section ownership')
            if owners[0]['start'] != extent['start'] or owners[0]['bytes'] != expected_size:
                raise ValueError('source section map address/extent differs from original TU')
            output_name = '.arm9' if region == 'ARM9' else '.' + region.lower()
            if owners[0]['output_section'] != output_name:
                raise ValueError('source section map ownership belongs to wrong module')
            outputs = [s for s in linked.sections if linked.section_name(s) == output_name]
            if len(outputs) != 1 or not (outputs[0][3] <= extent['start'] <= extent['end'] <= outputs[0][3] + outputs[0][5]):
                raise ValueError('source section extent is outside linked module')
            placements[index] = extent['start']
            if extent['kind'] == 'code':
                accepted.extend(_code_intervals(ref, index, extent['start'], expected_size, region, name))
            else:
                category = {'rodata': 'rodata', 'data': 'data', 'bss': 'bss'}.get(extent['kind'], 'unknown')
                accepted.append({'module': region, 'section': name, 'start': extent['start'],
                                 'end': extent['end'], 'category': category})
        for interval in accepted[first_interval:]:
            interval['implementation_category'] = unit.get('category', 'unknown')
        ref_functions, raw_functions, chosen_functions = map(_functions, (ref, raw, chosen))
        if not (set(ref_functions) == set(raw_functions) == set(chosen_functions)):
            raise ValueError('source function inventory differs from reference TU')
        for name, symbol in ref_functions.items():
            if symbol[5] not in placements:
                raise ValueError('source function is outside promoted section')
            expected_value = placements[symbol[5]] + (symbol[1] & ~1)
            # Reference mapping is authoritative; dsd stores even Thumb values.
            section_modes = [(s[1] & ~1, ref.symbol_name(s)[1]) for s in ref.symbols()
                             if s[5] == symbol[5] and re.fullmatch(r'\$[atd](?:\..*)?', ref.symbol_name(s))
                             and (s[1] & ~1) <= (symbol[1] & ~1)]
            mode = max(section_modes, default=(0, None))[1]
            if mode not in ('a', 't'):
                raise ValueError('source function has no authoritative ARM/Thumb mode')
            expected_value |= mode == 't'
            for candidate, owner in ((raw_functions[name], raw), (chosen_functions[name], chosen)):
                candidate_section = owner.section_name(owner.sections[candidate[5]])
                if (candidate_section != ref.section_name(ref.sections[symbol[5]])
                        or candidate[2] != symbol[2] or (candidate[1] & ~1) != (symbol[1] & ~1)):
                    raise ValueError('source function offset/size/mode differs from reference')
                mappings = [(s[1] & ~1, owner.symbol_name(s)[1]) for s in owner.symbols()
                            if s[5] == candidate[5] and re.fullmatch(r'\$[atd](?:\..*)?', owner.symbol_name(s))
                            and (s[1] & ~1) <= (candidate[1] & ~1)]
                if max(mappings, default=(0, None))[1] != mode:
                    raise ValueError('source function ARM/Thumb mode differs from reference')
            candidate = linked_functions.get(name)
            if not candidate or candidate[1] != expected_value or candidate[2] != symbol[2]:
                raise ValueError('linked source function address/size/mode differs')
            if linked.section_name(linked.sections[candidate[5]]) != output_name:
                raise ValueError('linked source function belongs to wrong module')
            functions.append({'module': region, 'name': name, 'start': expected_value & ~1,
                              'end': (expected_value & ~1) + symbol[2], 'mode': mode,
                              'implementation_category': unit.get('category', 'unknown')})
    return {'status': 'passed', 'accepted_intervals': accepted, 'functions': functions}


def _union_size(intervals):
    total, end = 0, None
    for start, stop in sorted(intervals):
        if stop < start:
            raise ValueError('invalid coverage interval')
        if end is None or start > end:
            total += stop - start
        elif stop > end:
            total += stop - end
        end = max(stop, end if end is not None else stop)
    return total


def _require_unambiguous_labels(groups):
    for intervals in groups.values():
        label_ends = {}
        for start, end, label in sorted(intervals):
            if any(previous_end > start for previous_label, previous_end in label_ends.items()
                   if previous_label != label):
                raise ValueError('conflicting coverage categories overlap')
            label_ends[label] = max(end, label_ends.get(label, end))


def summarize_coverage(ownership, config_dir, verification_passed=False):
    """Count unique extents; the caller must supply the completed gate result."""
    layout = _layout(config_dir)
    totals = defaultdict(int)
    initialized = 0
    module_totals = {}
    module_initialized = {}
    original_functions = set()
    for region, module in layout.items():
        base = min(extent['start'] for extent in module['sections'].values())
        bss = module['sections'].get('.bss')
        initialized_end = bss['start'] if bss else max(extent['end'] for extent in module['sections'].values())
        module_initialized[region] = initialized_end - base
        initialized += module_initialized[region]
        module_totals[region] = defaultdict(int)
        for extent in module['sections'].values():
            size = extent['end'] - extent['start']
            totals[extent['kind']] += size
            module_totals[region][extent['kind']] += size
        if module['symbols'].is_file():
            for match in re.finditer(r'\S+\s+kind:function\((arm|thumb),size=(0x[0-9a-fA-F]+)\)\s+addr:(0x[0-9a-fA-F]+)', module['symbols'].read_text()):
                mode, size, address = match.groups()
                size, address = int(size, 16), int(address, 16) & ~1
                if size:
                    original_functions.add((region, address, address + size, mode))
    credited = verification_passed and ownership.get('status') == 'passed'
    grouped = defaultdict(list)
    implementations = defaultdict(list)
    implementation_labels = defaultdict(list)
    if credited:
        for item in ownership.get('accepted_intervals', []):
            module = layout[item['module']]
            extent = module['sections'][item['section']]
            if not (extent['start'] <= item['start'] <= item['end'] <= extent['end']):
                raise ValueError('credited source interval exceeds original module section')
            grouped[(item['module'], item['section'], item['category'])].append((item['start'], item['end']))
            implementation = item.get('implementation_category', 'unknown')
            if item['category'] != 'bss':
                implementations[(item['module'], item['section'], implementation)].append((item['start'], item['end']))
            implementation_labels[(item['module'], item['section'])].append((item['start'], item['end'], implementation))
    matched = defaultdict(int)
    module_matched = defaultdict(lambda: defaultdict(int))
    classifications = defaultdict(list)
    for (module, section, category), intervals in grouped.items():
        classifications[(module, section)].extend((start, end, category) for start, end in intervals)
    _require_unambiguous_labels(classifications)
    _require_unambiguous_labels(implementation_labels)
    for (module, _, category), intervals in grouped.items():
        size = _union_size(intervals)
        matched[category] += size
        module_matched[module][category] += size
    functions = {(f['module'], f['start'], f['end'], 'arm' if f['mode'] == 'a' else 'thumb')
                 for f in ownership.get('functions', [])} if credited else set()
    if not functions <= original_functions:
        raise ValueError('credited source functions differ from original symbol inventory')
    declared_initialized = sum(size for kind, size in totals.items() if kind != 'bss')
    source_initialized = sum(size for category, size in matched.items() if category != 'bss')
    if source_initialized > declared_initialized or matched['bss'] > totals['bss']:
        raise ValueError('source coverage exceeds original module extents')
    function_intervals = defaultdict(list)
    for region, start, end, _ in original_functions:
        function_intervals[region].append((start, end))
    known_function_bytes = sum(_union_size(v) for v in function_intervals.values())
    implementation_bytes = defaultdict(lambda: defaultdict(int))
    implementation_functions = defaultdict(lambda: defaultdict(set))
    for (module, _, category), intervals in implementations.items():
        implementation_bytes[module][category] += _union_size(intervals)
    if credited:
        for function in ownership.get('functions', []):
            implementation_functions[function['module']][function.get('implementation_category', 'unknown')].add(
                (function['start'], function['end'], function['mode']))
    categories = {'game', 'sdk', 'unknown'}
    categories.update(category for values in implementation_bytes.values() for category in values)
    categories.update(category for values in implementation_functions.values() for category in values)
    modules = {}
    for module, sizes in module_totals.items():
        counts = module_matched[module]
        source_bytes = sum(size for kind, size in counts.items() if kind != 'bss')
        typed_bytes = sum(size for kind, size in sizes.items() if kind != 'bss')
        if source_bytes > typed_bytes or counts['bss'] > sizes['bss']:
            raise ValueError('source coverage exceeds original module extents')
        modules[module] = {
            'matched_source_bytes': source_bytes,
            'initialized_bytes': module_initialized[module],
            'initialized_percent': 100 * source_bytes / module_initialized[module] if module_initialized[module] else 0,
            'functions': {'matched': sum(f[0] == module for f in functions),
                          'total': sum(f[0] == module for f in original_functions)},
            'instructions': {'matched_bytes': counts['instructions'], 'total_bytes': None},
            'literals': {'matched_bytes': counts['literals'], 'total_bytes': None},
            'code_sections': {'matched_bytes': counts['instructions'] + counts['literals'],
                              'total_bytes': sizes['code']},
            'rodata': {'matched_bytes': counts['rodata'], 'total_bytes': sizes['rodata']},
            'data': {'matched_bytes': counts['data'], 'total_bytes': sizes['data']},
            'bss': {'matched_bytes': counts['bss'], 'total_bytes': sizes['bss']},
            'binary_fallback': {'initialized_bytes': typed_bytes - source_bytes,
                                'bss_bytes': sizes['bss'] - counts['bss']},
            'unknown': {'source_mapping_bytes': counts['unknown'],
                        'layout_padding_or_generated_bytes': module_initialized[module] - typed_bytes,
                        'code_outside_sized_functions_bytes': max(0, sizes['code'] - _union_size(function_intervals[module]))},
            'implementation_categories': {
                category: {'matched_source_bytes': implementation_bytes[module][category],
                           'matched_functions': len(implementation_functions[module][category])}
                for category in sorted(categories)}}
    category_totals = {
        category: {'matched_source_bytes': sum(m['implementation_categories'][category]['matched_source_bytes'] for m in modules.values()),
                   'matched_functions': sum(m['implementation_categories'][category]['matched_functions'] for m in modules.values())}
        for category in sorted(categories)}
    return {'status': 'credited' if credited else 'not_credited',
            'matched_source_bytes': source_initialized,
            'arm9_initialized_bytes': initialized,
            'arm9_initialized_percent': 100 * source_initialized / initialized if initialized else 0,
            'global_percent': None,
            'functions': {'matched': len(functions), 'total': len(original_functions),
                          'aliases_counted_once': True},
            'instructions': {'matched_bytes': matched['instructions'], 'total_bytes': None},
            'literals': {'matched_bytes': matched['literals'], 'total_bytes': None},
            'code_sections': {'total_bytes': totals['code'],
                              'matched_bytes': matched['instructions'] + matched['literals']},
            'rodata': {'matched_bytes': matched['rodata'], 'total_bytes': totals['rodata']},
            'data': {'matched_bytes': matched['data'], 'total_bytes': totals['data']},
            'bss': {'matched_bytes': matched['bss'], 'total_bytes': totals['bss']},
            'binary_fallback': {'initialized_bytes': declared_initialized - source_initialized,
                                'bss_bytes': totals['bss'] - matched['bss']},
            'unknown': {'source_mapping_bytes': matched['unknown'],
                        'layout_padding_or_generated_bytes': initialized - declared_initialized,
                        'code_outside_sized_functions_bytes': max(0, totals['code'] - known_function_bytes),
                        'instruction_literal_denominators': 'not inventoried for binary fallback',
                        'unbuilt_scopes': ['ARM7', 'embedded_executables'],
                        'container_scan': 'proprietary containers not recursively classified'},
            'implementation_categories': category_totals,
            'modules': modules}
