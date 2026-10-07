import hashlib
import importlib
import json
from pathlib import Path
import tempfile
import unittest

try:
    reproduce=importlib.import_module('reproduce')
except ModuleNotFoundError:
    reproduce=None

class ActualLowerStoreTests(unittest.TestCase):
    receipt=None

    def completed(self):
        self.assertIsNotNone(reproduce,'finite lower-store replay not implemented')
        if self.__class__.receipt is None:
            self.__class__.temporary=tempfile.TemporaryDirectory(prefix='jus-low-store-tests-',dir='/private/tmp')
            self.__class__.output=Path(self.temporary.name)/'fresh'
            path=reproduce.replay(self.output)
            self.assertEqual(path,self.output/'trial-proof.json')
            self.__class__.receipt=json.loads(path.read_text())
        return self.receipt

    @classmethod
    def tearDownClass(cls):
        if hasattr(cls,'temporary'):
            cls.temporary.cleanup()

    def test_actual_five_instruction_object_and_direct_native_map_function_bytes(self):
        r=self.completed()
        self.assertEqual(r['status'],'actual_lower_store_native_exact_original_images')
        self.assertEqual(r['elf']['instruction_bytes'],20)
        self.assertEqual(r['elf']['pool_bytes'],0)
        self.assertEqual(r['elf']['relocations'],[])
        digest=hashlib.sha256((self.output/'compiled.o').read_bytes()).hexdigest()
        self.assertEqual(digest,r['elf']['object_sha256'])
        store=importlib.import_module('store')
        for index,program in enumerate(r['programs']):
            folder=self.output/'native'/f'program-{index}'
            positive=program['positive']
            self.assertEqual(hashlib.sha256((folder/'compiled.o').read_bytes()).hexdigest(),digest)
            self.assertIn('compiled.o',positive['native_command']['argv'])
            self.assertIn(positive['map_row'],(folder/'positive.map').read_text().splitlines())
            _,sections,_,symbols=store._parse_elf(folder/'positive.elf')
            function,=[s for s in symbols if s['name']=='arm7_low_store_trial']
            self.assertEqual((function['vma'],function['size']),(0x037fcf04,20))
            section=sections[function['section']]
            start=section['offset']+function['vma']-section['vma']
            linked=(folder/'positive.elf').read_bytes()[start:start+20]
            self.assertEqual(hashlib.sha256(linked).hexdigest(),'b1f95073bcc84916809b86a81bc8d2b6246515a3c4646a1f9ac171214a389488')
            self.assertEqual(positive['image_sha256'],'0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139')
            self.assertEqual(len(positive['segments']),6)
            self.assertEqual(positive['BSS_bytes'],21424)

    def test_actual_omitted_object_wrong_placement_and_malformed_load_reject(self):
        r=self.completed()
        for program in r['programs']:
            self.assertNotEqual(program['omitted_object']['returncode'],0)
            self.assertNotIn('compiled.o',program['omitted_object']['argv'])
            self.assertNotEqual(program['wrong_placement']['returncode'],0)
            self.assertIn('compiled.o',program['wrong_placement']['argv'])
            self.assertIn('candidate start',program['wrong_placement']['stderr'])
            self.assertTrue(program['malformed_load']['rejected'])

if __name__=='__main__':
    unittest.main()
