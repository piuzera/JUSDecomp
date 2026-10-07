"""Independent finite native link of two actual MW getter objects."""
import hashlib
import json
import re
import struct
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
OUT = HERE / 'native-01'
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
CLANG = Path('/opt/homebrew/opt/llvm/bin/clang')
LLD = Path('/opt/homebrew/bin/ld.lld')
SOURCE = {'low': ('low_getter_trial.c','fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537'),
          'high': ('high_getter_trial.c','342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e')}
OBJECT = {'low':('low.o','9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b',88,80,20268,0x037fcf2c,'arm7_low_getter_trial'),
          'high':('high.o','b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1',128,108,20356,0x037fcf84,'arm7_high_getter_trial')}
sha=lambda data: hashlib.sha256(data).hexdigest()

def pinned(path,digest):
    data=path.read_bytes();assert sha(data)==digest,path
    return data

def run(argv,directory,log):
    p=subprocess.run([str(x) for x in argv],cwd=directory,text=True,capture_output=True)
    (directory/log).write_text(json.dumps({'argv':[str(x) for x in argv],'returncode':p.returncode},indent=2)+'\nSTDOUT\n'+p.stdout+'\nSTDERR\n'+p.stderr)
    return p

def parse_elf(data):
    h=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
    assert h[0][:7]==b'\x7fELF\x01\x01\x01' and h[1] in (1,2) and h[2]==40 and h[3]==1
    shoff,shnum,shstr=h[6],h[12],h[13]
    raw=[struct.unpack_from('<IIIIIIIIII',data,shoff+i*40) for i in range(shnum)]
    name_section=raw[shstr];names=data[name_section[4]:name_section[4]+name_section[5]]
    sections=[]
    for s in raw:
        name=names[s[0]:names.index(0,s[0])].decode()
        sections.append({'name':name,'type':s[1],'flags':s[2],'vma':s[3],'offset':s[4],'size':s[5],'link':s[6],'info':s[7],'align':s[8],'entry_size':s[9]})
    symbols=[]
    for s in sections:
        if s['type']!=2:continue
        strings=sections[s['link']];strings=data[strings['offset']:strings['offset']+strings['size']]
        for offset in range(s['offset'],s['offset']+s['size'],16):
            n,value,size,info,other,index=struct.unpack_from('<IIIBBH',data,offset)
            symbols.append({'name':strings[n:strings.index(0,n)].decode(),'value':value,'size':size,'binding':info>>4,'type':info&15,'section':index})
    segments=[]
    for i in range(h[10]):
        typ,offset,vma,lma,file_bytes,memory_bytes,flags,align=struct.unpack_from('<IIIIIIII',data,h[5]+i*32)
        segments.append({'type':typ,'offset':offset,'vma':vma,'lma':lma,'file_bytes':file_bytes,'memory_bytes':memory_bytes,'flags':flags,'align':align})
    return {'type':h[1],'machine':h[2],'flags':h[7],'entry':h[4]},sections,symbols,segments

def get_symbol(symbols,name):
    selected=[s for s in symbols if s['name']==name]
    assert len(selected)==1,(name,selected)
    return selected[0]

def check_objects(original):
    rows={}
    for role,(filename,digest,size,code_bytes,offset,vma,symbol) in OBJECT.items():
        data=pinned(HERE/filename,digest)
        header,sections,symbols,segments=parse_elf(data)
        assert header['type']==1 and header['flags']==0x02100000 and not segments
        text,=[s for s in sections if s['name']=='.text']
        assert text['size']==size and text['flags']==6 and text['align']==4
        payload=data[text['offset']:text['offset']+size]
        assert payload[:code_bytes]==original[432+offset:432+offset+code_bytes]
        assert get_symbol(symbols,symbol)['size']==size
        assert [(s['name'],s['value']) for s in symbols if s['name'] in ('$a','$d')]==[('$a',0),('$d',code_bytes)]
        rela,=[s for s in sections if s['name']=='.rela.text']
        assert rela['type']==4 and rela['info']==sections.index(text) and rela['size']%12==0
        rel=[]
        for pos in range(rela['offset'],rela['offset']+rela['size'],12):
            target,info,addend=struct.unpack_from('<IIi',data,pos)
            item={'offset':target,'type':info&255,'symbol':symbols[info>>8]['name'],'addend':addend}
            assert item['type']==2 and addend==0 and code_bytes<=target<size
            undefined=get_symbol(symbols,item['symbol'])
            assert undefined['section']==0 and undefined['binding']==1 and undefined['type']==0
            rel.append(item)
        rows[role]={'sha256':digest,'text_sha256':sha(payload),'code_sha256':sha(payload[:code_bytes]),'text_bytes':size,'code_bytes':code_bytes,'relocations':rel}
    assert [(x['offset'],x['symbol']) for x in rows['low']['relocations']]==[(80,'hyp_subpriv_arena_lo'),(84,'hyp_wram_arena_lo')]
    assert [(x['offset'],x['symbol']) for x in rows['high']['relocations']]==[(112,'hyp_irq_stack_size'),(120,'hyp_wram_arena_lo'),(124,'hyp_system_stack_size')]
    return rows

def segments_from_layout(layout):
    base=layout['base'];r0,r1=layout['regions'][1:]
    def initialized(region):return region['stored_extent']['end']-region['stored_extent']['start']
    assert r0['kind']=={'autoload':0} and r1['kind']=={'autoload':1}
    return [
      {'section':'.arm7.startup','vma':base,'lma':base,'file_bytes':432,'memory_bytes':432,'flags':4},
      {'section':'.arm7.table','vma':base+165528,'lma':base+165528,'file_bytes':24,'memory_bytes':24,'flags':4},
      {'section':'.arm7.autoload1','vma':r1['runtime_base'],'lma':base+r1['stored_extent']['start'],'file_bytes':initialized(r1),'memory_bytes':initialized(r1),'flags':4},
      {'section':'.arm7.bss.autoload1','vma':r1['runtime_base']+initialized(r1),'lma':r1['runtime_base']+initialized(r1),'file_bytes':0,'memory_bytes':r1['bss_bytes'],'flags':6},
      {'section':'.arm7.autoload0','vma':r0['runtime_base'],'lma':base+r0['stored_extent']['start'],'file_bytes':initialized(r0),'memory_bytes':initialized(r0),'flags':4},
      {'section':'.arm7.bss.autoload0','vma':r0['runtime_base']+initialized(r0),'lma':r0['runtime_base']+initialized(r0),'file_bytes':0,'memory_bytes':r0['bss_bytes'],'flags':6}]

def script(layout,bindings,swap=False):
    segments=segments_from_layout(layout)
    lines=[f"ARM7_HEADER_ENTRY = {layout['entry']};",'ENTRY(ARM7_HEADER_ENTRY)','PHDRS {']
    lines += [f"p{i} PT_LOAD FLAGS({s['flags']});" for i,s in enumerate(segments)]
    lines += ['}',*[f'{name} = 0x{value:08x};' for name,value in bindings.items()],'SECTIONS {']
    for i,s in enumerate(segments):
        section=s['section']
        if section=='.arm7.autoload0':
            order=['high','low'] if swap else ['low','high']
            selector='prefix.o(.arm7.autoload0.prefix) '
            for role in order:
                selector+=f'__{role}_start = .; {role}.o(.text) __{role}_end = .; '
            selector+='suffix.o(.arm7.autoload0.suffix)'
        else:
            selector={'.arm7.startup':'startup.o(.arm7.startup)',
                      '.arm7.table':'table.o(.arm7.table)',
                      '.arm7.autoload1':'autoload1.o(.arm7.autoload1)',
                      '.arm7.bss.autoload1':'autoload1.o(.arm7.bss.autoload1)',
                      '.arm7.bss.autoload0':'bss0.o(.arm7.bss.autoload0)'}[section]
        noload='(NOLOAD)' if not s['file_bytes'] else ''
        lines += [f"{section} {s['vma']} {noload} : AT({s['lma']}) {{ {selector} }} :p{i}",
                  f'ASSERT(SIZEOF({section}) == {s["memory_bytes"]}, "section size")']
    lines += ['}', 'ASSERT(__low_start == 0x037fcf2c, "low start")',
              'ASSERT(__low_end == 0x037fcf84, "low end")',
              'ASSERT(__high_start == 0x037fcf84, "high start")',
              'ASSERT(__high_end == 0x037fd004, "high end")']
    return '\n'.join(lines)+'\n'

def verify_link(path,map_path,original,layout,bindings,require_exact):
    data=path.read_bytes();header,sections,symbols,segments=parse_elf(data)
    expected=segments_from_layout(layout)
    assert header['type']==2 and header['entry']==layout['entry'] and len(segments)==6
    allocated=[s for s in sections if s['flags']&2 and s['size']]
    assert len(allocated)==6 and {s['name'] for s in allocated}=={s['section'] for s in expected}
    byname={s['name']:s for s in allocated}
    for actual,wanted in zip(segments,expected):
        assert actual['type']==1 and actual['align']==4
        assert all(actual[key]==wanted[key] for key in ('vma','lma','file_bytes','memory_bytes','flags'))
        assert actual['vma']%4==actual['offset']%4
        section=byname[wanted['section']]
        assert section['vma']==wanted['vma'] and section['size']==wanted['memory_bytes'] and section['align']==4
        assert section['type']==(1 if wanted['file_bytes'] else 8)
        assert section['flags']==(6 if wanted['section']=='.arm7.autoload0' else (2 if wanted['file_bytes'] else 3))
        if wanted['file_bytes']:
            assert actual['offset']==section['offset'] and actual['offset']+actual['file_bytes']<=len(data)
            assert data[actual['offset']:actual['offset']+actual['file_bytes']]==data[section['offset']:section['offset']+section['size']]
    assert not any(s['type'] in (4,9) and s['size'] for s in sections)
    names={s['section']:a for s,a in zip(expected,segments)}
    image=b''.join(data[names['.arm7.'+part]['offset']:names['.arm7.'+part]['offset']+names['.arm7.'+part]['file_bytes']] for part in ('startup','autoload0','autoload1','table'))
    assert len(image)==len(original)==165552
    diff=[i for i,(a,b) in enumerate(zip(image,original)) if a!=b]
    if require_exact: assert not diff and sha(image)=='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
    assert image[:20700]==original[:20700] and image[20916:]==original[20916:]
    assert sum(s['memory_bytes'] for s in segments if not s['file_bytes'])==21424
    for role,(_,digest,size,code,offset,vma,name) in OBJECT.items():
        symbol=get_symbol(symbols,name);assert symbol['value']==vma and symbol['size']==size
        assert get_symbol(symbols,f'__{role}_start')['value']==vma
        assert get_symbol(symbols,f'__{role}_end')['value']==vma+size
        assert image[432+offset:432+offset+size]==original[432+offset:432+offset+size] if require_exact else True
    for name,value in bindings.items():assert get_symbol(symbols,name)['value']==value
    map_text=map_path.read_text()
    for role,(_,digest,size,code,offset,vma,name) in OBJECT.items():
        pattern=rf'(?m)^\s*{vma:x}\s+[0-9a-f]+\s+{size:x}\s+4\s+{role}\.o:\(\.text\)$'
        assert re.search(pattern,map_text),role
    return {'elf_sha256':sha(data),'image_sha256':sha(image),'image_bytes':len(image),'mismatch_offsets':diff,
            'segments':segments,'BSS_bytes':21424,'low_sha256':sha(image[20700:20788]),'high_sha256':sha(image[20788:20916]),
            'linked_low_pool':list(struct.unpack_from('<II',image,20780)),
            'linked_high_pool':list(struct.unpack_from('<5I',image,20896))}

def main():
    assert not OUT.exists();OUT.mkdir()
    pinned(HERE/'arm7-checked-layouts.json','8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc')
    layout=json.loads((HERE/'arm7-checked-layouts.json').read_text())
    rom=pinned(ROM,'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
    pinned(CLANG,'d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5')
    pinned(LLD,'3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54')
    for role,(name,digest) in SOURCE.items():pinned(HERE/name,digest)
    fat=struct.unpack_from('<I',rom,0x48)[0];a,b=struct.unpack_from('<II',rom,fat+79*8)
    records=[]
    for index,(program,checked) in enumerate(zip((rom,rom[a:b]),layout,strict=True)):
        assert sha(program)==checked['identity']['program_sha256']
        image_offset,entry,base,size=struct.unpack_from('<IIII',program,0x30)
        assert (image_offset,entry,base,size)==tuple(checked[k] for k in ('image_offset','entry','base','image_bytes'))
        image=program[image_offset:image_offset+size]
        assert len(image)==165552 and sha(image)==checked['image_sha256']
        objects=check_objects(image)
        folder=OUT/f'program-{index}';folder.mkdir()
        autoload=image[432:66552]
        assert len(autoload)==66120
        prefix=autoload[:20268];candidate=autoload[20268:20484];suffix=autoload[20484:]
        assert len(prefix)==20268 and len(candidate)==216 and len(suffix)==45636
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
        for role,(name,digest,*_) in OBJECT.items():(folder/f'{role}.o').write_bytes(pinned(HERE/name,digest))
        bindings={'hyp_subpriv_arena_lo':0x027f9c08,'hyp_wram_arena_lo':0x0380bc90,'hyp_irq_stack_size':0x400,'hyp_system_stack_size':0x400}
        def link(trial,values,swap=False,omit_high=False):
            (folder/f'{trial}.ld').write_text(script(checked,values,swap))
            argv=[LLD,'-m','armelf','--nmagic','-T',f'{trial}.ld','-Map',f'{trial}.map','-o',f'{trial}.elf','startup.o','table.o','autoload1.o','prefix.o','low.o']
            if not omit_high:argv.append('high.o')
            argv+=['suffix.o','bss0.o']
            return run(argv,folder,f'{trial}-lld.log')
        p=link('positive',bindings);assert p.returncode==0,p.stderr
        positive=verify_link(folder/'positive.elf',folder/'positive.map',image,checked,bindings,True)
        wrong={**bindings,'hyp_wram_arena_lo':0x0380bc94}
        p=link('wrong-wram',wrong);assert p.returncode==0,p.stderr
        wrong_read=verify_link(folder/'wrong-wram.elf',folder/'wrong-wram.map',image,checked,wrong,False)
        assert wrong_read['mismatch_offsets']==[20784,20908]
        p=link('omit-high',bindings,omit_high=True);assert p.returncode!=0
        p=link('swap-roles',bindings,swap=True);assert p.returncode!=0
        malformed=bytearray((folder/'positive.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
        offset=struct.unpack_from('<I',malformed,phoff+4)[0];struct.pack_into('<I',malformed,phoff+4,offset+4)
        malformed_path=folder/'malformed.elf';malformed_path.write_bytes(malformed)
        try:verify_link(malformed_path,folder/'positive.map',image,checked,bindings,True)
        except AssertionError:malformed_rejected=True
        else:raise AssertionError('malformed ELF accepted')
        records.append({'identity':checked['identity'],'objects':objects,'positive':positive,'wrong_shared_WRAM':wrong_read,
                        'omitted_high_rejected':True,'swapped_roles_rejected':True,'malformed_load_rejected':malformed_rejected})
    assert pinned(HERE/'arm7-checked-layouts.json','8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc')
    assert pinned(ROM,'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
    result={'status':'two_actual_MW_getter_objects_exact_both_images','programs':records,'source_credit_bytes':0,'canonical_bytes':304,'T10_open':True}
    (OUT/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('Two actual MW objects linked contiguously; both full original images exact; shared WRAM, omitted/swapped role, malformed-load controls rejected.')

if __name__=='__main__':main()
