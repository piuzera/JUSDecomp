"""Bounded clone ABI, physical-offset and raw-object rejection checks."""
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import module

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/src/main/common_effect_clone.cpp'


class CommonEffectClone(unittest.TestCase):
    def test_published_clone_source_exists(self):
        self.assertTrue(SOURCE.is_file(), 'published CommonEffect clone source is missing')

    @unittest.skipUnless(os.environ.get('JUS_CLASS_MWCC') and os.environ.get('JUS_CLASS_WIBO'),
                         'set explicit pinned compiler and runner for actual object checks')
    def test_layout_and_complete_object_preserve_original_clone_contract(self):
        self.assertTrue(SOURCE.is_file(), 'published CommonEffect clone source is missing')
        gate = module()
        with tempfile.TemporaryDirectory() as directory:
            directory = Path(directory)
            command = [os.environ['JUS_CLASS_WIBO'], os.environ['JUS_CLASS_MWCC'],
                       '-c', '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc']
            def compile(name, flags, expect_success=True, source=SOURCE):
                path = directory / name
                completed = subprocess.run([*command, *flags, '-o', str(path), str(source)],
                                           capture_output=True, text=True)
                if expect_success:
                    self.assertEqual(completed.returncode, 0, completed.stdout + completed.stderr)
                else:
                    self.assertNotEqual(completed.returncode, 0, 'wrong member offset compiled successfully')
                    self.assertFalse(path.exists(), 'layout failure emitted an object')
                    self.assertIn('member_80 == 0x80', completed.stdout + completed.stderr)
                return path
            accepted = compile('accepted.o', ['-O2'])
            elf, symbols, sections = gate._object(accepted)
            self.assertEqual(set(sections), {'.text'})
            self.assertEqual(gate._functions(elf, symbols), {'func_0206cfc0': {
                'name': 'func_0206cfc0', 'section': '.text', 'offset': 0, 'size': 80, 'mode': 'arm'}})
            self.assertEqual(gate._relocations(elf, symbols, sections), [
                {'section': '.text', 'offset': 24, 'type': 1, 'symbol': 'func_0201a21c', 'addend': -8},
                {'section': '.text', 'offset': 40, 'type': 1, 'symbol': 'func_02015dd4', 'addend': -8},
                {'section': '.text', 'offset': 68, 'type': 2, 'symbol': 'data_0209e040', 'addend': 0},
                {'section': '.text', 'offset': 72, 'type': 2, 'symbol': 'data_0209dfc4', 'addend': 0},
                {'section': '.text', 'offset': 76, 'type': 2, 'symbol': 'data_0209e114', 'addend': 0}])
            before = gate.sha256(accepted)
            wrong_offset = directory / 'wrong-offset.cpp'
            wrong_offset.write_text(SOURCE.read_text().replace('unknown_04_7f[0x7c]', 'unknown_04_7f[0x7a]'))
            compile('wrong-offset.o', ['-O2'], False, wrong_offset)
            wrong_callee = directory / 'wrong-callee.cpp'
            wrong_callee.write_text(SOURCE.read_text().replace('func_02015dd4', 'func_02015d0c'))
            changed = compile('changed-base.o', ['-O2'], source=wrong_callee)
            with self.assertRaisesRegex(ValueError, 'relocation identities'):
                gate.compare_objects(accepted, changed, ['func_0206cfc0'])
            self.assertEqual(gate.sha256(accepted), before)
            self.assertNotEqual(gate.sha256(changed), before)
            default = compile('default.o', [])
            with self.assertRaisesRegex(ValueError, 'function identities'):
                gate.compare_objects(accepted, default, ['func_0206cfc0'])


if __name__ == '__main__':
    unittest.main()
