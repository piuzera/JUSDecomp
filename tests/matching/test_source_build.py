"""Public synthetic ELF checks for source-object acceptance."""
import importlib.util
import os
import struct
import subprocess
import tempfile
import unittest
from unittest.mock import patch
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/source_build.py'


def module():
    spec = importlib.util.spec_from_file_location('source_build', SCRIPT)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def fixture(target='public_pointer', addend=0, kind=2, mode='a', size=24,
            common=False, extra=False, bss=False, pointer_word=0):
    strings = bytearray(b'\0')
    def name(value):
        offset = len(strings)
        strings.extend(value.encode() + b'\0')
        return offset
    symbols = [(0,0,0,0,0,0), (name('$' + mode),0,0,0,0,1),
               (name('$d'),20,0,0,0,1), (name('public_func'),0,size,0x12,0,1),
               (name(target),0,4 if common else 0,0x11 if common else 0x10,0,0xFFF2 if common else 0)]
    contents = [b'', bytes(range(20)) + struct.pack('<I', pointer_word),
                struct.pack('<IIi',20,(4<<8)|kind,addend),
                b''.join(struct.pack('<IIIBBH',*s) for s in symbols), bytes(strings), b'']
    specs = [('',0,0,0,0,0),('.text',1,6,0,0,4),('.rela.text',4,0,3,1,12),
             ('.symtab',2,0,4,3,16),('.strtab',3,0,0,0,1),('.shstrtab',3,0,0,0,1)]
    if extra:
        specs.append(('.unexpected',1,2,0,0,1)); contents.append(b'extra')
    if bss:
        specs.append(('.bss',8,3,0,0,1)); contents.append(b'')
    names = bytearray(b'\0'); offsets=[]
    for spec in specs:
        offsets.append(len(names));names.extend(spec[0].encode()+b'\0')
    contents[5]=bytes(names)
    data=bytearray(52);headers=[]
    for offset,content,spec in zip(offsets,contents,specs):
        data += bytes((-len(data)) % 4)
        _,typ,flags,link,info,entry=spec
        headers.append((offset,typ,flags,0,len(data),4 if typ==8 else len(content),link,info,4,entry))
        data += content
    shoff=len(data)
    for header in headers:data += struct.pack('<10I',*header)
    struct.pack_into('<16sHHIIIIIHHHHHH',data,0,b'\x7fELF\x01\x01\x01'+bytes(9),1,40,1,0,0,shoff,0,52,0,0,40,len(headers),5)
    return bytes(data)


class SourceBuildTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(SCRIPT.exists(), 'source compiler/object gate missing')
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.reference = self.root / 'reference.o'
        self.compiled = self.root / 'compiled.o'
        self.reference.write_bytes(fixture())
        self.compiled.write_bytes(fixture())

    def compare(self):
        return module().compare_objects(self.reference,self.compiled,['public_func'])

    def test_matching_sections_functions_and_relocations_pass(self):
        result=self.compare()
        self.assertEqual(result['status'],'passed')
        self.assertEqual(result['functions'][0]['size'],24)
        self.assertEqual(result['functions'][0]['mode'],'arm')
        self.assertEqual(result['relocations'][0]['symbol'],'public_pointer')

    def test_changed_call_destination_fails_before_relocation_masking(self):
        tool=module();original=tool.sha256(self.reference)
        self.compiled.write_bytes(fixture(target='different_pointer'))
        self.assertNotEqual(tool.sha256(self.compiled),original)
        with self.assertRaisesRegex(ValueError,'relocation'):
            self.compare()
        self.assertEqual(tool.sha256(self.reference),original)

    def test_changed_addend_and_unsupported_type_do_not_pass(self):
        self.compiled.write_bytes(fixture(addend=4))
        with self.assertRaisesRegex(ValueError,'relocation'):
            self.compare()
        self.compiled.write_bytes(fixture(kind=99))
        with self.assertRaisesRegex(ValueError,'unsupported'):
            self.compare()

    def test_supported_relocation_field_bytes_are_masked_after_identity_check(self):
        self.compiled.write_bytes(fixture(pointer_word=0x12345678))
        self.assertEqual(self.compare()['status'],'passed')

    def test_common_bss_and_extra_allocated_sections_are_rejected(self):
        for option in ('common','bss','extra'):
            with self.subTest(option=option):
                self.compiled.write_bytes(fixture(**{option:True}))
                with self.assertRaises(ValueError):self.compare()

    def test_function_size_and_mode_are_checked(self):
        for options in ({'size':20},{'mode':'t'}):
            self.compiled.write_bytes(fixture(**options))
            with self.assertRaisesRegex(ValueError,'function'):
                self.compare()

    def test_relocated_bytes_cannot_hide_nonrelocated_instruction_change(self):
        changed=bytearray(fixture()); changed[52]^=1
        self.compiled.write_bytes(changed)
        with self.assertRaisesRegex(ValueError,'bytes'):
            self.compare()

    def test_invalid_source_reports_zero_accepted_objects(self):
        unit={'module':'ov000','object':'src/ov000/public.o','source':'missing.c',
              'functions':['public_func'],'category':'game','cpu':'arm946e','flags':[],
              'include_paths':[]}
        result=module().build_sources({'schema_version':1,'translation_units':[unit]},self.root,
            self.root/'out',self.root/'refs',Path('/missing/compiler'),Path('/missing/runner'))
        self.assertEqual(result['status'],'failed')
        self.assertEqual(result['accepted_units'],0)
        self.assertEqual(result['objects'],{})

    def test_duplicate_lcf_basenames_are_rejected(self):
        units=[{'object':path} for path in ('one/public.o','two/public.o')]
        result=module().build_sources({'schema_version':1,'translation_units':units},self.root,
            self.root/'out',self.root/'refs',Path('/missing/compiler'),Path('/missing/runner'))
        self.assertEqual(result['status'],'failed')
        self.assertIn('duplicate object basenames',result['failure'])
        self.assertEqual(result['objects'],{})

    def test_unsupported_branch_encoding_is_unresolved_before_masking(self):
        self.reference.write_bytes(fixture(kind=1))
        self.compiled.write_bytes(fixture(kind=1))
        with self.assertRaisesRegex(ValueError,'unsupported'):
            self.compare()

    def test_include_mutation_during_compilation_earns_zero_acceptance(self):
        tool=module();source=self.root/'public.c';source.write_text('public synthetic source')
        include=self.root/'include';include.mkdir();header=include/'public.h';header.write_text('before')
        refs=self.root/'refs';refs.mkdir();(refs/'public.o').write_bytes(fixture())
        compiler=self.root/'compiler';compiler.write_bytes(b'public compiler fixture')
        runner=self.root/'runner';runner.write_bytes(b'public runner fixture')
        unit={'module':'ov000','object':'public.o','source':'public.c','functions':['public_func'],
              'category':'game','cpu':'arm946e','flags':[],'include_paths':['include']}
        def compile_fixture(command,**kwargs):
            Path(command[command.index('-o')+1]).write_bytes(fixture())
            header.write_text('changed during compilation')
            return subprocess.CompletedProcess(command,0,'','')
        with patch.object(tool.subprocess,'run',side_effect=compile_fixture):
            result=tool.build_sources({'schema_version':1,'translation_units':[unit]},self.root,
                                      self.root/'out',refs,compiler,runner)
        self.assertEqual(result['status'],'failed')
        self.assertIn('changed during build',result['failure'])
        self.assertEqual(result['accepted_units'],0)
        self.assertEqual(result['objects'],{})

    def test_optional_real_compiler_mutation_preserves_reference(self):
        compiler=os.environ.get('JUS_MW_COMPILER')
        runner=os.environ.get('JUS_MW_RUNNER')
        if not compiler or not runner:self.skipTest('set JUS_MW_COMPILER and JUS_MW_RUNNER for private tool integration')
        compiler,runner=Path(compiler),Path(runner)
        source=self.root/'public.c'
        source.write_text('extern void (*public_pointer)(void);\nvoid public_func(void) { public_pointer(); }\n')
        references=self.root/'references';references.mkdir()
        reference=references/'public.o'
        baseline=subprocess.run([str(runner),str(compiler),'-c','-proc','arm946e','-Cpp_exceptions','off',
                                 '-o',str(reference),str(source)],capture_output=True,text=True)
        self.assertEqual(baseline.returncode,0,baseline.stderr)
        unit={'module':'ov000','object':'public.o','source':'public.c','functions':['public_func'],
              'category':'game','cpu':'arm946e','flags':['-Cpp_exceptions','off'],'include_paths':[]}
        manifest={'schema_version':1,'translation_units':[unit]};tool=module()
        good=tool.build_sources(manifest,self.root,self.root/'good',references,compiler,runner)
        self.assertEqual(good['status'],'passed',good.get('failure'))
        source.write_text(source.read_text().replace('public_pointer','different_pointer'))
        bad=tool.build_sources(manifest,self.root,self.root/'bad',references,compiler,runner)
        self.assertEqual(bad['status'],'failed')
        self.assertEqual(bad['accepted_units'],0)
        self.assertEqual(bad['objects'],{})
        self.assertEqual(good['units'][0]['reference']['sha256'],bad['units'][0]['reference']['sha256'])
        self.assertNotEqual(good['units'][0]['compiled']['sha256'],bad['units'][0]['compiled']['sha256'])


if __name__=='__main__':unittest.main()
