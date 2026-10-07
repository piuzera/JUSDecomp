"""Real-tool rejection checks for an external native constructor diagnostic."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import module

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/matching-notes/pilot-t06/initializer-external-constructor/external_constructor.cpp'


class InitializerExternalConstructor(unittest.TestCase):
    def test_saved_diagnostic_exists(self):
        self.assertTrue(SOURCE.is_file(), 'external constructor diagnostic is absent')

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned tools for physical layout checks')
    def test_shifted_flags_layout_rejected_by_compiler(self):
        self.assertTrue(SOURCE.is_file(), 'external constructor diagnostic is absent')
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            shifted = tmp / 'wrong-layout.cpp'
            shifted.write_text(SOURCE.read_text().replace('char unknown_04[0x10];',
                                                          'char unknown_04[0x14];'))
            destination, result = self.compile(tmp, 'wrong-layout', source=shifted)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('sizeof(Flags) == 0x28', result.stdout + result.stderr)
            self.assertFalse(destination.exists())

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned tools for extent/helper/identity checks')
    def test_original_function_only_and_native_constructor_identity_changes_reject(self):
        self.assertTrue(SOURCE.is_file(), 'external constructor diagnostic is absent')
        gate = module()
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            baseline, result = self.compile(tmp, 'baseline')
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            elf, symbols, allocated = gate._object(baseline)
            self.assertEqual(set(allocated), {'.text'})
            functions = gate._functions(elf, symbols)
            self.assertEqual(set(functions), {'func_0206c244'})
            self.assertEqual(functions['func_0206c244']['size'], 604,
                             'diagnostic must retain the observed extra null-check instructions')
            constructors = [s for s in symbols if 'FlagsC1' in elf.symbol_name(s)]
            self.assertEqual(len(constructors), 1)
            self.assertEqual(constructors[0][5], 0, 'native constructor must remain undefined')
            for name, flags in [('type', ['-DFlags=DifferentPhysicalFlags']),
                                ('label', ['-Ddata_0209e26c=changed_label_identity'])]:
                mutant, result = self.compile(tmp, name, flags=flags)
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                with self.assertRaisesRegex(ValueError, 'relocation identities'):
                    gate.compare_objects(baseline, mutant, ['func_0206c244'])

    @unittest.skipUnless(all(os.environ.get(k) for k in ['JUS_INIT_MWCC', 'JUS_INIT_WIBO', 'JUS_INIT_REFERENCE']),
                         'set pinned tools and complete original reference TU for strict identity rejection')
    def test_complete_original_reference_rejects_extent_before_constructor_identity(self):
        self.assertTrue(SOURCE.is_file(), 'external constructor diagnostic is absent')
        gate = module()
        reference = Path(os.environ['JUS_INIT_REFERENCE'])
        self.assertEqual(gate.sha256(reference), 'd60cee80415aa0f15843da8b1fdcc7a51b5265fc57e58f9634cce02d8508a4c9')
        with tempfile.TemporaryDirectory() as tmp:
            compiled, result = self.compile(Path(tmp), 'compiled')
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            with self.assertRaisesRegex(ValueError, 'function identities/extents/modes'):
                gate.compare_objects(reference, compiled, ['func_0206c244'])

    def compile(self, directory, name, source=SOURCE, flags=()):
        destination = directory / (name + '.o')
        command = [os.environ['JUS_INIT_WIBO'], os.environ['JUS_INIT_MWCC'], '-c',
                   '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc', '-O2',
                   *flags, '-o', str(destination), str(source)]
        environment = {k: v for k, v in os.environ.items() if not k.upper().startswith(('MWC', 'MWARM'))}
        return destination, subprocess.run(command, env=environment, capture_output=True, text=True)


if __name__ == '__main__':
    unittest.main()
