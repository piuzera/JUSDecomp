from pathlib import Path
import json
import subprocess
import sys
import tempfile
import unittest


class PublicReplayTests(unittest.TestCase):
    def test_replays_single_recipe_and_stops_before_native_link(self):
        script = Path(__file__).resolve().parent / 'reproduce.py'
        self.assertTrue(script.exists(), 'public single-candidate replay is not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-low-getter-test-', dir='/private/tmp') as folder:
            output = Path(folder) / 'replay'
            result = subprocess.run([sys.executable, str(script), str(output)], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            proof = json.loads((output/'trial-proof.json').read_text())
            self.assertEqual(proof['status'], 'fixed_candidate_mismatch_stop')
            self.assertEqual(proof['recipe_count'], 1)
            self.assertFalse(proof['native_link_attempted'])
            self.assertEqual(proof['comparison']['instruction_mismatch_offsets'], list(range(52,60)))
            self.assertTrue(proof['comparison']['explained_pool_exact_both_programs'])
            self.assertEqual(proof['negative']['wrong_binding_literal_mismatch_offsets'], [80,81])
            self.assertIn('literal pool mismatch', proof['negative']['verifier_rejection'])
            self.assertEqual(proof['source_credit_bytes'], 0)


if __name__ == '__main__':
    unittest.main()
