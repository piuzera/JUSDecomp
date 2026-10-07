import hashlib
import importlib
import json
from pathlib import Path
import struct
import tempfile
import unittest

try:
    reproduce=importlib.import_module('reproduce')
except ModuleNotFoundError:
    reproduce=None

class ActualFourRoleTests(unittest.TestCase):
    receipt=None

    def completed(self):
        self.assertIsNotNone(reproduce,'fixed four-role native replay not implemented')
        if self.__class__.receipt is None:
            self.__class__.temporary=tempfile.TemporaryDirectory(prefix='jus-cluster-tests-',dir='/private/tmp')
            self.__class__.output=Path(self.temporary.name)/'fresh'
            path=reproduce.replay(self.output)
            self.assertEqual(path,self.output/'trial-proof.json')
            self.__class__.receipt=json.loads(path.read_text())
        return self.receipt

    @classmethod
    def tearDownClass(cls):
        if hasattr(cls,'temporary'):cls.temporary.cleanup()

    def test_four_real_inputs_keep_each_recipe_map_function_bytes_and_complete_images(self):
        r=self.completed();cluster=importlib.import_module('cluster')
        roles=['lower_store','upper_store','lower_getter','upper_getter']
        self.assertEqual([c['role']for c in r['candidates']],roles)
        self.assertEqual([c['elf']['object_sha256']for c in r['candidates']],['b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7','03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf','9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b','b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1'])
        self.assertEqual([len(c['elf']['relocations'])for c in r['candidates']],[0,0,2,3])
        for c in r['candidates']:
            argv=c['compile_command']['argv']
            self.assertIn('-O4,p'if c['role']=='upper_store'else'-O4,s',argv)
            self.assertIn('/private/tmp/jus-track-a/tools/mwccarm/2.0/base/mwccarm.exe'if c['role']=='upper_store'else'/private/tmp/jus-track-a/tools/mwccarm/1.2/sp2p3/mwccarm.exe',argv)
            self.assertEqual(hashlib.sha256((self.output/(c['role']+'.o')).read_bytes()).hexdigest(),c['elf']['object_sha256'])
        for index,p in enumerate(r['programs']):
            folder=self.output/'native'/f'program-{index}';positive=p['positive'];data=(folder/'positive.elf').read_bytes()
            _,sections,segments,symbols=cluster._parse_elf(folder/'positive.elf')
            allocated=[s for s in sections if s['flags']&2 and s['size']]
            named=dict(zip([s['name']for s in allocated],segments,strict=True))
            image=b''.join(data[named['.arm7.'+name]['offset']:named['.arm7.'+name]['offset']+named['.arm7.'+name]['file_bytes']]for name in('startup','autoload0','autoload1','table'))
            self.assertEqual(len(image),165552)
            self.assertEqual(hashlib.sha256(image).hexdigest(),'0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139')
            for c,row in zip(r['candidates'],positive['candidates'],strict=True):
                self.assertEqual(hashlib.sha256((folder/(c['role']+'.o')).read_bytes()).hexdigest(),c['elf']['object_sha256'])
                self.assertIn(c['role']+'.o',positive['native_command']['argv'])
                self.assertIn(row['map_row'],(folder/'positive.map').read_text().splitlines())
                fields=row['map_row'].split();self.assertEqual((int(fields[0],16),int(fields[2],16)),(c['vma'],c['bytes']))
                symbol,=[s for s in symbols if s['name']==c['elf']['trial_symbol']['name']]
                section=sections[symbol['section']];start=section['offset']+symbol['vma']-section['vma']
                self.assertEqual((symbol['vma'],symbol['size']),(c['vma'],c['bytes']))
                self.assertEqual(hashlib.sha256(data[start:start+symbol['size']]).hexdigest(),c['original_bytes_sha256'])
            self.assertEqual(positive['BSS_bytes'],21424)
            self.assertEqual(len(segments),6)

    def test_shared_wram_changes_both_getter_pools_and_neither_store(self):
        r=self.completed();cluster=importlib.import_module('cluster')
        for index,p in enumerate(r['programs']):
            wrong=p['wrong_shared_wram'];self.assertEqual(wrong['image_mismatch_offsets'],[20784,20908]);self.assertEqual(wrong['derived_mismatch_offsets'],[20784,20908])
            self.assertEqual(wrong['bindings'],wrong['observed_bindings'])
            folder=self.output/'native'/f'program-{index}';data=(folder/'wrong_shared_wram.elf').read_bytes()
            _,sections,_,symbols=cluster._parse_elf(folder/'wrong_shared_wram.elf')
            for c in r['candidates']:
                symbol,=[s for s in symbols if s['name']==c['elf']['trial_symbol']['name']]
                section=sections[symbol['section']];start=section['offset']+symbol['vma']-section['vma']
                if c['role'].endswith('store'):
                    self.assertEqual(hashlib.sha256(data[start:start+symbol['size']]).hexdigest(),c['original_bytes_sha256'])
                else:
                    slot,=[x for x in c['elf']['relocations']if x['symbol']=='hyp_wram_arena_lo']
                    self.assertEqual(struct.unpack_from('<I',data,start+slot['offset'])[0],0x0380bc94)
            self.assertIn('original image mismatch',wrong['strict_rejection'])

    def test_every_omitted_role_and_real_equal_size_store_swap_reject(self):
        r=self.completed();cluster=importlib.import_module('cluster')
        for index,p in enumerate(r['programs']):
            for c in r['candidates']:
                omitted=p['omitted'][c['role']];self.assertNotEqual(omitted['returncode'],0);self.assertNotIn(c['role']+'.o',omitted['argv'])
            swap=p['swapped_stores'];self.assertEqual(swap['native_command']['returncode'],0)
            self.assertIn('map placement',swap['strict_role_rejection'])
            _,_,_,symbols=cluster._parse_elf(self.output/'native'/f'program-{index}'/'swapped_stores.elf')
            low,=[s for s in symbols if s['name']=='arm7_low_store_trial'];high,=[s for s in symbols if s['name']=='arm7_store_trial']
            self.assertEqual((low['vma'],low['size']),(0x037fcf18,20))
            self.assertEqual((high['vma'],high['size']),(0x037fcf04,20))
            lines=(self.output/'native'/f'program-{index}'/'swapped_stores.map').read_text().splitlines()
            for role,address in [('lower_store',0x037fcf18),('upper_store',0x037fcf04)]:
                row,=[line for line in lines if line.split() and line.split()[-1]==role+'.o:(.text)']
                fields=row.split()
                self.assertEqual((int(fields[0],16),int(fields[2],16)),(address,20))

    def test_native_section_offsets_flags_and_malformed_load_reject(self):
        r=self.completed()
        for p in r['programs']:
            for segment,section in zip(p['positive']['segments'],p['positive']['sections'],strict=True):
                if segment['file_bytes']:self.assertEqual(segment['offset'],section['offset'])
            self.assertEqual([s['flags']for s in p['positive']['sections']if s['name']=='.arm7.autoload0'],[6])
            self.assertEqual([s['flags']for s in p['positive']['segments']if s['vma']==0x037f8000],[4])
            self.assertTrue(p['malformed_load']['rejected'])

if __name__=='__main__':unittest.main()
