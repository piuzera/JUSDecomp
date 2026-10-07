"""Bounded compiler checks for the published CommonEffect lifecycle entries."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import module

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/src/main/common_effect_deleting_destroy.cpp'


class CommonEffectLifecycle(unittest.TestCase):
    def test_published_deleting_entry_source_exists(self):
        self.assertTrue(SOURCE.is_file(), 'published deleting-destructor source is missing')

    @unittest.skipUnless(os.environ.get('JUS_CLASS_MWCC') and os.environ.get('JUS_CLASS_WIBO'),
                         'set explicit pinned compiler and runner for actual object checks')
    def test_pinned_object_has_exact_extent_and_original_call_identities(self):
        self.assertTrue(SOURCE.is_file(), 'published deleting-destructor source is missing')
        gate = module()
        with tempfile.TemporaryDirectory() as directory:
            directory = Path(directory)
            command = [os.environ['JUS_CLASS_WIBO'], os.environ['JUS_CLASS_MWCC'],
                       '-c', '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc']
            def compile(name, flags):
                path = directory / name
                completed = subprocess.run([*command, *flags, '-o', str(path), str(SOURCE)],
                                           capture_output=True, text=True)
                self.assertEqual(completed.returncode, 0, completed.stdout + completed.stderr)
                return path
            accepted = compile('accepted.o', ['-O2'])
            elf, symbols, sections = gate._object(accepted)
            self.assertEqual(set(sections), {'.text'})
            self.assertEqual(gate._functions(elf, symbols), {'func_0206cfa4': {
                'name': 'func_0206cfa4', 'section': '.text', 'offset': 0, 'size': 28, 'mode': 'arm'}})
            self.assertEqual(gate._relocations(elf, symbols, sections), [
                {'section': '.text', 'offset': 8, 'type': 1, 'symbol': 'func_02015ed8', 'addend': -8},
                {'section': '.text', 'offset': 16, 'type': 1, 'symbol': 'func_0201b244', 'addend': -8}])
            before = gate.sha256(accepted)
            changed = compile('changed-call.o', ['-O2', '-Dfunc_0201b244=func_0201b268'])
            with self.assertRaisesRegex(ValueError, 'relocation identities'):
                gate.compare_objects(accepted, changed, ['func_0206cfa4'])
            self.assertEqual(gate.sha256(accepted), before)
            self.assertNotEqual(gate.sha256(changed), before)
            default = compile('default.o', [])
            with self.assertRaisesRegex(ValueError, 'function identities'):
                gate.compare_objects(accepted, default, ['func_0206cfa4'])


if __name__ == '__main__':
    unittest.main()
