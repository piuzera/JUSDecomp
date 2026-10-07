"""Runtime pilot gates use invented public ELF fields, never ROM instructions."""
import importlib.util
import hashlib
import json
import os
from pathlib import Path
import shutil
import struct
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'decomp/src/runtime/find_exception_table.c'
sys.path.insert(0, str(ROOT/'tools/scripts'))
from source_build import compare_objects


def fixture(end='__exception_table_end__', constant=0):
    strings=bytearray(b'\0')
    def name(value):
        offset=len(strings);strings.extend(value.encode()+b'\0');return offset
    symbols=[(0,0,0,0,0,0),(name('$a'),0,0,0,0,1),(name('$d'),24,0,0,0,1),
             (name('__FindExceptionTable'),0,32,0x12,0,1),
             (name('__exception_table_start__'),0,0,0x10,0,0),(name(end),0,0,0x10,0,0)]
    contents=[b'',bytes(range(24))+struct.pack('<2I',constant,constant),
              struct.pack('<IIi',24,(4<<8)|2,0)+struct.pack('<IIi',28,(5<<8)|2,0),
              b''.join(struct.pack('<IIIBBH',*s) for s in symbols),bytes(strings),b'']
    specs=[('',0,0,0,0,0),('.text',1,6,0,0,4),('.rela.text',4,0,3,1,12),
           ('.symtab',2,0,4,3,16),('.strtab',3,0,0,0,1),('.shstrtab',3,0,0,0,1)]
    names=bytearray(b'\0');offsets=[]
    for spec in specs:offsets.append(len(names));names.extend(spec[0].encode()+b'\0')
    contents[5]=bytes(names);data=bytearray(52);headers=[]
    for offset,content,spec in zip(offsets,contents,specs):
        data+=bytes((-len(data))%4);_,kind,flags,link,info,entry=spec
        headers.append((offset,kind,flags,0,len(data),len(content),link,info,4,entry));data+=content
    shoff=len(data)
    for header in headers:data+=struct.pack('<10I',*header)
    struct.pack_into('<16sHHIIIIIHHHHHH',data,0,b'\x7fELF\x01\x01\x01'+bytes(9),1,40,1,0,0,shoff,0,52,0,0,40,len(headers),5)
    return bytes(data)


class ExceptionTableTests(unittest.TestCase):
    def test_equal_pool_words_cannot_hide_changed_end_identity(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);a=root/'reference.o';b=root/'source.o'
            a.write_bytes(fixture(constant=0x12340000));b.write_bytes(fixture(end='different_end',constant=0x12340000))
            with self.assertRaisesRegex(ValueError,'relocation'):
                compare_objects(a,b,['__FindExceptionTable'])
            b.write_bytes(fixture(constant=0))
            self.assertEqual(compare_objects(a,b,['__FindExceptionTable'])['status'],'passed')
            # A changed nonrelocated return constant must not be masked by the two pools.
            changed=bytearray(fixture());changed[52+16]^=1;b.write_bytes(changed)
            with self.assertRaisesRegex(ValueError,'bytes'):
                compare_objects(a,b,['__FindExceptionTable'])

    def test_runtime_source_enforces_arm32_abi_before_compiling(self):
        self.assertTrue(SOURCE.exists(),'ordinary C runtime source missing')
        clang=shutil.which('clang')
        if not clang:self.skipTest('native compiler unavailable')
        with tempfile.TemporaryDirectory() as tmp:
            output=Path(tmp)/'wrong-abi.o'
            result=subprocess.run([clang,'-c',str(SOURCE),'-o',str(output)],capture_output=True,text=True)
            self.assertNotEqual(result.returncode,0,'host pointer width silently changes runtime layout')
            self.assertIn('runtime_pointer_width',result.stderr)
            result=subprocess.run([clang,'--target=arm-none-eabi','-mcpu=arm946e-s','-marm','-ffreestanding',
                                   '-c',str(SOURCE),'-o',str(Path(tmp)/'arm32.o')],capture_output=True,text=True)
            self.assertEqual(result.returncode,0,result.stderr)

    @unittest.skipUnless(all(os.environ.get(name) for name in ('JUS_RUNTIME_COMPILER','JUS_RUNTIME_RUNNER','JUS_RUNTIME_REFERENCE')),
                         'set pinned runtime compiler, runner and original private TU reference')
    def test_real_source_mutations_fail_without_changing_reference(self):
        compiler=Path(os.environ['JUS_RUNTIME_COMPILER']);runner=Path(os.environ['JUS_RUNTIME_RUNNER'])
        reference=Path(os.environ['JUS_RUNTIME_REFERENCE'])
        sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
        lock=json.loads((ROOT/'decomp/toolchain.lock.json').read_text())
        self.assertEqual(sha(compiler),lock['source_compiler']['sha256'])
        self.assertEqual(sha(runner),lock['source_compiler_runner']['sha256'])
        original=sha(reference)
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp)
            variants=[('original',SOURCE.read_text(),None),
                      ('wrong_return',SOURCE.read_text().replace('return 1;','return 2;'),'bytes'),
                      ('wrong_end',SOURCE.read_text().replace('__exception_table_end__','different_exception_end'),'relocation')]
            for name,text,failure in variants:
                with self.subTest(variant=name):
                    source=root/(name+'.c');source.write_text(text);output=root/(name+'.o')
                    result=subprocess.run([str(runner),str(compiler),'-c','-proc','arm946e','-Cpp_exceptions','off',
                                           '-nostdinc','-interworking','-O2,p','-o',str(output),str(source)],capture_output=True,text=True)
                    self.assertEqual(result.returncode,0,result.stdout+result.stderr)
                    if failure:
                        with self.assertRaisesRegex(ValueError,failure):compare_objects(reference,output,['__FindExceptionTable'])
                    else:self.assertEqual(compare_objects(reference,output,['__FindExceptionTable'])['status'],'passed')
            self.assertEqual(sha(reference),original)

if __name__ == '__main__':unittest.main()
