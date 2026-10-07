import hashlib
import json
import os
from pathlib import Path
import struct
import tempfile
import unittest

try:
    import native
except ModuleNotFoundError:
    native = None


class NativeRelocationRecipeTests(unittest.TestCase):
    def test_split_preserves_all_original_noncandidate_bytes(self):
        self.assertIsNotNone(native,'native candidate split is not implemented')
        rom=Path('/Users/djdjo/Documents/mine/rom/jus.nds').read_bytes()
        self.assertEqual(hashlib.sha256(rom).hexdigest(),'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
        image_offset,_,_,size=struct.unpack_from('<IIII',rom,0x30)
        original=rom[image_offset+432:image_offset+432+66120]
        prefix,candidate,suffix=native.split_autoload0(original)
        self.assertEqual((len(prefix),len(candidate),len(suffix)),(20268,88,45764))
        self.assertEqual(prefix+candidate+suffix,original)

    def test_link_script_consumes_actual_object_and_pins_bindings(self):
        self.assertIsNotNone(native,'native actual-object linker recipe is not implemented')
        layout=json.loads((Path(__file__).resolve().parent/'native-layout.json').read_text())
        script=native.build_link_script(layout,0x027f9c08)
        self.assertIn('compiled.o(.text)',script)
        self.assertIn('hyp_subpriv_arena_lo = 0x027f9c08;',script)
        self.assertIn('hyp_wram_arena_lo = 0x0380bc90;',script)
        self.assertIn('__candidate_start == 0x037fcf2c',script)
        self.assertIn('__candidate_end == 0x037fcf84',script)
        self.assertIn('__candidate_end - __candidate_start == 88',script)
        self.assertNotIn('autoload0.o(',script)

    def test_actual_native_link_and_three_original_evidence_negatives(self):
        self.assertIsNotNone(native,'native relocation/image verification is not implemented')
        with tempfile.TemporaryDirectory(prefix='jus-getter-native-test-',dir='/private/tmp') as folder:
            result=native.run_native(Path(folder)/'native',Path(os.environ['TRIAL_OBJECT']),Path(os.environ['WRONG_OBJECT']))
            self.assertEqual(result['status'],'actual_MW_RELA_native_exact_original_images')
            self.assertEqual(len(result['programs']),2)
            for program in result['programs']:
                positive=program['positive']['readback']
                self.assertEqual(positive['image_bytes'],165552)
                self.assertEqual(positive['image_sha256'],'0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139')
                self.assertEqual(len(positive['segments']),6)
                self.assertEqual(positive['BSS_bytes'],21424)
                self.assertEqual(program['wrong_binding']['image_mismatch_offsets'],[20780,20781])
                self.assertEqual(program['wrong_object']['image_mismatch_offsets'],list(range(20752,20760)))
                self.assertTrue(program['malformed_load_offset_rejected'])


if __name__=='__main__':
    unittest.main()
