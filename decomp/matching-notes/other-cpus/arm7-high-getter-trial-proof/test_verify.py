import os
from pathlib import Path
import unittest

try:
    import verify
except ModuleNotFoundError:
    verify=None

class ActualObjectReadbackTests(unittest.TestCase):
    def test_actual_mapping_marker_and_all_three_real_symbolic_pool_operands(self):
        self.assertIsNotNone(verify,'observed-extent high object parser not implemented')
        row=verify.inspect_object(Path(os.environ['TRIAL_OBJECT']))
        self.assertEqual(row['instruction_bytes'],108)
        self.assertEqual(row['pool_bytes'],20)
        self.assertEqual(row['trial_symbol']['size'],128)
        self.assertEqual([(r['offset'],r['symbol'],r['type'],r['addend']) for r in row['relocations']],[(112,'hyp_irq_stack_size',2,0),(120,'hyp_wram_arena_lo',2,0),(124,'hyp_system_stack_size',2,0)])
        self.assertEqual(row['mode_evidence'][1]['value'],row['instruction_bytes'])

    def test_actual_pool_includes_constants_and_rejects_wrong_irq_binding(self):
        self.assertIsNotNone(verify,'observed high pool verifier not implemented')
        row=verify.inspect_object(Path(os.environ['TRIAL_OBJECT']))
        bindings={'hyp_irq_stack_size':0x400,'hyp_wram_arena_lo':0x0380bc90,'hyp_system_stack_size':0x400}
        expected=bytes.fromhex('00f07f020004000080ff800390bc800300040000')
        verify.check_pool(row,bindings,expected)
        with self.assertRaisesRegex(ValueError,'literal pool mismatch'):
            verify.check_pool(row,{**bindings,'hyp_irq_stack_size':0x800},expected)

if __name__=='__main__':
    unittest.main()
