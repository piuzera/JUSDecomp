"""Public invented instruction records exercise donor rejection boundaries."""
import importlib.util
import unittest
import tempfile
import struct
import shutil
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[2] / 'tools/scripts/donor_matcher.py'

def tool():
    spec = importlib.util.spec_from_file_location('donor_matcher', SCRIPT)
    value = importlib.util.module_from_spec(spec); spec.loader.exec_module(value)
    return value

def record(name='f', **changes):
    value = {'identity': {'cpu': 'arm9', 'module': 'main', 'section': '.text',
                          'address': 0x02001000, 'mode': 'arm', 'symbol': name},
             'mode': 'arm', 'bytes': bytes(range(24)), 'code_ranges': [(0, 24)],
             'data_ranges': [], 'relocations': [], 'structure': ['mov', 'cmp', 'bne', 'ldr', 'add', 'bx'],
             'issues': []}
    value.update(changes); return value

def multi_section_fixture():
    names=b'\0.text\0.symtab\0.strtab\0.rela.text\0.shstrtab\0'
    strings=b'\0first\0second\0$a\0'
    symbols=b''.join(struct.pack('<IIIBBH',*row) for row in (
        (0,0,0,0,0,0),(14,0,0,0,0,1),(14,0,0,0,0,2),
        (1,0,4,0x12,0,1),(7,0,4,0x12,0,2)))
    contents=[b'',struct.pack('<I',0xEB000000),struct.pack('<I',0xEB000000),symbols,strings,
              struct.pack('<IIi',0,(4<<8)|1,-8),struct.pack('<IIi',0,(3<<8)|1,-8),names]
    fields=[(0,0,0,0,0,0),(1,1,6,0,0,0),(1,1,6,0,0,0),(7,2,0,4,3,16),
            (15,3,0,0,0,1),(23,4,0,3,1,12),(23,4,0,3,2,12),(34,3,0,0,0,1)]
    data=bytearray(52);headers=[]
    for content,(name,kind,flags,link,info,entry) in zip(contents,fields):
        data+=bytes((-len(data))%4);headers.append((name,kind,flags,0,len(data),len(content),link,info,4,entry));data+=content
    offset=len(data)
    for row in headers:data+=struct.pack('<10I',*row)
    struct.pack_into('<16sHHIIIIIHHHHHH',data,0,b'\x7fELF\x01\x01\x01'+bytes(9),1,40,1,0,0,offset,0,52,0,0,40,len(headers),7)
    return bytes(data)

class DonorMatcherTests(unittest.TestCase):
    def module(self):
        self.assertTrue(SCRIPT.exists(), 'donor matcher missing'); return tool()

    def test_tiny_stub_collision_stays_unresolved_and_counted(self):
        m = self.module(); tiny = record(bytes=bytes(4), code_ranges=[(0,4)], structure=['bx'])
        result = m.compare_functions(tiny, tiny, {})
        self.assertEqual(result['status'], 'unresolved'); self.assertIn('tiny', result['reasons'])
        search = m.search_functions([tiny], [tiny, dict(tiny, identity=dict(tiny['identity'], module='ov000'))], {})
        self.assertEqual(search['counts']['unresolved'], 2)
        self.assertEqual(len(search['candidates']), 2)

    def test_changed_relocation_destination_is_not_hidden_by_mask(self):
        m = self.module(); a={'offset':4,'type':2,'addend':0,'symbol':'callee','destination':{'cpu':'arm9','module':'ov000','address':0x02100000,'mode':'arm'}}
        b=dict(a,destination=dict(a['destination'],module='ov001'))
        left=record(relocations=[a]);right=record(relocations=[b])
        result=m.compare_functions(left,right,{'callee':a['destination']})
        self.assertEqual(result['status'],'rejected');self.assertIn('relocation destination',result['reasons'])

    def test_arm_and_thumb_payload_collision_is_rejected(self):
        result=self.module().compare_functions(record(),record(mode='thumb'),{})
        self.assertEqual(result['status'],'rejected');self.assertIn('instruction mode',result['reasons'])

    def test_literal_pool_change_is_rejected_even_with_same_structure(self):
        m=self.module();left=record(code_ranges=[(0,20)],data_ranges=[(20,24)])
        right=dict(left,bytes=left['bytes'][:20]+b'XXXX')
        result=m.compare_functions(left,right,{})
        self.assertEqual(result['status'],'rejected');self.assertIn('literal pool',result['reasons'])

    def test_data_marked_function_never_matches_code(self):
        result=self.module().compare_functions(record(),record(code_ranges=[],data_ranges=[(0,24)]),{})
        self.assertEqual(result['status'],'rejected');self.assertIn('data is not instructions',result['reasons'])

    def test_structural_only_similarity_stays_uncertain(self):
        m=self.module();result=m.compare_functions(record(),record(bytes=b'X'*24),{})
        self.assertEqual(result['status'],'unresolved');self.assertEqual(result['stage'],'structural')

    def test_explicit_target_binding_allows_relocated_pointer_candidate(self):
        m=self.module();destination={'cpu':'arm9','module':'main','address':0x02003000,'mode':'arm'}
        reloc={'offset':4,'type':2,'addend':0,'symbol':'callee','destination':None}
        left=record(relocations=[reloc]);data=bytearray(left['bytes']);data[4:8]=b'ZZZZ'
        right=record(bytes=bytes(data),relocations=[dict(reloc,destination=destination)])
        result=m.compare_functions(left,right,{'callee':destination})
        self.assertEqual(result['status'],'candidate');self.assertEqual(result['stage'],'relocation_bound')

    def test_raw_bytes_without_external_binding_remain_unresolved(self):
        m=self.module();reloc={'offset':4,'type':2,'addend':0,'symbol':'unknown','destination':None}
        result=m.compare_functions(record(relocations=[reloc]),record(relocations=[reloc]),{})
        self.assertEqual(result['status'],'unresolved');self.assertIn('unbound destination',result['reasons'])

    def test_addend_change_cannot_become_bound_by_equal_bytes(self):
        m=self.module();destination={'cpu':'arm9','module':'main','address':0x02003000,'mode':'data'}
        reloc={'offset':4,'type':2,'addend':4,'symbol':'table','destination':destination}
        result=m.compare_functions(record(relocations=[reloc]),
                                   record(relocations=[dict(reloc,addend=8)]),{'table':destination})
        self.assertEqual(result['status'],'unresolved');self.assertIn('unbound destination',result['reasons'])

    def test_normalization_preserves_arm_and_thumb_interworking(self):
        m=self.module()
        for kind,left_word,right_word,mode in ((1,struct.pack('<I',0xEB000000),struct.pack('<I',0xFA000000),'arm'),
                                             (10,struct.pack('<HH',0xF000,0xF800),struct.pack('<HH',0xF000,0xE800),'thumb')):
            with self.subTest(kind=kind):
                destination={'cpu':'arm9','module':'main','address':0x02003000,'mode':'thumb'}
                reloc={'offset':0,'type':kind,'addend':-8 if kind==1 else -4,'symbol':'callee','destination':destination}
                left=record(mode=mode,bytes=left_word+bytes(20),relocations=[reloc])
                right=record(mode=mode,bytes=right_word+bytes(20),relocations=[reloc])
                self.assertNotEqual(m.normalized_bytes(left),m.normalized_bytes(right))
                self.assertNotEqual(m.compare_functions(left,right,{'callee':destination})['status'],'candidate')

    def test_invalid_thumb_blx_alignment_never_becomes_candidate(self):
        m=self.module()
        destination={'cpu':'arm9','module':'main','address':0x02003000,'mode':'arm'}
        reloc={'offset':0,'type':10,'addend':-4,'symbol':'callee','destination':destination}
        valid=record(mode='thumb',bytes=struct.pack('<HH',0xF000,0xE800)+bytes(20),relocations=[reloc])
        invalid=dict(valid,bytes=struct.pack('<HH',0xF000,0xE801)+bytes(20))
        with self.assertRaisesRegex(ValueError,'BLX alignment'):
            m.normalized_bytes(invalid)
        for left,right in ((invalid,valid),(valid,invalid),(invalid,invalid)):
            self.assertNotEqual(m.compare_functions(left,right,{'callee':destination})['status'],'candidate')

    def test_unlicensed_donor_cannot_enter_corpus(self):
        m=self.module();self.assertTrue(hasattr(m,'license_allowed'),'license exclusion missing')
        self.assertFalse(m.license_allowed({}))
        self.assertFalse(m.license_allowed({'spdx':'MIT','import_allowed':True}))
        self.assertFalse(m.license_allowed({'spdx':'unknown','import_allowed':True,'sha256':'0'*64,'review':'unchecked'}))
        self.assertTrue(m.license_allowed({'spdx':'MIT','import_allowed':True,'sha256':'0'*64,'review':'reviewed file permission'}))

    def test_changed_pinned_source_or_header_rejects_before_compilation(self):
        m=self.module();self.assertTrue(hasattr(m,'verified_file'),'input pin validation missing')
        with tempfile.TemporaryDirectory() as tmp:
            path=Path(tmp)/'context.h';path.write_text('typedef unsigned int size_t;\n')
            expected=m.digest(path);self.assertEqual(m.verified_file(path,expected),path)
            path.write_text('typedef unsigned short size_t;\n')
            with self.assertRaisesRegex(ValueError,'pin mismatch'):m.verified_file(path,expected)

    def test_unbound_normalized_collision_is_not_a_bound_match(self):
        m=self.module();reloc={'offset':4,'type':2,'addend':0,'symbol':'unknown','destination':None}
        left=record(relocations=[reloc]);data=bytearray(left['bytes']);data[4:8]=b'ZZZZ'
        result=m.compare_functions(left,record(bytes=bytes(data),relocations=[reloc]),{})
        self.assertEqual(result['status'],'unresolved');self.assertEqual(result['stage'],'unbound_collision')

    def test_duplicate_text_sections_keep_distinct_relocation_sh_info(self):
        m=self.module();objdump=shutil.which('llvm-objdump') or '/opt/homebrew/opt/llvm/bin/llvm-objdump'
        if not Path(objdump).is_file():self.skipTest('LLVM object reader unavailable')
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);source=root/'donor.o';source.write_bytes(multi_section_fixture())
            error=''
            try: records,_=m.extract_donors(source,{'family':'fixture'},objdump,root/'disassembly.txt')
            except ValueError as caught: records=[];error=str(caught)
            self.assertEqual(len(records),2,error)
            self.assertEqual([r['relocations'][0]['symbol'] for r in records],['second','first'])
            self.assertEqual([r['structure'] for r in records],[['bl'],['bl']])

if __name__ == '__main__': unittest.main()
