import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

class FrozenHighOriginalTests(unittest.TestCase):
    def test_both_original_programs_have_only_fixed_high_code_and_five_data_words(self):
        script=Path(__file__).resolve().parent/'read_original.py'
        self.assertTrue(script.is_file(),'bounded high original reader not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-high-read-',dir='/private/tmp') as folder:
            run=subprocess.run([sys.executable,str(script),folder],capture_output=True,text=True)
            self.assertEqual(run.returncode,0,run.stdout+run.stderr)
            read=json.loads((Path(folder)/'original-read.json').read_text())
            self.assertEqual(len(read['programs']),2)
            for program in read['programs']:
                self.assertEqual(sum(x['end']-x['start'] for x in program['selections']),108)
                self.assertEqual(program['selections'][0]['start'],0x037fcf84)
                self.assertEqual(program['selections'][-1]['end'],0x037fcff0)
                self.assertEqual([x['address'] for x in program['literals']],[0x037fcff0,0x037fcff4,0x037fcff8,0x037fcffc,0x037fd000])
                self.assertEqual([x['word'] for x in program['literals']],['0x027ff000','0x00000400','0x0380ff80','0x0380bc90','0x00000400'])
                self.assertTrue(all(x['value_mapping']['kind']=='unmapped' for x in program['literals']))
            self.assertEqual(sum(len(run['stdout'].strip().splitlines()) for run in read['llvm_runs']),27)

if __name__=='__main__':
    unittest.main()
