"""Bounded raw-object checks for the published CommonEffect factory."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import module

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/src/main/common_effect_factory.cpp'


class CommonEffectFactory(unittest.TestCase):
    def test_published_factory_source_exists(self):
        self.assertTrue(SOURCE.is_file(), 'published CommonEffect factory source is missing')

    @unittest.skipUnless(os.environ.get('JUS_CLASS_MWCC') and os.environ.get('JUS_CLASS_WIBO'),
                         'set explicit pinned compiler and runner for actual object checks')
    def test_complete_object_preserves_extent_pool_and_original_destinations(self):
        self.assertTrue(SOURCE.is_file(), 'published CommonEffect factory source is missing')
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
            self.assertEqual(gate._functions(elf, symbols), {'func_0206c57c': {
                'name': 'func_0206c57c', 'section': '.text', 'offset': 0, 'size': 56, 'mode': 'arm'}})
            self.assertEqual(gate._relocations(elf, symbols, sections), [
                {'section': '.text', 'offset': 20, 'type': 1, 'symbol': 'func_0201a21c', 'addend': -8},
                {'section': '.text', 'offset': 36, 'type': 1, 'symbol': 'func_0206ca4c', 'addend': -8},
                {'section': '.text', 'offset': 44, 'type': 2, 'symbol': 'data_0209e000', 'addend': 0},
                {'section': '.text', 'offset': 48, 'type': 2, 'symbol': 'data_0209dfd0', 'addend': 0},
                {'section': '.text', 'offset': 52, 'type': 2, 'symbol': 'func_02024a30', 'addend': 0}])
            before = gate.sha256(accepted)
            changed = compile('changed-callback.o', ['-O2', '-Dfunc_02024a30=func_02024a68'])
            with self.assertRaisesRegex(ValueError, 'relocation identities'):
                gate.compare_objects(accepted, changed, ['func_0206c57c'])
            self.assertEqual(gate.sha256(accepted), before)
            self.assertNotEqual(gate.sha256(changed), before)
            default = compile('default.o', [])
            with self.assertRaisesRegex(ValueError, 'function identities'):
                gate.compare_objects(accepted, default, ['func_0206c57c'])


if __name__ == '__main__':
    unittest.main()
