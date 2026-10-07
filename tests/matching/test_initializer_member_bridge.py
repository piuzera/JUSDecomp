"""Actual-tool negatives for a trivial physical Flags member bridge."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import module

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/matching-notes/pilot-t06/initializer-member-bridge/member_bridge.cpp'


class InitializerMemberBridge(unittest.TestCase):
    def test_saved_candidate_exists(self):
        self.assertTrue(SOURCE.is_file(), 'member bridge has not been implemented')

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for member ABI checks')
    def test_physical_layout_mutation_rejected_by_compiler(self):
        self.assertTrue(SOURCE.is_file(), 'member bridge has not been implemented')
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            wrong = tmp / 'wrong-layout.cpp'
            wrong.write_text(SOURCE.read_text().replace('char unknown_04[0x10];',
                                                        'char unknown_04[0x14];'))
            destination, result = self.compile(tmp, 'wrong-layout', source=wrong)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('sizeof(Flags) == 0x28', result.stdout + result.stderr)
            self.assertFalse(destination.exists())

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for relocation/object checks')
    def test_only_original_function_emitted_and_destination_mutants_rejected(self):
        self.assertTrue(SOURCE.is_file(), 'member bridge has not been implemented')
        gate = module()
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            baseline, result = self.compile(tmp, 'baseline')
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            elf, symbols, allocated = gate._object(baseline)
            self.assertEqual(set(allocated), {'.text'})
            functions = gate._functions(elf, symbols)
            self.assertEqual(set(functions), {'func_0206c244'})
            self.assertEqual(functions['func_0206c244']['size'], 596)
            self.assertFalse(any('Construct' in elf.symbol_name(s) for s in symbols))
            before = gate.sha256(baseline)
            for name, flag in [('key', '-Ddata_0209e280=changed_key_identity'),
                               ('callee', '-Dfunc_0202c4ac=changed_constructor_identity'),
                               ('table', '-Ddata_0209e050=changed_archive_table')]:
                changed, result = self.compile(tmp, name, flags=[flag])
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                with self.assertRaisesRegex(ValueError, 'relocation identities'):
                    gate.compare_objects(baseline, changed, ['func_0206c244'])
            self.assertEqual(gate.sha256(baseline), before)

    def compile(self, directory, name, source=SOURCE, flags=()):
        destination = directory / (name + '.o')
        command = [os.environ['JUS_INIT_WIBO'], os.environ['JUS_INIT_MWCC'], '-c',
                   '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc', '-O2',
                   *flags, '-o', str(destination), str(source)]
        environment = {k: v for k, v in os.environ.items() if not k.upper().startswith(('MWC', 'MWARM'))}
        return destination, subprocess.run(command, env=environment, capture_output=True, text=True)


if __name__ == '__main__':
    unittest.main()
