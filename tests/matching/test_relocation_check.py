"""Relocation checks use invented ELF objects, addresses, and instruction bytes."""
import importlib.util
import struct
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/relocation_check.py'


def load_tool():
    sys.path.insert(0, str(ROOT / 'tools/scripts'))
    spec = importlib.util.spec_from_file_location('relocation_check', SCRIPT)
    tool = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(tool)
    return tool


def make_elf(sections, symbols, relocations=(), elf_type=1):
    """Build ELF32 ARM; symbols supply (name, value, info, section_index)."""
    strings = bytearray(b'\0')
    symbol_bytes = bytearray(16)
    for name, value, info, section_index in symbols:
        offset = len(strings)
        strings.extend(name.encode() + b'\0')
        symbol_bytes.extend(struct.pack('<IIIBBH', offset, value, 0, info, 0, section_index))
    items = [('', 0, 0, b'', 0, 0, 0)]
    items += [(name, 1, address, content, 0, 0, 0)
              for name, address, content in sections]
    sym_index = len(items)
    items += [('.symtab', 2, 0, symbol_bytes, sym_index + 1, 1, 16),
              ('.strtab', 3, 0, strings, 0, 0, 0)]
    for name, target_section, entries in relocations:
        data = b''.join(struct.pack('<IIi', offset, (symbol << 8) | kind, addend)
                        for offset, symbol, kind, addend in entries)
        items.append((name, 4, 0, data, sym_index, target_section, 12))
    names_index = len(items)
    names = bytearray(b'\0')
    name_offsets = []
    for name, *_ in items + [('.shstrtab',)]:
        name_offsets.append(len(names))
        names.extend(name.encode() + b'\0')
    items.append(('.shstrtab', 3, 0, names, 0, 0, 0))
    result = bytearray(52)
    headers = []
    for i, (name, kind, address, data, link, info, entry) in enumerate(items):
        result.extend(bytes(-len(result) % 4))
        flags = 6 if kind == 1 else 0
        headers.append((name_offsets[i], kind, flags, address, len(result), len(data),
                        link, info, 4, entry))
        result.extend(data)
    header_offset = len(result)
    for header in headers:
        result.extend(struct.pack('<10I', *header))
    struct.pack_into('<16sHHIIIIIHHHHHH', result, 0,
                     b'\x7fELF\x01\x01\x01' + bytes(9), elf_type, 40, 1, 0, 0,
                     header_offset, 0, 52, 0, 0, 40, len(headers), names_index)
    return bytes(result)


def arm_branch(source, target, call=True, thumb=False):
    delta = target - source - 8
    if thumb:
        value = 0xFA000000 | ((delta & 2) << 23) | ((delta >> 2) & 0xFFFFFF)
    else:
        value = (0xEB000000 if call else 0xEA000000) | ((delta >> 2) & 0xFFFFFF)
    return struct.pack('<I', value)


def thumb_call(source, target, target_thumb=True):
    pc = source + 4 if target_thumb else (source + 4) & ~3
    delta = target - pc
    return struct.pack('<HH', 0xF000 | ((delta >> 12) & 0x7FF),
                       (0xF800 if target_thumb else 0xE800) | ((delta >> 1) & 0x7FF))


def fixture(kind=2, addend=0, target_thumb=False, source_thumb=False,
            actual_target=None, actual_thumb=None, relocation_name='.rela.text',
            target_name='destination'):
    base, offset = 0x1000, 16
    raw = bytearray(64)
    if kind == 1:
        raw[:4] = struct.pack('<I', 0xEB000000)
    elif kind == 10:
        raw[:4] = bytes.fromhex('00f000f8')
    reference = make_elf([('.text', 0, raw)], [
        ('$t' if source_thumb else '$a', 0, 0, 1),
        (target_name, offset, 0x12, 1),
        ('$t' if target_thumb else '$a', offset, 0, 1),
    ], [(relocation_name, 1, [(0, 2, kind, addend)])])
    address = base + offset if actual_target is None else actual_target
    mode = target_thumb if actual_thumb is None else actual_thumb
    payload = bytearray(64)
    # Two targets contain identical code: target identity must still matter.
    payload[16:24] = bytes.fromhex('0000a0e10000a0e1')
    if kind == 2:
        payload[:4] = struct.pack('<I', (address | target_thumb) + addend)
    elif kind == 1:
        payload[:4] = arm_branch(base, address + addend + 8, thumb=mode)
    elif kind == 10:
        payload[:4] = thumb_call(base, address + addend + 4, target_thumb=mode)
    linked = make_elf([('.arm9', base, payload)], [
        ('ARM9_TEXT_START', base, 0x10, 1),
        (target_name, (base + offset) | target_thumb, 0x12, 1),
    ], elf_type=2)
    return reference, linked


class RelocationCheckTests(unittest.TestCase):
    def validate(self, reference, linked, filename='_dsd_gap@main_0.o'):
        self.assertTrue(SCRIPT.exists(), 'relocation validator missing')
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            ref, executable = root / filename, root / 'linked.elf'
            ref.write_bytes(reference)
            executable.write_bytes(linked)
            return load_tool().validate_relocations([ref], executable)

    def test_abs32_validates_exact_destination_and_nonzero_addend(self):
        result = self.validate(*fixture(addend=12))
        self.assertEqual(result['status'], 'passed', result)
        self.assertEqual(result['counts']['validated'], 1)

    def test_wrong_destination_fails_even_when_both_targets_have_identical_code(self):
        result = self.validate(*fixture(kind=1, addend=-8, actual_target=0x1014))
        self.assertEqual(result['status'], 'failed', result)
        self.assertEqual(result['counts']['failed'], 1)

    def test_rela_sh_info_controls_source_not_misleading_section_name(self):
        reference, _ = fixture()
        reference = make_elf([('.text', 0, bytes(32)), ('.data', 0, bytes(32))], [
            ('destination', 16, 0x11, 1), ('$a', 0, 0, 1),
        ], [('.rela.text', 2, [(0, 1, 2, 7)])])
        payload = bytearray(64)
        struct.pack_into('<I', payload, 32, 0x1017)
        linked = make_elf([('.arm9', 0x1000, payload)], [
            ('ARM9_TEXT_START', 0x1000, 0x10, 1),
            ('ARM9_DATA_START', 0x1020, 0x10, 1),
            ('destination', 0x1010, 0x11, 1),
        ], elf_type=2)
        self.assertEqual(self.validate(reference, linked)['status'], 'passed')

    def test_all_direct_arm_thumb_call_transitions(self):
        for kind, source_thumb, target_thumb in (
                (1, False, False), (1, False, True),
                (10, True, False), (10, True, True)):
            with self.subTest(kind=kind, target_thumb=target_thumb):
                result = self.validate(*fixture(kind=kind, addend=-4 if kind == 10 else -8,
                                                source_thumb=source_thumb,
                                                target_thumb=target_thumb))
                self.assertEqual(result['status'], 'passed', result)

    def test_wrong_call_state_fails_at_correct_numeric_address(self):
        result = self.validate(*fixture(kind=10, addend=-4, source_thumb=True,
                                        target_thumb=False, actual_thumb=True))
        self.assertEqual(result['status'], 'failed', result)

    def test_reference_source_mapping_must_agree_with_branch_encoding(self):
        result = self.validate(*fixture(kind=1, addend=-8, source_thumb=True))
        self.assertEqual(result['status'], 'unresolved', result)
        self.assertIn('source_mode_fallbacks', result)
        self.assertEqual(result['source_mode_fallbacks']['count'], 0)

    def test_thumb_function_covers_resume_after_pool_without_new_mapping_symbol(self):
        reference = make_elf([('.text', 0, bytes(32))], [
            ('$t', 0, 0, 1), ('source_function', 0, 0x12, 1),
            ('$d', 4, 0, 1), ('destination', 16, 0x12, 1), ('$t', 16, 0, 1),
        ], [('.rela.text', 1, [(8, 4, 10, -4)])])
        tool = load_tool()
        elf = tool.Elf32(reference)
        raw = bytearray(reference)
        # source_function's declared range includes the instruction after its pool.
        struct.pack_into('<I', raw, elf.sections[elf.sym_index][4] + 2 * 16 + 8, 16)
        raw[elf.sections[1][4] + 8:elf.sections[1][4] + 12] = bytes.fromhex('00f000f8')
        payload = bytearray(32)
        payload[8:12] = thumb_call(0x1008, 0x1010)
        linked = make_elf([('.arm9', 0x1000, payload)], [
            ('ARM9_TEXT_START', 0x1000, 0x10, 1),
            ('source_function', 0x1001, 0x12, 1),
            ('destination', 0x1011, 0x12, 1),
        ], elf_type=2)
        result = self.validate(bytes(raw), linked)
        self.assertEqual(result['status'], 'passed')
        self.assertIn('source_mode_fallbacks', result)
        self.assertEqual(result['source_mode_fallbacks']['count'], 1)
        fallback = result['source_mode_fallbacks']['contexts'][0]
        self.assertEqual(fallback['source'], 0x1008)
        self.assertEqual(fallback['module'], 'ARM9')
        self.assertEqual(fallback['mapping_mode'], 'd')
        self.assertEqual(fallback['function_mode'], 't')

    def test_branch_addends_are_not_replaced_with_default_pc_bias(self):
        for kind, addend in ((1, -4), (10, 0)):
            with self.subTest(kind=kind):
                result = self.validate(*fixture(kind=kind, addend=addend,
                                                source_thumb=kind == 10))
                self.assertEqual(result['status'], 'passed', result)

    def test_thumb_blx_aligns_displacement_at_two_byte_source_boundary(self):
        source = bytearray(32)
        source[2:6] = bytes.fromhex('00f000f8')
        reference = make_elf([('.text', 0, source)], [
            ('$t', 0, 0, 1), ('arm_target', 16, 0x12, 1), ('$a', 16, 0, 1),
        ], [('.rela.text', 1, [(2, 2, 10, -2)])])
        output = bytearray(32)
        output[2:6] = bytes.fromhex('00f006e8')  # BLX at 0x1002 -> ARM 0x1010.
        linked = make_elf([('.arm9', 0x1000, output)], [
            ('ARM9_TEXT_START', 0x1000, 0x10, 1), ('arm_target', 0x1010, 0x12, 1),
        ], elf_type=2)
        self.assertEqual(self.validate(reference, linked)['status'], 'passed')

    def test_corrupt_linked_symbol_cannot_redefine_reference_destination(self):
        reference, _ = fixture()
        payload = struct.pack('<I', 0x1014) + bytes(60)
        linked = make_elf([('.arm9', 0x1000, payload)], [
            ('ARM9_TEXT_START', 0x1000, 0x10, 1),
            ('destination', 0x1014, 0x12, 1),
        ], elf_type=2)
        self.assertEqual(self.validate(reference, linked)['status'], 'failed')

    def test_dsd_even_thumb_diagnostic_elf_cannot_replace_native_elf(self):
        ref, _ = fixture(target_thumb=True)
        output = struct.pack('<I', 0x1011) + bytes(60)
        linked = make_elf([('.arm9', 0x1000, output)], [
            ('ARM9_TEXT_START', 0x1000, 0x10, 1), ('destination', 0x1010, 0x12, 1),
        ], elf_type=2)
        self.assertEqual(self.validate(ref, linked)['status'], 'failed')

    def test_unknown_relocation_is_unresolved(self):
        result = self.validate(*fixture(kind=99))
        self.assertEqual(result['status'], 'unresolved', result)
        self.assertEqual(result['counts']['unresolved'], 1)

    def test_missing_target_symbol_is_unresolved(self):
        ref, linked = fixture()
        ref = make_elf([('.text', 0, bytes(64))], [
            ('missing', 0, 0x20, 0), ('$a', 0, 0, 1),
        ], [('.rela.text', 1, [(0, 1, 2, 0)])])
        self.assertEqual(self.validate(ref, linked)['status'], 'unresolved')

    def test_malformed_elf_tables_or_section_extents_never_pass(self):
        reference, linked = fixture()
        tool = load_tool()
        elf = tool.Elf32(reference)
        rela_index = next(i for i, section in enumerate(elf.sections) if section[1] == 4)
        string_index = elf.sections[elf.sym_index][6]
        corruptions = (
            ('RELA sh_link', rela_index, 6, elf.names_index),
            ('symtab entry size', elf.sym_index, 9, 8),
            ('symtab string table kind', string_index, 1, 1),
            ('file-backed extent', 1, 5, len(reference) + 16),
        )
        for name, section_index, field, value in corruptions:
            with self.subTest(name=name):
                raw = bytearray(reference)
                struct.pack_into('<I', raw, elf.sh_offset + section_index * 40 + field * 4, value)
                self.assertEqual(self.validate(bytes(raw), linked)['status'], 'unresolved')

    def test_same_vma_overlay_target_requires_matching_section_identity(self):
        reference = make_elf([('.text', 0, bytes(32))], [
            ('overlay_target', 16, 0x12, 1), ('$a', 0, 0, 1),
        ], [('.rela.text', 1, [(0, 1, 2, 0)])])
        payload = struct.pack('<I', 0x2010) + bytes(28)
        linked = make_elf([('.ov000', 0x2000, payload), ('.ov001', 0x2000, payload)], [
            ('OV000_TEXT_START', 0x2000, 0x10, 1),
            ('OV001_TEXT_START', 0x2000, 0x10, 2),
            ('overlay_target', 0x2010, 0x12, 2),
        ], elf_type=2)
        result = self.validate(reference, linked, '_dsd_gap@ov000_0.o')
        self.assertEqual(result['status'], 'failed', result)
        self.assertIn('section', str(result['findings']))

    def test_notype_thumb_branch_target_uses_reference_mapping_mode(self):
        self.assertTrue(SCRIPT.exists(), 'relocation validator missing')
        ref, linked = fixture(kind=10, addend=-4, source_thumb=True, target_thumb=True)
        # Change only the reference destination type to NOTYPE.
        tool = load_tool()
        raw = bytearray(ref)
        elf = tool.Elf32(raw)
        raw[elf.sections[elf.sym_index][4] + 2 * 16 + 12] = 0x10
        self.assertEqual(self.validate(bytes(raw), linked)['status'], 'passed')

    def test_empty_reference_inventory_never_passes(self):
        self.assertTrue(SCRIPT.exists(), 'relocation validator missing')
        _, linked = fixture()
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'linked.elf'
            path.write_bytes(linked)
            self.assertEqual(load_tool().validate_relocations([], path)['status'], 'unresolved')

    def test_multiple_reference_objects_in_same_module_require_placement_evidence(self):
        ref, linked = fixture()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            references = [root / '_dsd_gap@main_0.o', root / '_dsd_gap@main_1.o']
            binary = root / 'linked.elf'
            for path in references:
                path.write_bytes(ref)
            binary.write_bytes(linked)
            result = load_tool().validate_relocations(references, binary)
            self.assertEqual(result['status'], 'unresolved', result)
            self.assertIn('per-object section placement', str(result['findings']))

    def test_cli_failure_has_nonzero_exit_and_reports_exact_bad_target(self):
        self.assertTrue(SCRIPT.exists(), 'relocation validator missing')
        ref, linked = fixture(actual_target=0x1014)
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            reference, binary = root / '_dsd_gap@main_0.o', root / 'linked.elf'
            reference.write_bytes(ref)
            binary.write_bytes(linked)
            result = subprocess.run([sys.executable, str(SCRIPT), '--reference',
                                     str(reference), '--linked-elf', str(binary)],
                                    capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('"status": "failed"', result.stdout)


if __name__ == '__main__':
    unittest.main()
