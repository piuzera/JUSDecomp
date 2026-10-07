import importlib
import hashlib
import json
from pathlib import Path
import struct
import tempfile
import unittest

try:
    reproduce=importlib.import_module('reproduce')
except ModuleNotFoundError:
    reproduce=None

class ActualPairProofTests(unittest.TestCase):
    output=None
    receipt=None

    def completed(self):
        self.assertIsNotNone(reproduce,'closed getter-pair replay not implemented')
        if self.__class__.receipt is None:
            self.__class__.folder=tempfile.TemporaryDirectory(prefix='jus-pair-tests-',dir='/private/tmp')
            self.__class__.output=Path(self.__class__.folder.name)/'fresh'
            path=reproduce.replay(self.__class__.output)
            self.assertIsInstance(path,Path)
            self.assertEqual(path,self.output/'trial-proof.json')
            self.__class__.receipt=json.loads(path.read_text())
        return self.receipt

    @classmethod
    def tearDownClass(cls):
        if hasattr(cls,'folder'):
            cls.folder.cleanup()

    def test_actual_two_objects_five_relas_and_linked_individual_functions(self):
        r=self.completed()
        self.assertEqual([g['role'] for g in r['getters']],['low','high'])
        self.assertEqual([g['elf']['object_sha256'] for g in r['getters']],['9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b','b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1'])
        self.assertEqual([len(g['elf']['relocations']) for g in r['getters']],[2,3])
        for index,program in enumerate(r['programs']):
            linked=program['positive']
            folder=self.output/'native'/f'program-{index}'
            native=folder/'positive.elf'
            payload=native.read_bytes()
            pair=importlib.import_module('pair')
            _,sections,_,symbols=pair._parse_elf(native)
            map_text=(folder/'positive.map').read_text()
            for getter,row in zip(r['getters'],linked['getters'],strict=True):
                role=getter['role']
                self.assertEqual(hashlib.sha256((self.output/(role+'.o')).read_bytes()).hexdigest(),getter['elf']['object_sha256'])
                self.assertEqual(hashlib.sha256((folder/(role+'.o')).read_bytes()).hexdigest(),getter['elf']['object_sha256'])
                self.assertEqual(row['actual_input_sha256'],getter['elf']['object_sha256'])
                self.assertEqual(row['map_input'],getter['role']+'.o:(.text)')
                self.assertEqual(row['function']['vma'],getter['vma'])
                self.assertEqual(row['function']['size'],getter['bytes'])
                self.assertEqual(row['map_vma'],getter['vma'])
                self.assertEqual(row['map_bytes'],getter['bytes'])
                self.assertEqual(row['linked_bytes_sha256'],getter['original_bytes_sha256'])
                self.assertIn(getter['role']+'.o',linked['native_command']['argv'])
                self.assertIn(row['map_row'],map_text.splitlines())
                fields=row['map_row'].split()
                self.assertEqual((int(fields[0],16),int(fields[2],16)),(getter['vma'],getter['bytes']))
                symbol,=[s for s in symbols if s['name']==getter['elf']['trial_symbol']['name']]
                section=sections[symbol['section']]
                start=section['offset']+symbol['vma']-section['vma']
                self.assertEqual(hashlib.sha256(payload[start:start+symbol['size']]).hexdigest(),getter['original_bytes_sha256'])
            self.assertEqual(json.loads((folder/'positive-command.json').read_text())['argv'],linked['native_command']['argv'])
            self.assertEqual(linked['image_sha256'],'0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139')
            self.assertEqual(linked['image_bytes'],165552)
            self.assertEqual(linked['BSS_bytes'],21424)
            self.assertEqual(len(linked['segments']),6)
            self.assertTrue(linked['noncandidate_bytes_unchanged'])

    def test_actual_shared_wram_binding_changes_both_derived_pool_bytes(self):
        r=self.completed()
        for index,program in enumerate(r['programs']):
            negative=program['wrong_shared_wram']
            folder=self.output/'native'/f'program-{index}'
            pair=importlib.import_module('pair')
            wrong=folder/'wrong_shared_wram.elf'
            _,sections,_,symbols=pair._parse_elf(wrong)
            payload=wrong.read_bytes()
            for getter in r['getters']:
                symbol,=[s for s in symbols if s['name']==getter['elf']['trial_symbol']['name']]
                section=sections[symbol['section']]
                relocation,=[x for x in getter['elf']['relocations'] if x['symbol']=='hyp_wram_arena_lo']
                offset=section['offset']+symbol['vma']-section['vma']+relocation['offset']
                self.assertEqual(struct.unpack_from('<I',payload,offset)[0],0x0380bc94)
            self.assertEqual(negative['image_mismatch_offsets'],[20784,20908])
            self.assertEqual(negative['derived_mismatch_offsets'],[20784,20908])
            self.assertEqual([g['linked_wram_word'] for g in negative['getters']],[0x0380bc94,0x0380bc94])
            self.assertEqual(negative['bindings']['wram'],0x0380bc94)
            self.assertIn('original image mismatch',negative['strict_rejection'])
            for trial in ('positive','wrong_shared_wram'):
                self.assertEqual(program[trial]['observed_bindings'],program[trial]['bindings'])

    def test_actual_omitted_and_swapped_roles_fail_native_placement(self):
        r=self.completed()
        for program in r['programs']:
            omitted=program['omitted_low']
            self.assertNotEqual(omitted['returncode'],0)
            self.assertNotIn('low.o',omitted['argv'])
            self.assertIn('high.o',omitted['argv'])
            swapped=program['swapped_roles']
            self.assertNotEqual(swapped['returncode'],0)
            self.assertIn('low.o',swapped['argv'])
            self.assertIn('high.o',swapped['argv'])
            self.assertIn('getter low size',swapped['stderr'])

    def test_native_file_offsets_follow_actual_sections_and_malformed_load_rejects(self):
        r=self.completed()
        for program in r['programs']:
            positive=program['positive']
            for segment,section in zip(positive['segments'],positive['sections'],strict=True):
                if segment['file_bytes']:
                    self.assertEqual(segment['offset'],section['offset'])
            self.assertEqual([s['flags'] for s in positive['sections'] if s['name']=='.arm7.autoload0'],[6])
            self.assertEqual([s['flags'] for s in positive['segments'] if s['vma']==0x037f8000],[4])
            self.assertTrue(program['malformed_load']['rejected'])

if __name__=='__main__':
    unittest.main()
