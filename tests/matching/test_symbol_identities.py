"""Synthetic module-aware identity and evidence reconciliation contracts."""
import copy
import hashlib
import importlib.util
import json
import tempfile
import struct
import subprocess
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/symbol_identities.py'
ROM = 'a' * 64


def module():
    spec = importlib.util.spec_from_file_location('symbol_identities', SCRIPT)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def object_fixture():
    strings=b'\0$a\0func_ov000_0214cd20\0'
    symbols=bytes(16)+struct.pack('<IIIBBH',1,0,0,0,0,1)+struct.pack('<IIIBBH',4,0,16,0x12,0,1)
    names=b'\0.text\0.symtab\0.strtab\0.shstrtab\0'
    specs=[(0,0,0,b'',0,0,0),(1,1,6,bytes(16),0,0,0),(7,2,0,symbols,3,2,16),(15,3,0,strings,0,0,0),(23,3,0,names,0,0,0)]
    data=bytearray(52);headers=[]
    for name,kind,flags,content,link,info,entry in specs:
        data+=bytes(-len(data)%4)
        headers.append((name,kind,flags,0,len(data),len(content),link,info,4,entry));data+=content
    offset=len(data)
    for header in headers:data+=struct.pack('<10I',*header)
    struct.pack_into('<16sHHIIIIIHHHHHH',data,0,b'\x7fELF\x01\x01\x01'+bytes(9),1,40,1,0,0,offset,0,52,0,0,40,5,4)
    return bytes(data)


class SymbolIdentityTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(SCRIPT.exists(), 'symbol identity importer missing')
        self.api = module()
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        for name in ('ov000', 'ov001'):
            path = self.root / 'arm9/overlays' / name
            path.mkdir(parents=True)
            (path / 'delinks.txt').write_text('    .text start:0x0214cd20 end:0x0214ce00 kind:code align:4\n    .bss start:0x0214ce00 end:0x0214ce20 kind:bss align:4\n\nsrc/probe.c:\n    complete\n    .text start:0x0214cd20 end:0x0214cd30\n')
            (path / 'symbols.txt').write_text(f'func_{name}_0214cd20 kind:function(arm,size=0x10) addr:0x0214cd20\ndata_{name}_0214ce00 kind:bss addr:0x0214ce00\n')
        self.inventory = self.api.load_identities(self.root, ROM)

    def claim(self, module='ov000', alias='DeckProbe'):
        symbol = next(x for x in self.inventory['symbols'] if x['identity']['module'] == module and x['kind'] == 'function')
        return {'identity': copy.deepcopy(symbol['identity']), 'dsd_name': symbol['dsd_name'], 'kind': 'function', 'size': 16,
                'alias': alias, 'role': 'primary_name', 'confidence': 'confirmed_static', 'reviewed': True,
                'provenance': [{'repository': 'jus_re', 'commit': 'b'*40, 'bead': 'jus-public', 'bead_status': 'closed',
                                'path': 'docs/public.md', 'sha256': 'c'*64, 'summary': 'Synthetic reviewed evidence'}]}

    def reconcile(self, claims, **kwargs):
        if kwargs.get('source_build'):
            for unit in kwargs['source_build']['units']:
                for key in ('reference','compiled'):
                    path=self.root/(key+'.o');path.write_bytes(object_fixture())
                    unit[key]={'path':str(path),'sha256':hashlib.sha256(path.read_bytes()).hexdigest()}
        return self.api.reconcile_aliases(self.inventory, {'schema_version': 1, 'rom_sha256': ROM, 'claims': claims}, **kwargs)

    def test_overlays_with_same_address_remain_distinct(self):
        result = self.reconcile([self.claim('ov000'), self.claim('ov001', 'OtherDeckProbe')])
        self.assertEqual(result['status'], 'passed')
        self.assertEqual(result['counts']['accepted'], 2)
        records = result['records']
        self.assertNotEqual(records[0]['identity'], records[1]['identity'])
        self.assertEqual(records[0]['identity']['address'], records[1]['identity']['address'])
        self.assertEqual(self.inventory['scope']['global_coverage_percent'], None)

    def test_conflicting_names_retain_both_claims(self):
        first, second = self.claim(), self.claim(alias='ContradictoryName')
        result = self.reconcile([first, second])
        self.assertEqual(result['status'], 'unresolved')
        self.assertEqual(result['counts']['accepted'], 0)
        self.assertEqual(result['records'][0]['claims'], [first, second])
        self.assertIn('conflict', result['records'][0]['reason'])

    def test_dsd_name_is_never_replaced(self):
        result = self.reconcile([self.claim()])
        self.assertEqual(result['records'][0]['dsd_names'], ['func_ov000_0214cd20'])
        self.assertEqual(result['records'][0]['accepted_aliases'], ['DeckProbe'])
        self.assertEqual(result['provenance_verification'], 'metadata_only')

    def test_wrong_scope_mode_extent_and_rom_cannot_match(self):
        for field, value in [('module','main'), ('mode','thumb'), ('section','.data'), ('rom_sha256','d'*64)]:
            claim = self.claim(); claim['identity'][field] = value
            self.assertEqual(self.reconcile([claim])['status'], 'unresolved')
        claim = self.claim(); claim['size'] = 20
        self.assertEqual(self.reconcile([claim])['status'], 'unresolved')

    def test_unreviewed_or_missing_provenance_stays_unresolved(self):
        for field,value in [('reviewed',False), ('provenance',[]), ('confidence','speculative')]:
            claim=self.claim();claim[field]=value
            result=self.reconcile([claim])
            self.assertEqual(result['status'],'unresolved')
            self.assertEqual(result['records'][0]['claims'],[claim])

    def test_conflicting_type_claims_do_not_create_struct(self):
        first=self.claim();second=self.claim()
        first.update(role='type',alias='opaque_deck_pointer')
        second.update(role='type',alias='other_pointer')
        result=self.reconcile([first,second])
        self.assertEqual(result['status'],'unresolved')
        self.assertNotIn('struct',result['records'][0])

    def test_data_identity_has_no_inferred_size_or_mode(self):
        symbol=next(x for x in self.inventory['symbols'] if x['kind']=='bss')
        self.assertIsNone(symbol['size'])
        self.assertEqual(symbol['identity']['mode'],'data')

    def test_source_function_extent_and_type_reconciled_from_tu_ranges(self):
        unit={'module':'ov000','object':'src/probe.o','functions':['func_ov000_0214cd20'], 'status':'passed',
              'checks':{'functions':[{'name':'func_ov000_0214cd20','offset':0,'size':16,'mode':'arm','section':'.text'}]}}
        source={'status':'passed','units':[unit]}
        self.assertEqual(self.reconcile([self.claim()],source_build=source)['source_symbols']['status'],'passed')
        source=copy.deepcopy(source);source['units'][0]['checks']['functions'][0]['size']=12
        result=self.reconcile([self.claim()],source_build=source)
        self.assertEqual(result['status'],'unresolved')
        self.assertEqual(result['source_symbols']['status'],'unresolved')

    def test_local_evidence_hash_and_closed_bead_are_checked(self):
        root=self.root/'evidence';(root/'docs').mkdir(parents=True);(root/'.beads').mkdir()
        (root/'docs/public.md').write_text('public reviewed evidence')
        (root/'.beads/issues.jsonl').write_text(json.dumps({'id':'jus-public','status':'closed'})+'\n')
        claim=self.claim();claim['provenance'][0]['sha256']=hashlib.sha256((root/'docs/public.md').read_bytes()).hexdigest()
        subprocess.run(['git','init','-q',str(root)],check=True)
        subprocess.run(['git','-C',str(root),'add','.'],check=True)
        subprocess.run(['git','-C',str(root),'-c','user.name=Fixture','-c','user.email=fixture@example.invalid',
                        'commit','-qm','Public fixture'],check=True)
        commit=subprocess.check_output(['git','-C',str(root),'rev-parse','HEAD'],text=True).strip()
        claim['provenance'][0]['commit']=commit
        self.assertEqual(self.reconcile([claim],provenance_root=root)['status'],'passed')
        claim['provenance'][0]['commit']='0'*40
        result=self.reconcile([claim],provenance_root=root)
        self.assertEqual(result['status'],'unresolved')
        self.assertIn('commit',result['records'][0]['reason'])
        claim['provenance'][0]['commit']=commit
        (root/'docs/public.md').write_text('changed evidence')
        self.assertEqual(self.reconcile([claim],provenance_root=root)['status'],'unresolved')
        claim['provenance'][0]['sha256']=hashlib.sha256((root/'docs/public.md').read_bytes()).hexdigest()
        result=self.reconcile([claim],provenance_root=root)
        self.assertEqual(result['status'],'unresolved')
        self.assertIn('pinned',result['records'][0]['reason'])
        claim['provenance'][0]['sha256']=hashlib.sha256(b'public reviewed evidence').hexdigest()
        (root/'docs/public.md').write_text('public reviewed evidence')
        (root/'.beads/issues.jsonl').write_text(json.dumps({'id':'jus-public','status':'open'})+'\n')
        self.assertEqual(self.reconcile([claim],provenance_root=root)['status'],'unresolved')

    def test_missing_source_build_function_type_is_unresolved(self):
        unit={'module':'ov000','object':'src/probe.o','functions':['func_ov000_0214cd20'],'status':'passed',
              'checks':{'functions':[{'name':'func_ov000_0214cd20','offset':0,'size':16,'mode':'thumb','section':'.text'}]}}
        self.assertEqual(self.reconcile([self.claim()],source_build={'status':'passed','units':[unit]})['status'],'unresolved')

    def test_live_closed_bead_cannot_replace_unclosed_pinned_provenance(self):
        root=self.root/'pinned';(root/'docs').mkdir(parents=True);(root/'.beads').mkdir()
        (root/'docs/public.md').write_text('public reviewed evidence')
        ledger=root/'.beads/issues.jsonl'
        ledger.write_text(json.dumps({'id':'jus-public','status':'open'})+'\n')
        subprocess.run(['git','init','-q',str(root)],check=True)
        subprocess.run(['git','-C',str(root),'add','.'],check=True)
        subprocess.run(['git','-C',str(root),'-c','user.name=Fixture','-c','user.email=fixture@example.invalid',
                        'commit','-qm','Unclosed public fixture'],check=True)
        claim=self.claim();claim['provenance'][0]['commit']=subprocess.check_output(
            ['git','-C',str(root),'rev-parse','HEAD'],text=True).strip()
        claim['provenance'][0]['sha256']=hashlib.sha256((root/'docs/public.md').read_bytes()).hexdigest()
        ledger.write_text(json.dumps({'id':'jus-public','status':'closed'})+'\n')
        result=self.reconcile([claim],provenance_root=root)
        self.assertEqual(result['status'],'unresolved')
        self.assertIn('pinned provenance bead',result['records'][0]['reason'])

    def test_source_function_cannot_exceed_declared_tu_extent(self):
        self.inventory['translation_units'][0]['sections'][0]['end']=0x0214cd28
        unit={'module':'ov000','object':'src/probe.o','functions':['func_ov000_0214cd20'],'status':'passed',
              'checks':{'functions':[{'name':'func_ov000_0214cd20','offset':0,'size':16,'mode':'arm','section':'.text'}]}}
        self.assertEqual(self.reconcile([self.claim()],source_build={'status':'passed','units':[unit]})['status'],'unresolved')

    def test_source_objects_must_match_hash_and_gate_report(self):
        claim=self.claim()
        path=self.root/'compiled.o';path.write_bytes(object_fixture())
        unit={'module':'ov000','object':'src/probe.o','functions':['func_ov000_0214cd20'],'status':'passed',
              'reference':{'path':str(path),'sha256':'f'*64},'compiled':{'path':str(path),'sha256':'f'*64},
              'checks':{'functions':[{'name':'func_ov000_0214cd20','offset':0,'size':16,'mode':'arm','section':'.text'}]}}
        result=self.api.reconcile_aliases(self.inventory,{'schema_version':1,'rom_sha256':ROM,'claims':[claim]},source_build={'status':'passed','units':[unit]})
        self.assertEqual(result['status'],'unresolved')

    def test_malformed_claim_is_retained_unresolved(self):
        result=self.reconcile(['invalid claim'])
        self.assertEqual(result['status'],'unresolved')
        self.assertEqual(result['records'][0]['claims'],['invalid claim'])

    def test_declared_empty_stub_module_is_still_in_scope(self):
        path=self.root/'arm9/overlays/ov009';path.mkdir()
        (path/'symbols.txt').write_text('')
        (path/'delinks.txt').write_text('    .data start:0x0214cd20 end:0x0214cd40 kind:data align:4\n')
        inventory=self.api.load_identities(self.root,ROM)
        self.assertIn('ov009',inventory['scope']['modules'])

    def test_real_reviewed_deck_claims_match_authoritative_metadata(self):
        inventory=self.api.load_identities(ROOT/'decomp', 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
        manifest=json.loads((ROOT/'decomp/symbol-aliases.json').read_text())
        result=self.api.reconcile_aliases(inventory,manifest)
        self.assertEqual(result['status'],'passed')
        self.assertGreaterEqual(result['counts']['accepted'],3)
        self.assertIn('ComicDeckCreate',[a for r in result['records'] for a in r['accepted_aliases']])


if __name__ == '__main__': unittest.main()
