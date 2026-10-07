import os
from pathlib import Path
import unittest

try:
    import verify
except ModuleNotFoundError:
    verify = None


class ObjectReadbackTests(unittest.TestCase):
    def test_reads_real_arm_object_relocations(self):
        self.assertIsNotNone(verify, 'actual ARM object verifier is not implemented')
        row = verify.inspect_object(Path(os.environ['TRIAL_OBJECT']))
        self.assertEqual(row['machine'], 40)
        self.assertEqual(row['mode'], 'Arm')
        self.assertEqual(row['trial_symbol']['name'], 'arm7_low_getter_trial')
        self.assertEqual({r['symbol'] for r in row['relocations']},
                         {'hyp_subpriv_arena_lo', 'hyp_wram_arena_lo'})
        self.assertTrue(all(r['type'] == 2 and r['addend'] == 0 for r in row['relocations']))
        self.assertEqual(len(row['relocations']), 2)

    def test_wrong_binding_changes_a_real_relocated_literal(self):
        self.assertIsNotNone(verify, 'actual ARM relocation verifier is not implemented')
        row = verify.inspect_object(Path(os.environ['TRIAL_OBJECT']))
        correct = {'hyp_subpriv_arena_lo': 0x027f9c08, 'hyp_wram_arena_lo': 0x0380bc90}
        right = verify.resolve_literals(row, correct)
        wrong = verify.resolve_literals(row, {**correct, 'hyp_subpriv_arena_lo': 0x027fafcc})
        offsets = [r['offset'] for r in row['relocations'] if r['symbol'] == 'hyp_subpriv_arena_lo']
        self.assertEqual(len(offsets), 1)
        offset = offsets[0]
        self.assertEqual(int.from_bytes(right[offset:offset+4], 'little'), 0x027f9c08)
        self.assertEqual(int.from_bytes(wrong[offset:offset+4], 'little'), 0x027fafcc)
        self.assertNotEqual(right, wrong)

    def test_wrong_binding_is_rejected_against_original_literal_words(self):
        self.assertIsNotNone(verify, 'actual pool correspondence verifier is not implemented')
        row = verify.inspect_object(Path(os.environ['TRIAL_OBJECT']))
        correct = {'hyp_subpriv_arena_lo': 0x027f9c08, 'hyp_wram_arena_lo': 0x0380bc90}
        expected = bytes.fromhex('089c7f0290bc8003')
        verify.check_pool(row, correct, expected)
        with self.assertRaisesRegex(ValueError, 'literal pool mismatch'):
            verify.check_pool(row, {**correct, 'hyp_subpriv_arena_lo': 0x027fafcc}, expected)


if __name__ == '__main__':
    unittest.main()
