#!/usr/bin/env python3
"""Bounded experiment: translate dsd 0.12 ARM9 LCF/delinks for native LLVM.

Copies objects into the output directory before normalizing legacy ELF metadata.
Source overrides select compiled complete TUs explicitly; source coverage is checked separately.
"""
import argparse
import bisect
import hashlib
import json
import re
import shutil
import struct
import subprocess
from pathlib import Path


class Elf32:
    def __init__(self, data):
        self.data = data
        if data[:7] != b'\x7fELF\x01\x01\x01':
            raise ValueError('requires little-endian ELF32')
        if struct.unpack_from('<H', data, 18)[0] != 40:
            raise ValueError('requires ARM ELF')
        self.sh_offset = struct.unpack_from('<I', data, 32)[0]
        entry_size, count, names_index = struct.unpack_from('<3H', data, 46)
        if entry_size != 40:
            raise ValueError('unsupported ELF section header size')
        self.sections = [list(struct.unpack_from('<10I', data, self.sh_offset + i * 40))
                         for i in range(count)]
        self.names_index = names_index
        self.names = self.content(self.sections[names_index])
        self.sym_index = next(i for i, s in enumerate(self.sections) if s[1] == 2)
        self.strings = self.content(self.sections[self.sections[self.sym_index][6]])

    def content(self, section):
        return self.data[section[4]:section[4] + section[5]]

    def section_name(self, section):
        return self.string(self.names, section[0])

    @staticmethod
    def string(table, offset):
        return table[offset:table.index(b'\0', offset)].decode('ascii')

    def symbols(self):
        return list(struct.iter_unpack('<IIIBBH', self.content(self.sections[self.sym_index])))

    def symbol_name(self, symbol):
        return self.string(self.strings, symbol[0])


def normalize_object(data):
    """Repair dsd symbol partition/mode and its three baseline RELA types."""
    elf = Elf32(data)
    symbols = [list(s) for s in elf.symbols()]
    # dsd's interior branch labels are NOTYPE; lld needs function/mode metadata
    # on every call target to perform the original ARM/Thumb interworking.
    for section in elf.sections:
        if section[1] == 4:
            for _, info, _ in struct.iter_unpack('<IIi', elf.content(section)):
                if info & 255 in (1, 10):
                    symbol = symbols[info >> 8]
                    symbol[3] = (symbol[3] & 0xF0) | 2
    mappings = {}
    for symbol in symbols:
        name = elf.symbol_name(symbol)
        if name.startswith(('$a', '$t', '$d')) and symbol[5] not in (0, 0xFFF1):
            mappings.setdefault(symbol[5], []).append((symbol[1], name[1]))
    for entries in mappings.values():
        entries.sort()
    for symbol in symbols:
        if symbol[3] & 15 == 2 and symbol[5] in mappings:
            entries = mappings[symbol[5]]
            index = bisect.bisect_right(entries, (symbol[1], 'z')) - 1
            if index >= 0 and entries[index][1] == 't':
                symbol[1] |= 1
    order = sorted(range(len(symbols)), key=lambda i: symbols[i][3] >> 4 != 0)
    indices = {old: new for new, old in enumerate(order)}
    out = bytearray(data)
    sym_section = elf.sections[elf.sym_index]
    sym_section[7] = sum(symbol[3] >> 4 == 0 for symbol in symbols)
    struct.pack_into('<10I', out, elf.sh_offset + elf.sym_index * 40, *sym_section)
    for new, old in enumerate(order):
        struct.pack_into('<IIIBBH', out, sym_section[4] + new * 16, *symbols[old])
    for section in elf.sections:
        if section[1] == 9:
            raise ValueError('unsupported REL input; expected dsd RELA')
        if section[1] != 4:
            continue
        for position in range(section[4], section[4] + section[5], 12):
            offset, info, addend = struct.unpack_from('<IIi', data, position)
            ident, kind = info >> 8, info & 255
            if kind not in (1, 2, 10):
                raise ValueError(f'unsupported dsd relocation {kind}')
            if (kind, addend) not in ((1, -8), (2, 0), (10, -4)):
                raise ValueError(f'unsupported dsd relocation/addend {kind}/{addend}')
            if kind == 1:
                target = elf.sections[section[7]]
                opcode = struct.unpack_from('<I', data, target[4] + offset)[0] >> 24
                if opcode not in (0xEA, 0xEB):
                    raise ValueError(f'unsupported PC24 opcode {opcode:#x}')
                kind = 28 if opcode == 0xEB else 29
            struct.pack_into('<IIi', out, position, offset, (indices[ident] << 8) | kind, addend)
    return bytes(out)


def translate_lcf(lcf, object_dir):
    """Translate only the emitted baseline MW grammar; reject unknown directives."""
    memory = re.search(r'MEMORY\s*\{(.*?)\}', lcf, re.S)
    sections = re.search(r'SECTIONS\s*\{(.*)\}\s*$', lcf, re.S)
    if not memory or not sections:
        raise ValueError('unsupported LCF structure')
    regions = {}
    for line in memory[1].splitlines():
        if not line.strip():
            continue
        match = re.fullmatch(r'\s*(\w+)\s*:\s*ORIGIN\s*=\s*(0x[0-9a-fA-F]+|AFTER\([^)]*\))(?:\s*>\s*(\S+))?\s*', line)
        if not match:
            raise ValueError(f'unsupported MEMORY directive: {line.strip()}')
        regions[match[1]] = (match[2], match[3])
    blocks = list(re.finditer(r'(\.\w+)\s*:\s*\{(.*?)\}\s*>\s*(\w+)', sections[1], re.S))
    if not blocks:
        raise ValueError('unsupported LCF: no module sections')
    region_sections = {block[3]: block[1] for block in blocks}

    def end(name):
        section = region_sections[name]
        return f'(ADDR({section}) + SIZEOF({section}))'

    def origin(name):
        value = regions[name][0]
        if not value.startswith('AFTER'):
            return value
        names = [x.strip() for x in value[6:-1].split(',')]
        result = end(names[0])
        for name in names[1:]:
            result = f'MAX({result}, {end(name)})'
        return result

    def addresses(text):
        def replace(match):
            name = match[1]
            return f'ADDR({region_sections[name]})' if name in region_sections else origin(name)
        text = re.sub(r'ADDR\((\w+)\)', replace, text)
        return re.sub(r'SIZEOF\((\w+)\)', lambda m: f'SIZEOF({region_sections[m[1]]})', text)

    prefix = sections[1][:blocks[0].start()]
    output = ['SECTIONS {', addresses(prefix)]
    modules = []
    previous_section = None
    for block in blocks:
        section, body, name = block.groups()
        body = body.replace('ALIGNALL(4);', '').replace('EXCEPTION', '')
        body = re.sub(r'WRITEW\(([^)]+)\);', r'LONG(\1);', body)
        body = re.sub(r'(\S+\.o)\((\.\w+)\)',
                      lambda m: f'"{object_dir / m[1]}"({m[2]})', body)
        body = addresses(body)
        directives = set(re.findall(r'\b([A-Z][A-Z0-9_]*)\s*\(', body))
        if directives - {'ALIGN', 'LONG', 'ADDR', 'SIZEOF', 'MAX'}:
            raise ValueError(f'unsupported LCF directives {directives}')
        lma = '0x10000' if previous_section is None else f'ALIGN(LOADADDR({previous_section}) + SIZEOF({previous_section}), 32)'
        output.append(f'{section} {origin(name)} : AT({lma}) SUBALIGN(4) {{ FILL(0); {body} }}')
        previous_section = section
        modules.append({'section': section, 'region': name,
                        'filename': Path(regions[name][1]).name,
                        'bss_start_symbol': name + '_BSS_START'})
    output.append('/DISCARD/ : { *(.ARM.exidx*) *(.comment) *(.note*) }\n}')
    return '\n'.join(output), modules


def prepare_objects(lcf, reference_dir, object_dir, overrides):
    """Select only named LCF inputs, rejecting ambiguous reference basenames."""
    names = list(dict.fromkeys(re.findall(r'(\S+\.o)\(\.\w+\)', lcf)))
    if not names:
        raise ValueError('LCF selects no objects')
    unused = set(overrides) - set(names)
    if unused:
        raise ValueError(f'unused source override: {sorted(unused)}')
    candidates = {}
    for path in reference_dir.rglob('*.o'):
        candidates.setdefault(path.name, []).append(path)
    records = []
    for name in names:
        if Path(name).name != name:
            raise ValueError(f'unsupported LCF object path: {name}')
        matches = candidates.get(name, [])
        if len(matches) != 1:
            raise ValueError(f'LCF object {name} needs one reference; found {len(matches)}')
        reference = matches[0].resolve()
        source = overrides.get(name, reference).resolve()
        original = reference.read_bytes()
        selected = source.read_bytes()
        normalized = normalize_object(selected)
        destination = object_dir / name
        destination.write_bytes(normalized)
        record = {'filename': name, 'kind': 'source' if name in overrides else 'reference',
                  'source': str(source), 'reference': str(reference),
                  'normalized': str(destination),
                  'reference_sha256': hashlib.sha256(original).hexdigest(),
                  'normalized_sha256': hashlib.sha256(normalized).hexdigest()}
        if name in overrides:
            record.update(compiled=str(source), compiled_sha256=hashlib.sha256(selected).hexdigest())
        records.append(record)
    return records


def emit_modules(elf_data, modules, directory):
    elf = Elf32(elf_data)
    symbols = {elf.symbol_name(s): s[1] for s in elf.symbols()}
    sections = {elf.section_name(s): s for s in elf.sections}
    results = []
    for module in modules:
        section = sections[module['section']]
        size = symbols[module['bss_start_symbol']] - section[3]
        if size < 0 or size > section[5] or section[1] != 1:
            raise ValueError('invalid linked module/BSS extent')
        content = elf.content(section)[:size]
        (directory / module['filename']).write_bytes(content)
        results.append(dict(module, address=section[3], size_bytes=size,
                            sha256=hashlib.sha256(content).hexdigest()))
    return results


def dsd_check_view(data, modules):
    """Make a diagnostic MW-metadata view; never use this as native link input.

    dsd 0.12 recognizes uppercase module sections and expects even Thumb function
    addresses. Keep the canonical native ELF separately for ARM EABI consumers.
    """
    elf = Elf32(data)
    out = bytearray(data)
    renames = {module['section']: module['region'] for module in modules}
    names_offset = elf.sections[elf.names_index][4]
    for section in elf.sections:
        old = elf.section_name(section)
        if old not in renames:
            continue
        new = renames[old].encode('ascii')
        if len(new) > len(old):
            raise ValueError('dsd module name cannot grow in metadata view')
        offset = names_offset + section[0]
        out[offset:offset + len(old) + 1] = new + bytes(len(old) + 1 - len(new))
    sym_offset = elf.sections[elf.sym_index][4]
    for index, symbol in enumerate(elf.symbols()):
        if symbol[3] & 15 == 2 and symbol[5] != 0:
            struct.pack_into('<I', out, sym_offset + index * 16 + 4, symbol[1] & ~1)
    return bytes(out)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--lcf', type=Path, required=True)
    parser.add_argument('--objects', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--source-objects', type=Path, help='JSON mapping LCF filenames to compiled objects')
    parser.add_argument('--lld', default='ld.lld')
    parser.add_argument('--clang', default='clang')
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    objects = (args.output / 'objects').resolve()
    objects.mkdir(exist_ok=True)
    overrides = {}
    if args.source_objects:
        mapping = json.loads(args.source_objects.read_text())
        if not isinstance(mapping, dict) or not all(isinstance(k, str) and isinstance(v, str)
                                                    for k, v in mapping.items()):
            raise ValueError('source objects must map filenames to paths')
        overrides = {name: args.source_objects.resolve().parent / path for name, path in mapping.items()}
    lcf = args.lcf.read_text()
    reference_objects = prepare_objects(lcf, args.objects, objects, overrides)
    script, modules = translate_lcf(lcf, objects)
    (args.output / 'native.ld').write_text(script)
    attributes = args.output / 'attributes.s'
    attributes.write_text('.arch armv5te\n')
    attr_object = (args.output / 'attributes.o').resolve()
    compiler_command = [args.clang, '--target=arm-none-eabi', '-march=armv5te', '-c',
                        str(attributes), '-o', str(attr_object)]
    subprocess.run(compiler_command, check=True)
    linked = args.output / 'linked.elf'
    selected = [*(Path(record['normalized']) for record in reference_objects), attr_object]
    link_map = (args.output / 'link.map').resolve()
    command = [args.lld, '-m', 'armelf', '--no-check-sections', '--entry=ARM9_TEXT_START', '-T',
               str(args.output / 'native.ld'), '-Map', str(link_map), '-o', str(linked),
               *map(str, selected)]
    provenance = {
        'schema_version': 1, 'command': command, 'returncode': None,
        'objects': reference_objects,
        'inputs': [{'path': str(path), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}
                   for path in selected],
        'attributes': {'sha256': hashlib.sha256(attr_object.read_bytes()).hexdigest(),
                       'compiler_command': compiler_command},
        'lcf_sha256': hashlib.sha256(args.lcf.read_bytes()).hexdigest(),
        'native_script_sha256': hashlib.sha256(script.encode()).hexdigest(),
        'lld_sha256': hashlib.sha256(Path(shutil.which(args.lld) or args.lld).read_bytes()).hexdigest(),
        'clang_sha256': hashlib.sha256(Path(shutil.which(args.clang) or args.clang).read_bytes()).hexdigest(),
    }
    provenance_path = args.output / 'link-inputs.json'
    provenance_path.write_text(json.dumps(provenance, indent=2) + '\n')
    result = subprocess.run(command, capture_output=True, text=True)
    provenance['returncode'] = result.returncode
    if link_map.is_file():
        provenance['link_map'] = {'path': str(link_map),
                                  'sha256': hashlib.sha256(link_map.read_bytes()).hexdigest()}
    provenance_path.write_text(json.dumps(provenance, indent=2) + '\n')
    (args.output / 'link.log').write_text(result.stdout + result.stderr)
    result.check_returncode()
    linked_data = linked.read_bytes()
    results = emit_modules(linked_data, modules, args.output)
    (args.output / 'dsd-check.elf').write_bytes(dsd_check_view(linked_data, modules))
    (args.output / 'modules.json').write_text(json.dumps(results, indent=2) + '\n')


if __name__ == '__main__':
    main()
