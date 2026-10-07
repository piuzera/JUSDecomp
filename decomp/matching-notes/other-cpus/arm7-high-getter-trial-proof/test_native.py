import os
from pathlib import Path
import tempfile
import unittest

try:
    import native
except ModuleNotFoundError:
    native=None

class ActualHighNativeTests(unittest.TestCase):
    def test_actual_high_object_native_three_symbol_link_and_original_negatives(self):
        self.assertIsNotNone(native,'bounded128 high native relocation proof not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-high-native-test-',dir='/private/tmp') as folder:
            result=native.run_native(Path(folder)/'native',Path(os.environ['TRIAL_OBJECT']))
            self.assertEqual(len(result['programs']),2)
            for program in result['programs']:
                positive=program['positive']['readback']
                self.assertEqual(positive['image_bytes'],165552)
                self.assertEqual(positive['image_sha256'],'0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139')
                self.assertEqual(len(positive['segments']),6)
                self.assertEqual(positive['BSS_bytes'],21424)
                self.assertEqual(positive['linked_candidate_sha256'],'13b9cdc287f94094ed89582210e0c8d008ca9395b768c3f3fec183882af88fa4')
                self.assertEqual(positive['linked_literal_words'],['0x027ff000','0x00000400','0x0380ff80','0x0380bc90','0x00000400'])
                self.assertEqual(program['wrong_binding']['image_mismatch_offsets'],[20901])
                self.assertTrue(program['malformed_load_offset_rejected'])

if __name__=='__main__':
    unittest.main()
