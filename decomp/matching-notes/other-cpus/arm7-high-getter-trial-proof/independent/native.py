"""Independent direct high-getter MW-object link against both original images."""
import hashlib
import json
import shutil
import struct
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = Path('/private/tmp/jus-arm7-high-getter-independent')
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
BASE = Path('/private/tmp/jus-arm7-reachable-root-proof/native-actual')
REPORT = REPO / 'decomp/matching-notes/other-cpus/arm7-reachable-proof/native-actual-report.json'
PINS = REPO / 'decomp/matching-notes/other-cpus/arm7-physical-baseline/native-pins.json'
LAYOUT = REPO / 'decomp/matching-notes/other-cpus/arm7-checked-layouts.json'
CLANG = Path('/opt/homebrew/opt/llvm/bin/clang')
LLD = Path('/opt/homebrew/bin/ld.lld')
OUT = HERE / 'native-01'
ORIGINAL_SHA = '0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
MW_SHA = 'b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1'
sha = lambda data: hashlib.sha256(data).hexdigest()

def pinned(path, digest):
    data = path.read_bytes()
    assert sha(data) == digest, path
    return data

def run(argv, directory, name):
    result = subprocess.run([str(x) for x in argv], cwd=directory, capture_output=True, text=True)
    (directory/name).write_text(json.dumps({'argv':[str(x) for x in argv], 'returncode':result.returncode},indent=2)+'\nSTDOUT\n'+result.stdout+'\nSTDERR\n'+result.stderr)
    return result

def read_elf(path, expected_segments, original, require_exact):
    elf = path.read_bytes()
    header = struct.unpack_from('<16sHHIIIIIHHHHHH',elf)
    assert header[0][:7] == b'\x7fELF\x01\x01\x01' and header[2] == 40
    assert header[9] == 32 and header[10] == 6
    segments=[]
    for index in range(header[10]):
        row=struct.unpack_from('<IIIIIIII',elf,header[5]+32*index)
        typ,offset,vma,lma,file_size,mem_size,flags,align=row
        expected=expected_segments[index]
        assert typ == 1 and (vma,lma,file_size,mem_size,flags)==tuple(expected[k] for k in ('vma','lma','file_bytes','memory_bytes','flags'))
        assert align <= 1 or vma%align == offset%align
        assert offset+file_size <= len(elf)
        segments.append({'offset':offset,'vma':vma,'lma':lma,'file_bytes':file_size,'memory_bytes':mem_size,'flags':flags})
    assert sum(row['memory_bytes'] for row in segments if row['file_bytes']==0)==21424
    image=b''.join(elf[segments[i]['offset']:segments[i]['offset']+segments[i]['file_bytes']] for i in (0,4,2,1))
    assert len(image)==165552
    differences=[i for i,(a,b) in enumerate(zip(image,original)) if a!=b]
    if require_exact:
        assert not differences, differences[:20]
        assert sha(image)==ORIGINAL_SHA
    return {'elf_sha256':sha(elf),'image_sha256':sha(image),'image_bytes':len(image),'differences':differences,'segments':segments}

def prepare(directory, baseline, object_data, bindings):
    directory.mkdir(parents=True)
    artifacts={row['name']:row for row in baseline['artifacts']}
    basedir=BASE / f"program-{baseline['identity']['program'].get('kind') == 'nitro_fs' and 1 or 0}"
    for name in ('startup.o','table.o','autoload1.o'):
        shutil.copyfile(basedir/name,directory/name)
        pinned(directory/name,artifacts[name]['sha256'])
    autoload=pinned(basedir/'autoload0.bin',artifacts['autoload0.bin']['sha256'])
    prefix=autoload[:20356];candidate=autoload[20356:20484];suffix=autoload[20484:]
    assert len(candidate)==128 and sha(prefix+candidate+suffix)==artifacts['autoload0.bin']['sha256']
    assert struct.unpack_from('<5I',candidate,108)==(0x027ff000,0x400,0x0380ff80,0x0380bc90,0x400)
    for name,data in (('prefix',prefix),('suffix',suffix)):
        (directory/f'{name}.bin').write_bytes(data)
        (directory/f'{name}.s').write_text(f'.cpu arm7tdmi\n.section .arm7.autoload0.{name},"a",%progbits\n.balign 4\n.incbin "{name}.bin"\n')
        p=run([CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c',f'{name}.s','-o',f'{name}.o'],directory,f'clang-{name}.log')
        assert p.returncode==0,p.stderr
    (directory/'bss0.s').write_text('.cpu arm7tdmi\n.section .arm7.bss.autoload0,"aw",%nobits\n.balign 4\n.space 14920\n')
    p=run([CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c','bss0.s','-o','bss0.o'],directory,'clang-bss0.log')
    assert p.returncode==0,p.stderr
    (directory/'compiled.o').write_bytes(object_data)
    script=pinned(basedir/'physical.ld',artifacts['physical.ld']['sha256']).decode()
    old='.arm7.autoload0 58687488  : AT(37224880) { autoload0.o(.arm7.autoload0) } :p4'
    assert script.count(old)==1
    new=('.arm7.autoload0 58687488  : AT(37224880) {\n'
         ' prefix.o(.arm7.autoload0.prefix)\n'
         ' __candidate_start = .;\n'
         ' compiled.o(.text)\n'
         ' __candidate_end = .;\n'
         ' suffix.o(.arm7.autoload0.suffix)\n'
         '} :p4\n'
         'ASSERT(__candidate_start == 0x037fcf84, "candidate start")\n'
         'ASSERT(__candidate_end == 0x037fd004, "candidate end")\n'
         'ASSERT(__candidate_end - __candidate_start == 128, "candidate size")')
    script=script.replace(old,new)
    old='autoload0.o(.arm7.bss.autoload0)'
    assert script.count(old)==1
    script=script.replace(old,'bss0.o(.arm7.bss.autoload0)')
    script=(f'hyp_irq_stack_size = 0x{bindings[0]:08x};\n'
            f'hyp_wram_arena_lo = 0x{bindings[1]:08x};\n'
            f'hyp_system_stack_size = 0x{bindings[2]:08x};\n'+script)
    (directory/'physical.ld').write_text(script)
    return {'prefix_sha256':sha(prefix),'candidate_original_sha256':sha(candidate),'suffix_sha256':sha(suffix),'object_sha256':sha(object_data),'script_sha256':sha(script.encode())}

def link(directory):
    argv=[LLD,'-m','armelf','--nmagic','-T','physical.ld','-Map','physical.map','-o','linked.elf',
          'startup.o','table.o','autoload1.o','prefix.o','compiled.o','suffix.o','bss0.o']
    result=run(argv,directory,'lld.log')
    assert result.returncode==0,result.stderr
    assert b'compiled.o:(.text)' in (directory/'physical.map').read_bytes()

def main():
    assert not OUT.exists()
    OUT.mkdir()
    assert sha(pinned(ROM,'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'))
    layouts=json.loads(pinned(LAYOUT,'8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'))
    report=json.loads(REPORT.read_text());pins=json.loads(PINS.read_text())
    for name,path in (('clang',CLANG),('lld',LLD)):
        assert str(path)==pins[name]['executable']
        pinned(path,pins[name]['sha256'])
    mw=pinned(HERE/'compiled.o',MW_SHA)
    source=pinned(HERE/'high_getter_trial.c','342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e')
    rom=ROM.read_bytes();fat=struct.unpack_from('<I',rom,0x48)[0];a,b=struct.unpack_from('<II',rom,fat+79*8)
    results=[]
    for index,program in enumerate((rom,rom[a:b])):
        baseline=report['programs'][index]
        assert baseline['identity']==layouts[index]['identity']
        image_offset,entry,base,size=struct.unpack_from('<IIII',program,0x30)
        original=program[image_offset:image_offset+size]
        assert len(original)==165552 and sha(original)==ORIGINAL_SHA
        parent=OUT/f'program-{index}';parent.mkdir()
        positive=parent/'positive';prepared=prepare(positive,baseline,mw,(0x400,0x0380bc90,0x400));link(positive)
        exact=read_elf(positive/'linked.elf',baseline['segments'],original,True)
        wrong=parent/'wrong-binding';prepare(wrong,baseline,mw,(0x400,0x0380bc94,0x400));link(wrong)
        wrong_read=read_elf(wrong/'linked.elf',baseline['segments'],original,False)
        assert wrong_read['differences']==[432+20356+120],wrong_read['differences']
        malformed=bytearray((positive/'linked.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
        value=struct.unpack_from('<I',malformed,phoff+4)[0]
        struct.pack_into('<I',malformed,phoff+4,value+4)
        malformed_path=parent/'malformed-load.elf';malformed_path.write_bytes(malformed)
        try: read_elf(malformed_path,baseline['segments'],original,True)
        except AssertionError: malformed_rejected=True
        else: raise AssertionError('malformed PT_LOAD accepted')
        results.append({'identity':baseline['identity'],'prepared':prepared,'exact':exact,
            'wrong_binding_differences':wrong_read['differences'],
            'malformed_segment_rejected':malformed_rejected})
    result={'status':'direct_MW_object_two_program_images_exact','source_credit_bytes':0,'original_compiler_identity_proven':False,
            'actual_MW_object_sha256':MW_SHA,'native_results':results,'inputs_unchanged':True}
    (OUT/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('Direct actual MW object linked; both 165552-byte ARM7 images exact from six ELF loads; wrong-binding and malformed-load negatives rejected.')

if __name__=='__main__': main()
