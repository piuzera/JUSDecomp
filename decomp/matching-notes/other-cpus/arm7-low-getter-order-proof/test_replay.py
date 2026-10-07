from pathlib import Path
import json
import subprocess
import sys
import tempfile
import unittest


class OperandOrderReplayTests(unittest.TestCase):
    def test_only_operand_flip_reproduces_same_object_and_rejection(self):
        script = Path(__file__).resolve().parent / 'reproduce.py'
        self.assertTrue(script.exists(), 'public operand-order replay is not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-getter-order-test-', dir='/private/tmp') as folder:
            output = Path(folder)/'replay'
            result = subprocess.run([sys.executable,str(script),str(output)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            proof = json.loads((output/'trial-proof.json').read_text())
            self.assertEqual(proof['status'],'single_operand_flip_same_object_mismatch_stop')
            self.assertTrue(proof['source_diff']['other_C_bytes_unchanged'])
            self.assertEqual(proof['source_diff']['source_sha256'],'92aef5bc8ce408b4d1b19a95e8191b4668a82f335cbcb19302c52faf0668e0bb')
            self.assertTrue(proof['same_full_object_as_previous_trial'])
            self.assertTrue(proof['same_compiler_flags_as_previous_trial'])
            self.assertEqual(proof['comparison']['instruction_mismatch_offsets'],list(range(52,60)))
            self.assertFalse(proof['native_link_attempted'])
            self.assertEqual(proof['recipe_count'],1)
            self.assertEqual(proof['source_credit_bytes'],0)


if __name__ == '__main__':
    unittest.main()
