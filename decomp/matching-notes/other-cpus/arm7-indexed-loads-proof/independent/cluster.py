"""Independent fixed four-object ARM7 native cluster proof."""
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
OBJECT={
 'lowstore':('lowstore/compiled.o','b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7',20,20,20660,0x037fcf04,'arm7_low_store_trial'),
 'upperstore':('upperstore/compiled.o','03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf',20,20,20680,0x037fcf18,'arm7_store_trial'),
 'lowgetter':('lowgetter/compiled.o','9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b',88,80,20700,0x037fcf2c,'arm7_low_getter_trial'),
 'highgetter':('highgetter/compiled.o','b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1',128,108,20788,0x037fcf84,'arm7_high_getter_trial')}
SOURCE={'lowstore':('low_store_trial.c','1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362'),
'upperstore':('store_trial.c','a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb'),
'lowgetter':('low_getter_trial.c','fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537'),
'highgetter':('high_getter_trial.c','342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e')}
sha=lambda data:hashlib.sha256(data).hexdigest()
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

def check_objects(original):
    rows={}
    for role,(filename,digest,size,code,offset,vma,name) in OBJECT.items():
        data=pinned(HERE/filename,digest)
        header,sections,symbols,segments=parse_elf(data)
        assert header['type']==1 and header['flags']==0x02100000 and not segments
        text,=[s for s in sections if s['name']=='.text']
        assert (text['size'],text['flags'],text['align'])==(size,6,4)
        payload=data[text['offset']:text['offset']+size]
        assert payload[:code]==original[offset:offset+code],role
        sym=get_symbol(symbols,name)
        assert sym['size']==size and sym['type']==2 and sym['binding']==1
        markers=[(s['name'],s['value']) for s in symbols if s['name'] in ('$a','$d')]
        assert markers==([('$a',0)] if code==size else [('$a',0),('$d',code)])
        rel=[]
        for rela in [s for s in sections if s['name']=='.rela.text']:
            assert rela['type']==4 and rela['info']==sections.index(text) and rela['size']%12==0
            for pos in range(rela['offset'],rela['offset']+rela['size'],12):
                target,info,addend=struct.unpack_from('<IIi',data,pos)
                item={'offset':target,'type':info&255,'symbol':symbols[info>>8]['name'],'addend':addend}
                assert item['type']==2 and addend==0 and code<=target<size
                rel.append(item)
        assert not any(s['type']==9 and s['size'] for s in sections)
        if role in ('lowstore','upperstore'):assert rel==[] and not any(s['type']==4 and s['size'] for s in sections)
        rows[role]={'sha256':digest,'text_sha256':sha(payload),'code_sha256':sha(payload[:code]),'text_bytes':size,'code_bytes':code,'relocations':rel}
    assert [(x['offset'],x['symbol']) for x in rows['lowgetter']['relocations']]==[(80,'hyp_subpriv_arena_lo'),(84,'hyp_wram_arena_lo')]
    assert [(x['offset'],x['symbol']) for x in rows['highgetter']['relocations']]==[(112,'hyp_irq_stack_size'),(120,'hyp_wram_arena_lo'),(124,'hyp_system_stack_size')]
    return rows

def script(layout,bindings,swap=False):
    segs=segments_from_layout(layout)
    lines=[f"ARM7_HEADER_ENTRY = {layout['entry']};",'ENTRY(ARM7_HEADER_ENTRY)','PHDRS {']
    lines += [f"p{i} PT_LOAD FLAGS({s['flags']});" for i,s in enumerate(segs)]
    lines += ['}',*[f'{name} = 0x{value:08x};' for name,value in bindings.items()],'SECTIONS {']
    for i,s in enumerate(segs):
        section=s['section']
        if section=='.arm7.autoload0':
            selector='prefix.o(.arm7.autoload0.prefix) '
            for marker,role in [('lowstore','upperstore'),('upperstore','lowstore'),('lowgetter','lowgetter'),('highgetter','highgetter')] if swap else [(x,x) for x in OBJECT]:
                selector+=f'__{marker}_start = .; {role}.o(.text) __{marker}_end = .; '
            selector+='suffix.o(.arm7.autoload0.suffix)'
        else:
            selector={'.arm7.startup':'startup.o(.arm7.startup)',
                '.arm7.table':'table.o(.arm7.table)',
                '.arm7.autoload1':'autoload1.o(.arm7.autoload1)',
                '.arm7.bss.autoload1':'autoload1.o(.arm7.bss.autoload1)',
                '.arm7.bss.autoload0':'bss0.o(.arm7.bss.autoload0)'}[section]
        noload='(NOLOAD)' if not s['file_bytes'] else ''
        lines += [f"{section} {s['vma']} {noload} : AT({s['lma']}) {{ {selector} }} :p{i}",f'ASSERT(SIZEOF({section}) == {s["memory_bytes"]}, "section size")']
    lines += ['}']
    for role,(_,_,size,_,_,vma,_) in OBJECT.items():
        lines += [f'ASSERT(__{role}_start == {vma}, "{role} start")',f'ASSERT(__{role}_end == {vma+size}, "{role} end")']
    return '\n'.join(lines)+'\n'

def verify_link(path,map_path,original,layout,bindings,strict):
    data=path.read_bytes();header,sections,symbols,segments=parse_elf(data)
    expected=segments_from_layout(layout)
    assert header['type']==2 and header['entry']==layout['entry'] and len(segments)==6
    allocated=[s for s in sections if s['flags']&2 and s['size']]
    assert len(allocated)==6 and {s['name'] for s in allocated}=={s['section'] for s in expected}
    byname={s['name']:s for s in allocated}
    for actual,wanted in zip(segments,expected):
        assert actual['type']==1 and actual['align']==4
        assert all(actual[k]==wanted[k] for k in ('vma','lma','file_bytes','memory_bytes','flags'))
        assert actual['vma']%4==actual['offset']%4
        sec=byname[wanted['section']]
        assert sec['vma']==wanted['vma'] and sec['size']==wanted['memory_bytes'] and sec['align']==4
        assert sec['type']==(1 if wanted['file_bytes'] else 8)
        assert sec['flags']==(6 if wanted['section']=='.arm7.autoload0' else (2 if wanted['file_bytes'] else 3))
        if wanted['file_bytes']:
            assert actual['offset']==sec['offset'] and actual['offset']+actual['file_bytes']<=len(data)
            assert data[actual['offset']:actual['offset']+actual['file_bytes']]==data[sec['offset']:sec['offset']+sec['size']]
    assert not any(s['type']in(4,9)and s['size'] for s in sections)
    bysegment={s['section']:a for s,a in zip(expected,segments)}
    image=b''.join(data[bysegment['.arm7.'+x]['offset']:bysegment['.arm7.'+x]['offset']+bysegment['.arm7.'+x]['file_bytes']] for x in ('startup','autoload0','autoload1','table'))
    assert len(image)==len(original)==165552
    diff=[i for i,(a,b) in enumerate(zip(image,original)) if a!=b]
    if strict:assert not diff and sha(image)=='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
    assert image[:20660]==original[:20660] and image[20916:]==original[20916:]
    assert sum(s['memory_bytes'] for s in segments if not s['file_bytes'])==21424
    for role,(_,digest,size,code,offset,vma,name) in OBJECT.items():
        sym=get_symbol(symbols,name)
        assert sym['value']==vma and sym['size']==size and sym['type']==2,role
        assert get_symbol(symbols,f'__{role}_start')['value']==vma
        assert get_symbol(symbols,f'__{role}_end')['value']==vma+size
        if strict:assert image[offset:offset+size]==original[offset:offset+size]
        pattern=rf'(?m)^\s*{vma:x}\s+[0-9a-f]+\s+{size:x}\s+4\s+{role}\.o:\(\.text\)$'
        assert re.search(pattern,map_path.read_text()),role
    for name,value in bindings.items():assert get_symbol(symbols,name)['value']==value
    return {'elf_sha256':sha(data),'image_sha256':sha(image),'image_bytes':len(image),'mismatch_offsets':diff,
        'segments':segments,'BSS_bytes':21424,'role_sha256':{role:sha(image[row[4]:row[4]+row[2]]) for role,row in OBJECT.items()},
        'low_pool':list(struct.unpack_from('<II',image,20780)),
        'high_pool':list(struct.unpack_from('<5I',image,20896))}

def main():
    assert not OUT.exists();OUT.mkdir()
    pinned(HERE/'arm7-checked-layouts.json','8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc')
    layout=json.loads((HERE/'arm7-checked-layouts.json').read_text())
    rom=pinned(ROM,'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
    pinned(CLANG,'d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5')
    pinned(LLD,'3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54')
    for role,(name,digest) in SOURCE.items():pinned(HERE/role/name,digest)
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
        prefix=autoload[:20228];candidate=autoload[20228:20484];suffix=autoload[20484:]
        assert len(prefix)==20228 and len(candidate)==256 and len(suffix)==45636
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
        def link(trial,values,swap=False,omit=None):
            (folder/f'{trial}.ld').write_text(script(checked,values,swap))
            inputs=['startup.o','table.o','autoload1.o','prefix.o']+[f'{x}.o' for x in OBJECT if x!=omit]+['suffix.o','bss0.o']
            argv=[LLD,'-m','armelf','--nmagic','-T',f'{trial}.ld','-Map',f'{trial}.map','-o',f'{trial}.elf']+inputs
            return run(argv,folder,f'{trial}-lld.log')
        p=link('positive',bindings);assert p.returncode==0,p.stderr
        positive=verify_link(folder/'positive.elf',folder/'positive.map',image,checked,bindings,True)
        wrong={**bindings,'hyp_wram_arena_lo':0x0380bc94}
        p=link('wrong-wram',wrong);assert p.returncode==0,p.stderr
        wrong_read=verify_link(folder/'wrong-wram.elf',folder/'wrong-wram.map',image,checked,wrong,False)
        assert wrong_read['mismatch_offsets']==[20784,20908]
        omissions={}
        for role in OBJECT:
            p=link(f'omit-{role}',bindings,omit=role)
            assert p.returncode!=0 and ('section size' in p.stderr or role in p.stderr)
            omissions[role]=p.returncode
        p=link('swap-stores',bindings,swap=True)
        if p.returncode==0:
            try:verify_link(folder/'swap-stores.elf',folder/'swap-stores.map',image,checked,bindings,True)
            except AssertionError:swap_rejected='strict_actual_role_readback'
            else:raise AssertionError('store swap accepted')
        else:swap_rejected='native_link'
        malformed=bytearray((folder/'positive.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
        off=struct.unpack_from('<I',malformed,phoff+4)[0];struct.pack_into('<I',malformed,phoff+4,off+4)
        malformed_path=folder/'malformed.elf';malformed_path.write_bytes(malformed)
        try:verify_link(malformed_path,folder/'positive.map',image,checked,bindings,True)
        except AssertionError:malformed_rejected=True
        else:raise AssertionError('malformed ELF accepted')
        records.append({'identity':checked['identity'],'objects':objects,'positive':positive,'wrong_shared_WRAM':wrong_read,
                        'omitted_roles':omissions,'swapped_stores_rejected_by':swap_rejected,'malformed_load_rejected':malformed_rejected})
    pinned(HERE/'arm7-checked-layouts.json','8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc')
    pinned(ROM,'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
    for role,(name,digest) in SOURCE.items():pinned(HERE/role/name,digest)
    for role,(name,digest,*_) in OBJECT.items():pinned(HERE/name,digest)
    result={'status':'four_actual_MW_objects_exact_both_images','programs':records,'source_credit_bytes':0,'canonical_bytes':304,'T10_open':True}
    (OUT/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('Four actual MW objects linked contiguously; both full original images exact; shared WRAM and all negative controls checked.')

if __name__=='__main__':main()
