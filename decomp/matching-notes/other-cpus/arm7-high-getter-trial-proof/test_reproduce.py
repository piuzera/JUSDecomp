import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

class PublicReplayTests(unittest.TestCase):
    def test_fresh_public_inputs_compile_and_native_link_actual_high_object(self):
        script=Path(__file__).resolve().parent/'reproduce.py'
        self.assertTrue(script.is_file(),'public high compile/native replay not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-high-replay-test-',dir='/private/tmp') as folder:
            output=Path(folder)/'fresh'
            replay=subprocess.run([sys.executable,str(script),str(output)],capture_output=True,text=True)
            self.assertEqual(replay.returncode,0,replay.stdout+replay.stderr)
            proof=json.loads((output/'trial-proof.json').read_text())
            self.assertEqual(proof['status'],'fixed_high_candidate_native_exact_original_images')
            self.assertEqual(proof['comparison']['instruction_mismatch_offsets'],[])
            self.assertEqual(proof['elf']['object_sha256'],'b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1')
            self.assertEqual(proof['elf']['instruction_bytes'],108)
            self.assertEqual(proof['elf']['pool_bytes'],20)
            self.assertEqual(len(proof['native_summary']['programs']),2)
            self.assertEqual(proof['source_credit_bytes'],0)

if __name__=='__main__':
    unittest.main()
