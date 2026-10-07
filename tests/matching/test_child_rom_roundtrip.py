"""Public invented BLZ/NDS inputs exercise the isolated child packer."""
import copy
import hashlib
import struct
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'tools/scripts'))
import child_rom_roundtrip as target


def sha(data):
    return hashlib.sha256(data).hexdigest()


class ChildRoundtripTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        prefix = bytearray(48)
        struct.pack_into('<I', prefix, 20, 0x0200003e)
        suffix = b'\x00\xc0AAA\x10' + struct.pack('<II', 0x0800000e, 4)
        stored = bytes(prefix) + suffix
        expanded = bytes(prefix) + b'A' * 18
        child = bytearray(256)
        struct.pack_into('<4I', child, 0x20, 128, 0x02000000, 0x02000000, len(stored))
        child[128:128 + len(stored)] = stored
        child[224:240] = b'PUBLIC ARM7 TEST'
        self.child = self.root / 'child.srl'
        self.child.write_bytes(child)
        self.output = self.root / 'output.srl'
        self.row = {'cpu': 'arm9', 'compression': True, 'base': 0x02000000,
                    'entry': 0x02000000, 'identity': {'program_sha256': sha(child)},
                    'rom_offset_in_program': 128, 'stored_bytes': len(stored),
                    'stored_sha256': sha(stored), 'expanded_bytes': len(expanded),
                    'expanded_sha256': sha(expanded),
                    'module_params': {'offset': 0, 'compressed_static_end': 0x0200003e},
                    'remaining_intervals': [
                        {'module': 'main', 'source_offset': 0, 'bytes': 48, 'hashes': {'sha256': sha(prefix)}},
                        {'module': 'ITCM', 'source_offset': 48, 'bytes': 9, 'hashes': {'sha256': sha(b'A' * 9)}},
                        {'module': 'DTCM', 'source_offset': 57, 'bytes': 9, 'hashes': {'sha256': sha(b'A' * 9)}}]}
        struct.pack_into('<I', prefix, 20, 0)
        self.raw = bytes(prefix) + suffix
        self.modules = {}
        for name, data in [('main', bytes(prefix)), ('ITCM', b'A' * 9), ('DTCM', b'A' * 9)]:
            path = self.root / (name + '.bin')
            path.write_bytes(data)
            self.modules[name] = path
        self.encoder = self.root / 'encoder.py'
        self.set_encoder(f"Path(sys.argv[2]).write_bytes({self.raw!r})")

    def set_encoder(self, body):
        self.encoder.write_text('#!/usr/bin/env python3\nimport sys\nfrom pathlib import Path\n' + body + '\n')
        self.encoder.chmod(0o755)

    def run_packer(self, **kwargs):
        args = dict(child_path=self.child, executable_row=self.row, native_modules=self.modules,
                    encoder_path=self.encoder, encoder_sha256=sha(self.encoder.read_bytes()), output_path=self.output)
        args.update(kwargs)
        return target.repack_child_arm9(**args)

    def test_fresh_encoder_output_rebuilds_all_native_modules_exactly(self):
        report = self.run_packer()
        self.assertEqual(self.output.read_bytes(), self.child.read_bytes())
        self.assertEqual(report['status'], 'binary_roundtrip_verified')
        self.assertEqual(report['source_bytes'], 0)
        self.assertFalse(report['source_complete'])
        self.assertFalse(report['task_complete'])
        self.assertEqual(set(report['native_modules']), set(self.modules))
        self.assertEqual(report['encoder']['sha256'], sha(self.encoder.read_bytes()))

    def test_native_module_mutation_rejects_before_encoding(self):
        self.modules['ITCM'].write_bytes(b'B' * 9)
        with self.assertRaisesRegex(ValueError, 'extracted ARM9 module'):
            self.run_packer()
        self.assertFalse(self.output.exists())

    def test_omitted_module_rejects(self):
        with self.assertRaisesRegex(ValueError, 'scope'):
            self.run_packer(native_modules={'main': self.modules['main']})

    def test_original_header_or_preserved_arm7_mutation_rejects(self):
        original = self.child.read_bytes()
        for offset in (0, 224):
            damaged = bytearray(original)
            damaged[offset] ^= 1
            self.child.write_bytes(damaged)
            with self.assertRaisesRegex(ValueError, 'original child identity'):
                self.run_packer()

    def test_wrong_encoder_pin_rejects(self):
        with self.assertRaisesRegex(ValueError, 'encoder pin'):
            self.run_packer(encoder_sha256='0' * 64)

    def test_copied_original_stored_arm9_is_not_fresh_normalized_encoding(self):
        self.set_encoder(f'Path(sys.argv[2]).write_bytes({self.child.read_bytes()[128:190]!r})')
        with self.assertRaisesRegex(ValueError, 'expanded encoder output'):
            self.run_packer()

    def test_encoder_mutation_and_missing_output_reject(self):
        raw = bytearray(self.raw)
        raw[40] ^= 1
        self.set_encoder(f'Path(sys.argv[2]).write_bytes({bytes(raw)!r})')
        with self.assertRaisesRegex(ValueError, 'expanded encoder output'):
            self.run_packer()
        self.set_encoder('pass')
        with self.assertRaisesRegex(ValueError, 'encoder output'):
            self.run_packer()

    def test_valid_alternative_encoding_still_rejects_size_mismatch(self):
        aligned_suffix = b'\x00\xc0AAA\x10\xff\xff' + struct.pack('<II', 0x0a000010, 2)
        alternative = self.raw[:48] + aligned_suffix
        self.set_encoder(f'Path(sys.argv[2]).write_bytes({alternative!r})')
        with self.assertRaisesRegex(ValueError, 'compressed encoder size'):
            self.run_packer()

    def test_live_native_file_change_during_encoding_rejects(self):
        self.set_encoder(f"Path({str(self.modules['DTCM'])!r}).write_bytes(b'changed')\nPath(sys.argv[2]).write_bytes({self.raw!r})")
        with self.assertRaisesRegex(ValueError, 'inputs changed'):
            self.run_packer()

    def test_existing_output_is_never_overwritten(self):
        self.output.write_bytes(b'keep')
        with self.assertRaisesRegex(ValueError, 'fresh output'):
            self.run_packer()
        self.assertEqual(self.output.read_bytes(), b'keep')

    def test_expanded_layout_gap_or_overlap_rejects(self):
        for value in (47, 49):
            row = copy.deepcopy(self.row)
            row['remaining_intervals'][1]['source_offset'] = value
            with self.assertRaisesRegex(ValueError, 'expanded layout'):
                self.run_packer(executable_row=row)


if __name__ == '__main__':
    unittest.main()
