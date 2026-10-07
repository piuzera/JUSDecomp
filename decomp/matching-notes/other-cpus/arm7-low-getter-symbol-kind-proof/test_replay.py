from pathlib import Path
import json
import subprocess
import sys
import tempfile
import unittest


class DeclarationKindReplayTests(unittest.TestCase):
    def test_only_declaration_change_keeps_object_metadata_and_rejection(self):
        script = Path(__file__).resolve().parent / 'reproduce.py'
        self.assertTrue(script.exists(), 'public declaration-kind replay is not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-getter-kind-test-',dir='/private/tmp') as folder:
            output = Path(folder)/'replay'
            result = subprocess.run([sys.executable,str(script),str(output)],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)
            proof = json.loads((output/'trial-proof.json').read_text())
            self.assertEqual(proof['status'],'single_declaration_kind_same_object_mismatch_stop')
            self.assertTrue(proof['source_diff']['other_C_bytes_unchanged'])
            self.assertTrue(proof['source_diff']['original_greater_than_body_preserved'])
            self.assertEqual(proof['source_diff']['source_sha256'],'3f7b22c42f4b98cfed84308f2e5b658ae9cecdb8a17d900421e71ed70c496495')
            self.assertTrue(proof['same_full_object_as_original_trial'])
            self.assertTrue(proof['same_compiler_flags_as_original_trial'])
            symbol, = [s for s in proof['elf']['symbols'] if s['name']=='hyp_wram_arena_lo']
            self.assertEqual((symbol['type'],symbol['binding'],symbol['section_index'],symbol['value'],symbol['size']),(0,1,0,0,0))
            self.assertEqual(proof['comparison']['instruction_mismatch_offsets'],list(range(52,60)))
            self.assertFalse(proof['native_link_attempted'])
            self.assertEqual(proof['recipe_count'],1)
            self.assertEqual(proof['source_credit_bytes'],0)


if __name__ == '__main__':
    unittest.main()
