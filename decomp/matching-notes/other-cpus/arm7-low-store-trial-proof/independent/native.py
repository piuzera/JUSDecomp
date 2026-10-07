"""Independent direct MW low-store native proof for both original ARM7 images."""
import hashlib
import json
import re
import struct
import subprocess
from pathlib import Path

HERE=Path(__file__).resolve().parent
OUT=HERE/'native-01'
ROM=Path('/Users/djdjo/Documents/mine/rom/jus.nds')
CLANG=Path('/opt/homebrew/opt/llvm/bin/clang')
LLD=Path('/opt/homebrew/bin/ld.lld')
OBJECT_SHA='b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7'
CODE_SHA='b1f95073bcc84916809b86a81bc8d2b6246515a3c4646a1f9ac171214a389488'
IMAGE_SHA='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
sha=lambda data:hashlib.sha256(data).hexdigest()
def pinned(path,digest):
    data=path.read_bytes();assert sha(data)==digest,path
    return data
def run(argv,directory,name):
    p=subprocess.run([str(x) for x in argv],cwd=directory,text=True,capture_output=True)
    (directory/name).write_text(json.dumps({'argv':[str(x) for x in argv],'returncode':p.returncode},indent=2)+'\nSTDOUT\n'+p.stdout+'\nSTDERR\n'+p.stderr)
    return p

def parse_elf(data):
    h=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
    assert h[0][:7]==b'\x7fELF\x01\x01\x01' and h[2]==40 and h[3]==1
    raw=[struct.unpack_from('<IIIIIIIIII',data,h[6]+i*40) for i in range(h[12])]
    nsec=raw[h[13]];names=data[nsec[4]:nsec[4]+nsec[5]]
    sections=[]
    for s in raw:
        name=names[s[0]:names.index(0,s[0])].decode()
        sections.append({'name':name,'type':s[1],'flags':s[2],'vma':s[3],'offset':s[4],'size':s[5],'link':s[6],'info':s[7],'align':s[8]})
    symbols=[]
    for s in sections:
        if s['type']!=2:continue
        tab=sections[s['link']];strings=data[tab['offset']:tab['offset']+tab['size']]
        for pos in range(s['offset'],s['offset']+s['size'],16):
            n,value,size,info,other,index=struct.unpack_from('<IIIBBH',data,pos)
            symbols.append({'name':strings[n:strings.index(0,n)].decode(),'value':value,'size':size,'binding':info>>4,'type':info&15,'section':index})
    segments=[]
    for i in range(h[10]):
        typ,offset,vma,lma,file_bytes,memory_bytes,flags,align=struct.unpack_from('<IIIIIIII',data,h[5]+i*32)
        segments.append({'type':typ,'offset':offset,'vma':vma,'lma':lma,'file_bytes':file_bytes,'memory_bytes':memory_bytes,'flags':flags,'align':align})
    return {'type':h[1],'entry':h[4],'flags':h[7]},sections,symbols,segments

def one_symbol(symbols,name):
    selected=[s for s in symbols if s['name']==name]
    assert len(selected)==1,(name,selected)
    return selected[0]

def expected_segments(layout):
    base=layout['base'];auto0,auto1=layout['regions'][1:]
    assert auto0['kind']=={'autoload':0} and auto1['kind']=={'autoload':1}
    n0=auto0['stored_extent']['end']-auto0['stored_extent']['start']
    n1=auto1['stored_extent']['end']-auto1['stored_extent']['start']
    return [
      {'section':'.arm7.startup','vma':base,'lma':base,'file_bytes':432,'memory_bytes':432,'flags':4},
      {'section':'.arm7.table','vma':base+165528,'lma':base+165528,'file_bytes':24,'memory_bytes':24,'flags':4},
      {'section':'.arm7.autoload1','vma':auto1['runtime_base'],'lma':base+auto1['stored_extent']['start'],'file_bytes':n1,'memory_bytes':n1,'flags':4},
      {'section':'.arm7.bss.autoload1','vma':auto1['runtime_base']+n1,'lma':auto1['runtime_base']+n1,'file_bytes':0,'memory_bytes':auto1['bss_bytes'],'flags':6},
      {'section':'.arm7.autoload0','vma':auto0['runtime_base'],'lma':base+auto0['stored_extent']['start'],'file_bytes':n0,'memory_bytes':n0,'flags':4},
      {'section':'.arm7.bss.autoload0','vma':auto0['runtime_base']+n0,'lma':auto0['runtime_base']+n0,'file_bytes':0,'memory_bytes':auto0['bss_bytes'],'flags':6}]

def linker_script(layout,wrong_place=False):
    segments=expected_segments(layout)
    lines=[f"ARM7_HEADER_ENTRY = {layout['entry']};",'ENTRY(ARM7_HEADER_ENTRY)','PHDRS {']
    lines += [f"p{i} PT_LOAD FLAGS({s['flags']});" for i,s in enumerate(segments)]
    lines += ['}','SECTIONS {']
    for i,s in enumerate(segments):
        section=s['section']
        if section=='.arm7.autoload0':
            selector='prefix.o(.arm7.autoload0.prefix) '
            if wrong_place:selector+='. = . + 4; '
            selector+='__store_start = .; compiled.o(.text) __store_end = .; suffix.o(.arm7.autoload0.suffix)'
        else:
            selector={'.arm7.startup':'startup.o(.arm7.startup)',
                      '.arm7.table':'table.o(.arm7.table)',
                      '.arm7.autoload1':'autoload1.o(.arm7.autoload1)',
                      '.arm7.bss.autoload1':'autoload1.o(.arm7.bss.autoload1)',
                      '.arm7.bss.autoload0':'bss0.o(.arm7.bss.autoload0)'}[section]
        noload='(NOLOAD)' if not s['file_bytes'] else ''
        lines += [f"{section} {s['vma']} {noload} : AT({s['lma']}) {{ {selector} }} :p{i}",
                  f'ASSERT(SIZEOF({section}) == {s["memory_bytes"]}, "section size")']
    lines += ['}','ASSERT(__store_start == 0x037fcf04, "store start")',
              'ASSERT(__store_end == 0x037fcf18, "store end")']
    return '\n'.join(lines)+'\n'

def verify(path,map_path,original,layout):
    data=path.read_bytes();header,sections,symbols,segments=parse_elf(data)
    wanted=expected_segments(layout)
    assert header['type']==2 and header['entry']==layout['entry'] and len(segments)==6
    allocated=[s for s in sections if s['flags']&2 and s['size']]
    assert len(allocated)==6 and {s['name'] for s in allocated}=={s['section'] for s in wanted}
    byname={s['name']:s for s in allocated}
    for actual,expected in zip(segments,wanted):
        assert actual['type']==1 and actual['align']==4
        assert all(actual[k]==expected[k] for k in ('vma','lma','file_bytes','memory_bytes','flags'))
        assert actual['vma']%4==actual['offset']%4
        section=byname[expected['section']]
        assert section['vma']==expected['vma'] and section['size']==expected['memory_bytes'] and section['align']==4
        assert section['type']==(1 if expected['file_bytes'] else 8)
        assert section['flags']==(6 if expected['section']=='.arm7.autoload0' else (2 if expected['file_bytes'] else 3))
        if expected['file_bytes']:
            assert actual['offset']==section['offset'] and actual['offset']+actual['file_bytes']<=len(data)
            assert data[actual['offset']:actual['offset']+actual['file_bytes']]==data[section['offset']:section['offset']+section['size']]
    assert not any(s['type'] in (4,9) and s['size'] for s in sections)
    segments_by_name={s['section']:a for s,a in zip(wanted,segments)}
    image=b''.join(data[segments_by_name['.arm7.'+name]['offset']:segments_by_name['.arm7.'+name]['offset']+segments_by_name['.arm7.'+name]['file_bytes']] for name in ('startup','autoload0','autoload1','table'))
    assert len(image)==165552 and image==original and sha(image)==IMAGE_SHA
    assert image[:20660]==original[:20660] and image[20680:]==original[20680:]
    assert sum(s['memory_bytes'] for s in segments if not s['file_bytes'])==21424
    assert one_symbol(symbols,'arm7_low_store_trial')['value']==0x037fcf04
    assert one_symbol(symbols,'arm7_low_store_trial')['size']==20
    assert one_symbol(symbols,'__store_start')['value']==0x037fcf04
    assert one_symbol(symbols,'__store_end')['value']==0x037fcf18
    assert sha(image[20660:20680])==CODE_SHA
    assert re.search(r'(?m)^\s*37fcf04\s+[0-9a-f]+\s+14\s+4\s+compiled\.o:\(\.text\)$',map_path.read_text())
    return {'elf_sha256':sha(data),'image_sha256':sha(image),'image_bytes':len(image),'segments':segments,'BSS_bytes':21424,'candidate_sha256':sha(image[20660:20680]),'candidate_vma':'0x037fcf04'}

def main():
    assert not OUT.exists();OUT.mkdir()
    layouts=json.loads(pinned(HERE/'checked-layouts.json','8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'))
    rom=pinned(ROM,'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
    pinned(CLANG,'d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5')
    pinned(LLD,'3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54')
    pinned(HERE/'low_store_trial.c','1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362')
    obj=pinned(HERE/'compiled.o',OBJECT_SHA)
    header,sections,symbols,segments=parse_elf(obj)
    assert header['type']==1 and header['flags']==0x02100000 and not segments
    text,=[s for s in sections if s['name']=='.text']
    assert text['flags']==6 and text['size']==20 and text['align']==4
    assert sha(obj[text['offset']:text['offset']+20])==CODE_SHA
    assert [(s['name'],s['value']) for s in symbols if s['name'] in ('$a','$d')]==[('$a',0)]
    assert one_symbol(symbols,'arm7_low_store_trial')['size']==20
    assert not any(s['type'] in (4,9) and s['size'] for s in sections)
    fat=struct.unpack_from('<I',rom,0x48)[0];a,b=struct.unpack_from('<II',rom,fat+79*8)
    results=[]
    for i,(program,layout) in enumerate(zip((rom,rom[a:b]),layouts,strict=True)):
        assert sha(program)==layout['identity']['program_sha256']
        offset,entry,base,size=struct.unpack_from('<IIII',program,0x30)
        assert (offset,entry,base,size)==tuple(layout[k] for k in ('image_offset','entry','base','image_bytes'))
        image=program[offset:offset+size]
        assert len(image)==165552 and sha(image)==IMAGE_SHA
        assert sha(image[20660:20680])==CODE_SHA
        folder=OUT/f'program-{i}';folder.mkdir()
        auto=image[432:66552]
        prefix,candidate,suffix=auto[:20228],auto[20228:20248],auto[20248:]
        assert len(prefix)==20228 and len(candidate)==20 and len(suffix)==45872
        parts={'startup':image[:432],'table':image[165528:],'autoload1':image[66552:165528],'prefix':prefix,'suffix':suffix}
        for name,payload in parts.items():
            (folder/f'{name}.bin').write_bytes(payload)
            section=('.arm7.autoload0.' if name in ('prefix','suffix') else '.arm7.')+name
            asm=f'.cpu arm7tdmi\n.section {section},"a",%progbits\n.balign 4\n.incbin "{name}.bin"\n'
            if name=='autoload1':asm+='.section .arm7.bss.autoload1,"aw",%nobits\n.balign 4\n.space 6504\n'
            (folder/f'{name}.s').write_text(asm)
            p=run([CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c',f'{name}.s','-o',f'{name}.o'],folder,f'clang-{name}.log')
            assert p.returncode==0,p.stderr
        (folder/'bss0.s').write_text('.cpu arm7tdmi\n.section .arm7.bss.autoload0,"aw",%nobits\n.balign 4\n.space 14920\n')
        p=run([CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c','bss0.s','-o','bss0.o'],folder,'clang-bss0.log');assert p.returncode==0,p.stderr
        (folder/'compiled.o').write_bytes(obj)
        inputs=['startup.o','table.o','autoload1.o','prefix.o','compiled.o','suffix.o','bss0.o']
        def link(name,wrong_place=False,omit=False):
            (folder/f'{name}.ld').write_text(linker_script(layout,wrong_place))
            argv=[LLD,'-m','armelf','--nmagic','-T',f'{name}.ld','-Map',f'{name}.map','-o',f'{name}.elf']+[x for x in inputs if not (omit and x=='compiled.o')]
            return run(argv,folder,f'{name}-lld.log')
        p=link('positive');assert p.returncode==0,p.stderr
        positive=verify(folder/'positive.elf',folder/'positive.map',image,layout)
        p=link('omitted',omit=True);assert p.returncode!=0 and ('store end' in p.stderr or 'section size' in p.stderr)
        p=link('wrong-placement',wrong_place=True);assert p.returncode!=0 and ('store start' in p.stderr or 'section size' in p.stderr)
        malformed=bytearray((folder/'positive.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
        old=struct.unpack_from('<I',malformed,phoff+4)[0];struct.pack_into('<I',malformed,phoff+4,old+4)
        malformed_path=folder/'malformed.elf';malformed_path.write_bytes(malformed)
        try:verify(malformed_path,folder/'positive.map',image,layout)
        except AssertionError:malformed_rejected=True
        else:raise AssertionError('malformed PT_LOAD accepted')
        results.append({'identity':layout['identity'],'positive':positive,'omitted_object_rejected':True,'wrong_placement_rejected':True,'malformed_load_rejected':malformed_rejected})
    pinned(ROM,'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
    pinned(HERE/'compiled.o',OBJECT_SHA)
    result={'status':'actual_MW_low_store_two_original_images_exact','source_credit_bytes':0,'programs':results}
    (OUT/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('Actual MW low-store object linked at 037fcf04 in both exact full ARM7 images; omitted, wrong-placement and malformed-load controls rejected.')

if __name__=='__main__':main()
