"""Invented ARM objects and lld maps exercise ownership without a ROM."""
import hashlib
import importlib.util
import json
import struct
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/source_accounting.py'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def elf(sections, symbols, executable=False):
    """Sections: name,address,bytes. Symbols: name,value,size,info,index."""
    strings = bytearray(b'\0')
    entries = bytearray(16)
    for name, value, size, info, index in symbols:
        offset = len(strings)
        strings.extend(name.encode() + b'\0')
        entries.extend(struct.pack('<IIIBBH', offset, value, size, info, 0, index))
    items = [('', 0, 0, b'', 0, 0, 0)]
    items += [(name, 1, address, data, 0, 0, 0) for name, address, data in sections]
    sym_index = len(items)
    items += [('.symtab', 2, 0, entries, sym_index + 1, 1, 16),
              ('.strtab', 3, 0, strings, 0, 0, 0)]
    names_index = len(items)
    names = bytearray(b'\0')
    offsets = []
    for name, *_ in items + [('.shstrtab',)]:
        offsets.append(len(names))
        names.extend(name.encode() + b'\0')
    items.append(('.shstrtab', 3, 0, names, 0, 0, 0))
    data = bytearray(52)
    headers = []
    for i, (name, kind, address, payload, link, info, stride) in enumerate(items):
        data.extend(bytes(-len(data) % 4))
        headers.append((offsets[i], kind, 6 if kind == 1 else 0, address,
                        len(data), len(payload), link, info, 4, stride))
        data.extend(payload)
    section_offset = len(data)
    for header in headers:
        data.extend(struct.pack('<10I', *header))
    struct.pack_into('<16sHHIIIIIHHHHHH', data, 0,
                     b'\x7fELF\x01\x01\x01' + bytes(9), 2 if executable else 1,
                     40, 1, 0, 0, section_offset, 0, 52, 0, 0, 40,
                     len(headers), names_index)
    return bytes(data)


class SourceAccountingTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.config = self.root / 'config'
        module = self.config / 'overlays/ov000'
        module.mkdir(parents=True)
        (module / 'delinks.txt').write_text(
            '    .text start:0x1000 end:0x1040 kind:code align:4\n'
            '    .rodata start:0x1040 end:0x1048 kind:rodata align:4\n'
            '    .bss start:0x1048 end:0x1050 kind:bss align:4\n'
            'src/trampoline:\n'
            '    .text start:0x1000 end:0x100c kind:code align:4\n')
        (module / 'symbols.txt').write_text(
            'function kind:function(arm,size=0xc) addr:0x1000\n'
            'alias kind:function(arm,size=0xc) addr:0x1000\n'
            'other kind:function(arm,size=0x4) addr:0x1010\n')
        symbols = [('$a', 0, 0, 0, 1), ('$d', 8, 0, 0, 1),
                   ('function', 0, 12, 0x12, 1), ('alias', 0, 12, 0x12, 1)]
        self.reference = self.root / 'reference/src/trampoline.o'
        self.compiled = self.root / 'compiled/src/trampoline.o'
        self.selected = self.root / 'native/objects/src/trampoline.o'
        for path in (self.reference, self.compiled, self.selected):
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(elf([('.text', 0, bytes(12))], symbols))
        self.linked = self.root / 'native/linked.elf'
        self.linked.write_bytes(elf([('.ov000', 0x1000, bytes(64))],
                                   [('function', 0x1000, 12, 0x12, 1),
                                    ('alias', 0x1000, 12, 0x12, 1)], True))
        self.map = self.root / 'native/link.map'
        self.map.write_text('     VMA      LMA     Size Align Out     In      Symbol\n'
                            '    1000    10000       40     4 .ov000\n'
                            f'    1000    10000        c     4         {self.selected}:(.text)\n'
                            '    1000    10000        c     1                 function\n')
        self.build = {'status': 'passed', 'units': [{
            'status': 'passed', 'module': 'ov000', 'object': 'src/trampoline.o',
            'source': 'src/trampoline.c', 'functions': ['function', 'alias'], 'category': 'game',
            'compiled': {'path': str(self.compiled), 'sha256': digest(self.compiled)},
            'reference': {'path': str(self.reference), 'sha256': digest(self.reference)}}]}
        self.inputs = {'command': ['ld.lld', str(self.selected)], 'objects': [{
            'filename': 'src/trampoline.o', 'kind': 'source',
            'source': str(self.compiled), 'reference': str(self.reference),
            'reference_sha256': digest(self.reference),
            'compiled': str(self.compiled), 'compiled_sha256': digest(self.compiled),
            'normalized': str(self.selected), 'normalized_sha256': digest(self.selected)}],
            'inputs': [{'path': str(self.selected), 'sha256': digest(self.selected)}],
            'link_map': {'path': str(self.map), 'sha256': digest(self.map)}}
        self.lcf = 'src/trampoline.o(.text)'

    def tool(self):
        self.assertTrue(SCRIPT.exists(), 'source ownership/coverage implementation missing')
        sys.path.insert(0, str(ROOT / 'tools/scripts'))
        spec = importlib.util.spec_from_file_location('source_accounting', SCRIPT)
        tool = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(tool)
        return tool

    def ownership(self):
        return self.tool().verify_source_ownership(
            self.build, self.inputs, self.lcf, self.map, self.linked, self.config)

    def remap(self, old, new):
        self.map.write_text(self.map.read_text().replace(old, new))
        self.inputs['link_map']['sha256'] = digest(self.map)

    def test_actual_source_extent_splits_instructions_from_literal_pool(self):
        result = self.ownership()
        self.assertEqual(result['status'], 'passed')
        self.assertEqual([(i['category'], i['end'] - i['start'])
                          for i in result['accepted_intervals']],
                         [('instructions', 8), ('literals', 4)])

    def test_canonical_dsd_complete_tu_inherits_section_kind(self):
        path = self.config / 'overlays/ov000/delinks.txt'
        path.write_text(path.read_text().replace('src/trampoline:', 'src/trampoline.c:\n    complete')
                        .replace('end:0x100c kind:code align:4', 'end:0x100c'))
        self.build['units'][0]['source'] = 'decomp/src/trampoline.c'
        self.build['units'][0]['link_name'] = 'trampoline.o'
        self.inputs['objects'][0]['filename'] = 'trampoline.o'
        self.lcf = 'trampoline.o(.text)'
        self.assertEqual(self.ownership()['status'], 'passed')

    def test_generated_stub_padding_is_separate_from_typed_binary_fallback(self):
        path = self.config / 'overlays/ov009'
        path.mkdir()
        (path / 'delinks.txt').write_text(
            '    .ctor start:0x2000 end:0x2000 kind:rodata align:4\n'
            '    .bss start:0x2020 end:0x2020 kind:bss align:32\n')
        coverage = self.tool().summarize_coverage(self.ownership(), self.config, verification_passed=True)
        self.assertEqual(coverage['arm9_initialized_bytes'], 104)
        self.assertEqual(coverage['binary_fallback']['initialized_bytes'], 60)
        self.assertEqual(coverage['unknown']['layout_padding_or_generated_bytes'], 32)
        self.assertEqual(coverage['matched_source_bytes']
                         + coverage['binary_fallback']['initialized_bytes']
                         + coverage['unknown']['layout_padding_or_generated_bytes'], 104)

    def test_each_module_reports_source_and_fallback_without_cross_overlay_credit(self):
        path = self.config / 'overlays/ov009'
        path.mkdir()
        (path / 'delinks.txt').write_text(
            '    .ctor start:0x1000 end:0x1000 kind:rodata align:4\n'
            '    .bss start:0x1020 end:0x1020 kind:bss align:32\n')
        coverage = self.tool().summarize_coverage(self.ownership(), self.config, verification_passed=True)
        modules = coverage['modules']
        self.assertEqual(modules['OV000']['matched_source_bytes'], 12)
        self.assertEqual(modules['OV000']['instructions']['matched_bytes'], 8)
        self.assertEqual(modules['OV000']['literals']['matched_bytes'], 4)
        self.assertEqual(modules['OV000']['functions'], {'matched': 1, 'total': 2})
        self.assertEqual(modules['OV009']['matched_source_bytes'], 0)
        self.assertEqual(modules['OV009']['binary_fallback']['initialized_bytes'], 0)
        self.assertEqual(modules['OV009']['unknown']['layout_padding_or_generated_bytes'], 32)
        self.assertEqual(sum(m['initialized_bytes'] for m in modules.values()), 104)

    def test_game_category_is_distinct_from_instruction_and_literal_kind(self):
        ownership = self.ownership()
        self.assertEqual({i['implementation_category'] for i in ownership['accepted_intervals']}, {'game'})
        self.assertEqual({f['implementation_category'] for f in ownership['functions']}, {'game'})
        ownership['accepted_intervals'] *= 2
        ownership['functions'] *= 2
        coverage = self.tool().summarize_coverage(ownership, self.config, verification_passed=True)
        categories = coverage['implementation_categories']
        self.assertEqual(categories['game'], {'matched_source_bytes': 12, 'matched_functions': 1})
        self.assertEqual(categories['sdk']['matched_source_bytes'], 0)
        self.assertEqual(categories['unknown']['matched_source_bytes'], 0)
        self.assertEqual(coverage['modules']['OV000']['implementation_categories'], categories)

    def test_conflicting_implementation_categories_cannot_double_count_aliases(self):
        ownership = self.ownership()
        ownership['accepted_intervals'].append(dict(ownership['accepted_intervals'][0], implementation_category='sdk'))
        with self.assertRaisesRegex(ValueError, 'conflict|overlap'):
            self.tool().summarize_coverage(ownership, self.config, verification_passed=True)

    def test_map_owned_by_reference_cannot_earn_source_credit(self):
        self.remap(str(self.selected), str(self.reference))
        with self.assertRaisesRegex(ValueError, 'ownership|map'):
            self.ownership()

    def test_source_present_in_argv_but_at_wrong_extent_fails(self):
        self.remap('    1000    10000        c     4', '    1004    10000        c     4')
        with self.assertRaisesRegex(ValueError, 'extent|address'):
            self.ownership()

    def test_same_address_in_different_overlay_does_not_prove_ownership(self):
        self.remap('4 .ov000', '4 .ov001')
        with self.assertRaisesRegex(ValueError, 'module|overlay'):
            self.ownership()

    def test_local_dot_label_does_not_replace_map_output_section(self):
        self.remap('4 .ov000\n',
                   '4 .ov000\n    1000    10000        0     1                 .L_1000\n')
        self.assertEqual(self.ownership()['status'], 'passed')

    def test_reference_still_selected_fails(self):
        self.inputs['inputs'].append({'path': str(self.reference), 'sha256': digest(self.reference)})
        self.inputs['command'].append(str(self.reference))
        with self.assertRaisesRegex(ValueError, 'reference'):
            self.ownership()

    def test_changed_compiled_object_fails_even_if_selected_object_is_unchanged(self):
        self.compiled.write_bytes(self.compiled.read_bytes() + b'changed')
        with self.assertRaisesRegex(ValueError, 'hash'):
            self.ownership()

    def test_wrong_linked_function_mode_fails(self):
        self.linked.write_bytes(elf([('.ov000', 0x1000, bytes(64))],
                                   [('function', 0x1001, 12, 0x12, 1),
                                    ('alias', 0x1000, 12, 0x12, 1)], True))
        with self.assertRaisesRegex(ValueError, 'function|mode'):
            self.ownership()

    def test_extra_allocated_source_section_fails(self):
        self.selected.write_bytes(elf([('.text', 0, bytes(12)), ('.data', 0, bytes(4))],
                                     [('function', 0, 12, 0x12, 1)]))
        self.inputs['objects'][0]['normalized_sha256'] = digest(self.selected)
        self.inputs['inputs'][0]['sha256'] = digest(self.selected)
        with self.assertRaisesRegex(ValueError, 'section'):
            self.ownership()

    def test_coverage_requires_final_gate_and_deduplicates_function_aliases(self):
        tool = self.tool()
        ownership = self.ownership()
        before = tool.summarize_coverage(ownership, self.config)
        self.assertEqual(before['matched_source_bytes'], 0)
        result = tool.summarize_coverage(ownership, self.config, verification_passed=True)
        self.assertEqual(result['matched_source_bytes'], 12)
        self.assertEqual(result['instructions']['matched_bytes'], 8)
        self.assertEqual(result['literals']['matched_bytes'], 4)
        self.assertEqual(result['functions']['matched'], 1)
        self.assertEqual(result['functions']['total'], 2)
        self.assertEqual(result['binary_fallback']['initialized_bytes'], 60)
        self.assertIsNone(result['global_percent'])

    def test_overlapping_promotions_cannot_double_count_source_bytes(self):
        result = self.ownership()
        result['accepted_intervals'] *= 2
        result['functions'] *= 2
        coverage = self.tool().summarize_coverage(result, self.config, verification_passed=True)
        self.assertEqual(coverage['matched_source_bytes'], 12)
        self.assertEqual(coverage['functions']['matched'], 1)

    def test_conflicting_overlap_categories_are_rejected(self):
        result = self.ownership()
        result['accepted_intervals'].append(dict(result['accepted_intervals'][0], category='literals'))
        with self.assertRaisesRegex(ValueError, 'conflict|overlap'):
            self.tool().summarize_coverage(result, self.config, verification_passed=True)

    def test_failed_ownership_never_receives_credit(self):
        result = dict(self.ownership(), status='failed')
        coverage = self.tool().summarize_coverage(result, self.config, verification_passed=True)
        self.assertEqual(coverage['matched_source_bytes'], 0)
        self.assertEqual(coverage['functions']['matched'], 0)


if __name__ == '__main__':
    unittest.main()
