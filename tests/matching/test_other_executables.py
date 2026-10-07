"""Other CPU scope uses invented executables, never original ROM payloads."""
import hashlib
import struct
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'tools/scripts'))
import other_executables as target


def hashes(data):
    return {'sha1': hashlib.sha1(data).hexdigest(), 'sha256': hashlib.sha256(data).hexdigest()}


def fixture():
    rom = bytearray(0x2000)
    child = bytearray(0x800)
    arm7 = b'PUBLIC ARM7 TEST'
    struct.pack_into('<4I', rom, 0x30, 0x200, 0x02380000, 0x02380000, len(arm7))
    rom[0x200:0x210] = arm7
    struct.pack_into('<4I', child, 0x20, 0x200, 0x02000000, 0x02000000, 64)
    struct.pack_into('<4I', child, 0x30, 0x300, 0x02380000, 0x02380000, len(arm7))
    child[0x200:0x240] = bytes(range(64))
    child[0x300:0x310] = arm7
    rom[0x1000:0x1800] = child
    struct.pack_into('<2I', rom, 0x40, 0x400, 19)
    struct.pack_into('<2I', rom, 0x48, 0x500, 8)
    struct.pack_into('<IHH', rom, 0x400, 8, 0, 1)
    rom[0x408:0x413] = b'\x09child.srl\0'
    struct.pack_into('<2I', rom, 0x500, 0x1000, 0x1800)

    def region(data, offset, size, base, entry):
        return {'rom_offset': hex(offset), 'base': hex(base), 'entry': hex(entry),
                'stored_bytes': size, 'stored_hashes': hashes(data[offset:offset + size]),
                'internal_sections': {'status': 'unresolved'}}

    inventory = {'rom': {'bytes': len(rom), 'hashes': hashes(rom)},
                 'regions': {'arm7': region(rom, 0x200, 16, 0x02380000, 0x02380000), 'arm7_overlays': []},
                 'nitrofs': {'direct_nds_header_candidates': ['child.srl'], 'scope_uncertainty': 'Containers unscanned'},
                 'embedded_executables': [{'path': 'child.srl', 'file_id': 0, 'rom_offset': '0x1000',
                     'bytes': len(child), 'hashes': hashes(child), 'regions': {
                         'arm9': dict(region(child, 0x200, 64, 0x02000000, 0x02000000), compressed=False,
                                      main={'base': '0x02000000', 'bytes': 64, 'hashes': hashes(child[0x200:0x240])}, autoloads=[]),
                         'arm7': region(child, 0x300, 16, 0x02380000, 0x02380000),
                         'arm9_overlays': [], 'arm7_overlays': []}}]}
    return bytes(rom), inventory


class OtherExecutableTests(unittest.TestCase):
    def setUp(self):
        self.rom, self.inventory = fixture()

    def test_exact_scope_preserves_distinct_programs_and_zero_source_credit(self):
        report = target.verify_other_executables(self.rom, self.inventory)
        self.assertEqual(report['status'], 'preserved_binary_verified')
        self.assertFalse(report['linked_baseline'])
        self.assertFalse(report['source_complete'])
        self.assertEqual(report['coverage']['matched_source_bytes'], 0)
        self.assertIsNone(report['coverage']['global_percent'])
        self.assertEqual(len(report['executables']), 3)
        self.assertEqual(len({row['identity']['program'] for row in report['executables']}), 2)
        self.assertEqual(report['executables'][0]['stored_sha256'], report['executables'][2]['stored_sha256'])
        self.assertTrue(all(row['remaining_symbols'] is None for row in report['executables']))

    def test_parent_arm7_mutation_fails_arm7_check(self):
        damaged = bytearray(self.rom)
        damaged[0x200] ^= 1
        with self.assertRaisesRegex(ValueError, 'parent/arm7.*payload'):
            target.verify_other_executables(damaged, self.inventory)

    def test_child_arm9_mutation_fails_embedded_cpu_check(self):
        damaged = bytearray(self.rom)
        damaged[0x1200] ^= 1
        with self.assertRaisesRegex(ValueError, 'child.srl/arm9.*payload'):
            target.verify_other_executables(damaged, self.inventory)

    def test_child_arm7_mutation_fails_embedded_cpu_check(self):
        damaged = bytearray(self.rom)
        damaged[0x1300] ^= 1
        with self.assertRaisesRegex(ValueError, 'child.srl/arm7.*payload'):
            target.verify_other_executables(damaged, self.inventory)

    def test_child_header_or_fat_mutation_fails_layout(self):
        for offset in (0x1228 - 0x200, 0x500):
            damaged = bytearray(self.rom)
            damaged[offset] ^= 4
            with self.assertRaisesRegex(ValueError, 'layout'):
                target.verify_other_executables(damaged, self.inventory)

    def test_fnt_name_mutation_fails_scope(self):
        damaged = bytearray(self.rom)
        damaged[0x409] = ord('x')
        with self.assertRaisesRegex(ValueError, 'NitroFS'):
            target.verify_other_executables(damaged, self.inventory)

    def test_missing_embedded_program_rejects_incomplete_inventory(self):
        self.inventory['embedded_executables'] = []
        with self.assertRaisesRegex(ValueError, 'scope'):
            target.verify_other_executables(self.rom, self.inventory)

    def test_changed_non_executable_byte_still_fails_original_pin(self):
        damaged = bytearray(self.rom)
        damaged[-1] ^= 1
        with self.assertRaisesRegex(ValueError, 'ROM identity'):
            target.verify_other_executables(damaged, self.inventory)

    def test_arm9_cpu_defaults_cannot_apply_to_arm7(self):
        policy = {'cpu': 'arm9', 'processor': 'arm946e', 'isa': 'armv5te',
                  'compiler_sha256': 'a' * 64, 'runner_sha256': 'b' * 64}
        with self.assertRaisesRegex(ValueError, 'CPU policy'):
            target.validate_cpu_policy('arm7', policy)
        policy['cpu'] = 'arm7'
        with self.assertRaisesRegex(ValueError, 'CPU policy'):
            target.validate_cpu_policy('arm7', policy)

    def test_cpu_policy_requires_explicit_independent_pin(self):
        with self.assertRaisesRegex(ValueError, 'CPU policy'):
            target.validate_cpu_policy('arm7', {})
        policy = {'cpu': 'arm7', 'processor': 'arm7tdmi', 'isa': 'armv4t',
                  'compiler_sha256': 'a' * 64, 'runner_sha256': 'b' * 64}
        self.assertEqual(target.validate_cpu_policy('arm7', policy), policy)

    def test_fresh_extracted_arm7_is_verified_and_mutation_rejected(self):
        report = target.verify_other_executables(self.rom, self.inventory)
        row = report['executables'][0]
        result = target.verify_extracted_payload(row, self.rom[0x200:0x210])
        self.assertEqual(result['status'], 'passed')
        self.assertEqual(result['matched_source_bytes'], 0)
        with self.assertRaisesRegex(ValueError, 'extracted payload'):
            target.verify_extracted_payload(row, b'changed payload!')

    def test_public_backward_lz_payload(self):
        encoded = b'\x00\xc0AAA\x10' + struct.pack('<II', 0x0800000e, 4)
        self.assertEqual(target.expand_blz(encoded), b'A' * 18)
        for bad in (encoded[:-1], encoded[:6] + struct.pack('<II', 0x0700000e, 4)):
            with self.assertRaises(ValueError):
                target.expand_blz(bad)

    def test_compiler_probe_rejects_actual_file_hash_mismatch_before_execution(self):
        policy = {'cpu': 'arm7', 'processor': 'arm7tdmi', 'isa': 'armv4t',
                  'compiler_sha256': 'a' * 64, 'runner_sha256': 'b' * 64}
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            compiler = root / 'compiler'
            runner = root / 'runner'
            source = root / 'public.c'
            compiler.write_text('untrusted compiler')
            runner.write_text('untrusted runner')
            source.write_text('unsigned public_add(unsigned x) { return x + 3; }\n')
            with self.assertRaisesRegex(ValueError, 'compiler/runner pin'):
                target.probe_cpu_compiler(policy, compiler, runner, source, root / 'public.o', 'arm')

    def test_compiler_probe_rejects_unspecified_instruction_mode(self):
        with self.assertRaisesRegex(ValueError, 'instruction mode'):
            target.probe_cpu_compiler({}, Path('missing'), Path('missing'), Path('missing'), Path('missing'), 'default')

    def test_extracted_child_arm9_allows_only_documented_compression_pointer_normalization(self):
        original = bytearray(64)
        struct.pack_into('<I', original, 20, 0x02001234)
        row = {'compression': True, 'module_params': {'offset': '0x0', 'compressed_static_end': '0x02001234'},
               'remaining_intervals': [{'module': 'main', 'bytes': 64, 'hashes': hashes(original)},
                                       {'module': 'ITCM', 'bytes': 4, 'hashes': hashes(b'TEST')}]}
        normalized = bytearray(original)
        struct.pack_into('<I', normalized, 20, 0)
        result = target.verify_extracted_arm9_modules(row, {'main': normalized, 'ITCM': b'TEST'})
        self.assertEqual(result['main']['hash_domain'], 'original pointer restored from pinned metadata')
        self.assertEqual(result['main']['matched_source_bytes'], 0)
        normalized[5] ^= 1
        with self.assertRaisesRegex(ValueError, 'extracted ARM9 module'):
            target.verify_extracted_arm9_modules(row, {'main': normalized, 'ITCM': b'TEST'})
        with self.assertRaisesRegex(ValueError, 'scope'):
            target.verify_extracted_arm9_modules(row, {'main': original})


if __name__ == '__main__':
    unittest.main()
