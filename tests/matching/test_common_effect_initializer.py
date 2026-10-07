"""ABI and destination negatives for the bounded initializer candidate."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import module

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/matching-notes/pilot-t06/initializer/common_effect_init.cpp'


class CommonEffectInitializer(unittest.TestCase):
    def test_candidate_exists(self):
        self.assertTrue(SOURCE.is_file(), 'initializer candidate has not been implemented')

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for actual object negatives')
    def test_physical_record_stride_rejects_layout_mutation(self):
        self.assertTrue(SOURCE.is_file(), 'initializer candidate has not been implemented')
        with tempfile.TemporaryDirectory() as tmp:
            accepted = self.compile(Path(tmp), 'accepted', [])
            changed = self.compile(Path(tmp), 'changed', ['-DJUS_INIT_RECORD_PAD=4'], expect_success=False)
            self.assertFalse(changed.is_file())
            self.assertTrue(accepted.is_file())

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for actual object negatives')
    def test_original_archive_table_identity_cannot_be_substituted(self):
        self.check_destination_mutation('-Ddata_0209e050=changed_archive_names')

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for actual object negatives')
    def test_original_context_call_identity_cannot_be_substituted(self):
        self.check_destination_mutation('-Dfunc_0206c498=changed_context_push')

    def compile(self, directory, name, flags, expect_success=True):
        self.assertTrue(SOURCE.is_file(), 'initializer candidate has not been implemented')
        destination = directory / (name + '.o')
        command = [os.environ['JUS_INIT_WIBO'], os.environ['JUS_INIT_MWCC'], '-c',
                   '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc', '-O2',
                   *flags, '-o', str(destination), str(SOURCE)]
        result = subprocess.run(command, capture_output=True, text=True)
        if expect_success:
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        else:
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('RecordStride', result.stdout + result.stderr)
        return destination

    def check_destination_mutation(self, flag):
        gate = module()
        with tempfile.TemporaryDirectory() as tmp:
            directory = Path(tmp)
            accepted = self.compile(directory, 'accepted', [])
            digest = gate.sha256(accepted)
            changed = self.compile(directory, 'changed', [flag])
            with self.assertRaisesRegex(ValueError, 'relocation identities'):
                gate.compare_objects(accepted, changed, ['func_0206c244'])
            self.assertEqual(gate.sha256(accepted), digest)


if __name__ == '__main__':
    unittest.main()
