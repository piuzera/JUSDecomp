import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

class PublicReplayTests(unittest.TestCase):
    def test_fresh_checkout_inputs_compile_real_objects_and_link_both_originals(self):
        script=Path(__file__).resolve().parent/'reproduce.py'
        self.assertTrue(script.is_file(),'public compile/native replay is not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-getter-replay-test-',dir='/private/tmp') as folder:
            output=Path(folder)/'fresh'
            replay=subprocess.run([sys.executable,str(script),str(output)],capture_output=True,text=True)
            self.assertEqual(replay.returncode,0,replay.stdout+replay.stderr)
            proof=json.loads((output/'trial-proof.json').read_text())
            self.assertEqual(proof['status'],'fixed_candidate_native_exact_original_images')
            self.assertEqual(proof['comparison']['instruction_mismatch_offsets'],[])
            self.assertEqual(proof['elf']['object_sha256'],'9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b')
            self.assertEqual(proof['negative_control_elf']['object_sha256'],'a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20')
            self.assertEqual(len(proof['native_summary']['programs']),2)
            self.assertEqual(proof['source_credit_bytes'],0)

if __name__=='__main__':
    unittest.main()
