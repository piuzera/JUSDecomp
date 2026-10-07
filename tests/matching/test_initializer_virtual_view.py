"""Actual-tool negatives for a declaration-only resource virtual ABI view."""
import os
import struct
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import module

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/matching-notes/pilot-t06/initializer-virtual-view/resource_view.cpp'
CONSTRUCTOR = SOURCE.with_name('flags_constructor.cpp')


class InitializerVirtualView(unittest.TestCase):
    def test_saved_candidate_exists(self):
        self.assertTrue(SOURCE.is_file(), 'virtual ABI view candidate has not been implemented')

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for declaration-only ABI checks')
    def test_field_shift_fails_physical_layout_guard(self):
        self.assertTrue(SOURCE.is_file(), 'virtual ABI view candidate has not been implemented')
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            mutated = tmp / 'wrong-field.cpp'
            mutated.write_text(SOURCE.read_text().replace('resource_unknown_04[0x34]',
                                                        'resource_unknown_04[0x38]'))
            destination, result = self.compile(tmp, 'wrong-field', source=mutated)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('field_38 == 0x38', result.stdout + result.stderr)
            self.assertFalse(destination.exists())

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for declaration-only ABI checks')
    def test_reserved_slot_shift_rejected_without_emitting_view_methods(self):
        self.assertTrue(SOURCE.is_file(), 'virtual ABI view candidate has not been implemented')
        gate = module()
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            accepted, result = self.compile(tmp, 'accepted')
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            elf, symbols, sections = gate._object(accepted)
            self.assertEqual(set(sections), {'.text'})
            self.assertEqual(set(gate._functions(elf, symbols)), {'func_0206c244'})
            self.assertFalse(any('ResourceVirtualAbi' in elf.symbol_name(s) for s in symbols))
            text = elf.content(sections['.text'][1])
            word = struct.unpack_from('<I', text, 0x64)[0]
            self.assertEqual(word & 0x000fffff, 0x00001000,
                             'resource vptr load does not use receiver r0 at offset0')
            slot_word = struct.unpack_from('<I', text, 0x68)[0]
            self.assertEqual(slot_word & 0x00000fff, 0x14)
            changed = tmp / 'shifted-slot.cpp'
            changed.write_text(SOURCE.read_text().replace('virtual Word AbiSlot14();',
                                                         'virtual Word ExtraReservedSlot();\n    virtual Word AbiSlot14();'))
            mutated, result = self.compile(tmp, 'shifted-slot', source=changed)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            with self.assertRaisesRegex(ValueError, 'initialized section bytes'):
                gate.compare_objects(accepted, mutated, ['func_0206c244'])

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for destination checks')
    def test_context_and_table_identity_mutations_rejected(self):
        self.assertTrue(SOURCE.is_file(), 'virtual ABI view candidate has not been implemented')
        gate = module()
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            accepted, result = self.compile(tmp, 'accepted')
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            before = gate.sha256(accepted)
            for name, flag in [('table', '-Ddata_0209e050=changed_archive_table'),
                               ('call', '-Dfunc_0206c498=changed_context_push')]:
                changed, result = self.compile(tmp, name, flags=[flag])
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                with self.assertRaisesRegex(ValueError, 'relocation identities'):
                    gate.compare_objects(accepted, changed, ['func_0206c244'])
            self.assertEqual(gate.sha256(accepted), before)

    def test_constructor_candidate_exists(self):
        self.assertTrue(CONSTRUCTOR.is_file(), 'physical constructor candidate has not been implemented')

    @unittest.skipUnless(os.environ.get('JUS_INIT_MWCC') and os.environ.get('JUS_INIT_WIBO'),
                         'set pinned compiler and runner for physical constructor checks')
    def test_constructor_extent_and_destination_mutations_rejected(self):
        self.assertTrue(CONSTRUCTOR.is_file(), 'physical constructor candidate has not been implemented')
        gate = module()
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            wrong = tmp / 'wrong-extent.cpp'
            wrong.write_text(CONSTRUCTOR.read_text().replace('char unknown_04[0x10];',
                                                             'char unknown_04[0x14];'))
            destination, result = self.compile(tmp, 'wrong-extent', source=wrong)
            self.assertNotEqual(result.returncode, 0)
            self.assertFalse(destination.exists())
            self.assertIn('sizeof(Flags) == 0x28', result.stdout + result.stderr)
            outlined, result = self.compile(tmp, 'constructor-outlined', source=CONSTRUCTOR)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            with self.assertRaisesRegex(ValueError, 'duplicate allocated section'):
                gate.compare_objects(outlined, outlined, ['func_0206c244'])
            original, result = self.compile(tmp, 'constructor-inlined', source=CONSTRUCTOR, flags=['-O2,p'])
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            elf, symbols, allocated = gate._object(original)
            self.assertEqual(set(allocated), {'.text'})
            self.assertEqual(set(gate._functions(elf, symbols)), {'func_0206c244'})
            for name, flag in [('key', '-Ddata_0209e280=changed_key_identity'),
                               ('constructor', '-Dfunc_0202c4ac=changed_constructor_identity')]:
                mutant, result = self.compile(tmp, name, source=CONSTRUCTOR, flags=['-O2,p', flag])
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                with self.assertRaisesRegex(ValueError, 'relocation identities'):
                    gate.compare_objects(original, mutant, ['func_0206c244'])

    def compile(self, directory, name, source=SOURCE, flags=()):
        destination = directory / (name + '.o')
        command = [os.environ['JUS_INIT_WIBO'], os.environ['JUS_INIT_MWCC'], '-c',
                   '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc', '-O2',
                   *flags, '-o', str(destination), str(source)]
        environment = {k: v for k, v in os.environ.items() if not k.upper().startswith(('MWC', 'MWARM'))}
        return destination, subprocess.run(command, env=environment, capture_output=True, text=True)


if __name__ == '__main__':
    unittest.main()
