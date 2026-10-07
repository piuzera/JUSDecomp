"""Independently read ten explicit ARM windows and seven distinct data words."""
from pathlib import Path
import hashlib
import json
import struct
import subprocess

OUT=Path(__file__).resolve().parent
BASE=Path('/private/tmp/jus-arm7-getter-independent/decomp/matching-notes/other-cpus')
ROM=Path('/Users/djdjo/Documents/mine/rom/jus.nds')
sha=lambda b:hashlib.sha256(b).hexdigest()
spans=[(0x037fcf2c,0x037fcf48),(0x037fcf48,0x037fcf50),(0x037fcf50,0x037fcf60),(0x037fcf60,0x037fcf74),(0x037fcf74,0x037fcf7c),(0x037fcf84,0x037fcfa0),(0x037fcfa0,0x037fcfa8),(0x037fcfa8,0x037fcfb0),(0x037fcfb0,0x037fcfe8),(0x037fcfe8,0x037fcff0)]
literal_words={0x037fcf7c:0x027f9c08,0x037fcf80:0x0380bc90,0x037fcff0:0x027ff000,0x037fcff4:0x400,0x037fcff8:0x0380ff80,0x037fcffc:0x0380bc90,0x037fd000:0x400}
rom=ROM.read_bytes();assert sha(rom)=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
layout_bytes=(BASE/'arm7-checked-layouts.json').read_bytes();assert sha(layout_bytes)=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
layouts=json.loads(layout_bytes)
fnt,fnlen,fat,falen=struct.unpack_from('<4I',rom,0x40)
todo=[(0xf000,'')];files={};dirs=set()
while todo:
    d,path=todo.pop();assert d not in dirs;dirs.add(d)
    pos,first,_=struct.unpack_from('<IHH',rom,fnt+(d-0xf000)*8);pos+=fnt
    while rom[pos]:
        tag=rom[pos];pos+=1;name=rom[pos:pos+(tag&127)].decode('ascii');pos+=tag&127
        if tag&128:
            child,=struct.unpack_from('<H',rom,pos);pos+=2;todo.append((child,path+name+'/'))
        else:files[path+name]=first;first+=1
assert files['ChildRom/JSS2Child.srl']==79
cs,ce=struct.unpack_from('<II',rom,fat+79*8);assert(cs,ce)==(0x23b800,0x4464c8)
records=[]
for index,(program,rom_base,layout) in enumerate(zip((rom,rom[cs:ce]),(0,cs),layouts,strict=True)):
    assert sha(program)==layout['identity']['program_sha256']
    offset,entry,base,size=struct.unpack_from('<4I',program,0x30)
    assert[offset,entry,base,size]==[layout[k] for k in ('image_offset','entry','base','image_bytes')]
    assert sha(program[:0x4000])==layout['header_sha256']
    image=program[offset:offset+size];assert sha(image)==layout['image_sha256']
    params=image[layout['params_offset']:layout['params_offset']+20];assert sha(params)==layout['params_sha256']
    tb,te,ds,_,_=struct.unpack('<5I',params);table=image[tb-base:te-base];assert sha(table)==layout['table_sha256']
    stored=ds-base;regions=[]
    for j in range(len(table)//12):
        runtime,initialized,bss=struct.unpack_from('<3I',table,j*12);r=layout['regions'][j+1]
        assert r['kind']=={'autoload':j} and(runtime,bss)==(r['runtime_base'],r['bss_bytes'])
        assert r['stored_extent']=={'start':stored,'end':stored+initialized}
        assert sha(image[stored:stored+initialized])==r['sha256']
        regions.append({'kind':{'autoload':j},'initialized':[runtime,runtime+initialized],'bss':[runtime+initialized,runtime+initialized+bss],'stored':stored});stored+=initialized
    initialized_start,initialized_end=regions[0]['initialized'];stored_start=regions[0]['stored']
    def raw(address,length):
        assert initialized_start<=address<address+length<=initialized_end
        location=stored_start+address-initialized_start
        return image[location:location+length],location
    windows=[];loads=[]
    for j,(a,b) in enumerate(spans):
        selected,location=raw(a,b-a);words=struct.unpack('<'+'I'*((b-a)//4),selected)
        argv=['/opt/homebrew/opt/llvm/bin/llvm-mc','--disassemble','--triple=armv4t-none-eabi']
        llvm=subprocess.run(argv,input=' '.join('0x%02x'%v for v in selected)+'\n',text=True,capture_output=True)
        assert llvm.returncode==0 and not llvm.stderr
        lines=[line.strip() for line in llvm.stdout.splitlines() if line.strip() and line.strip()!='.text']
        assert len(lines)==len(words)
        (OUT/('program-%d-window-%02d-llvm.txt'%(index,j))).write_text(llvm.stdout)
        for k,w in enumerate(words):
            site=a+4*k
            if w&0x0f7f0000==0x051f0000:
                imm=w&0xfff
                literal=site+8+(imm if w&(1<<23) else -imm)
                assert literal in literal_words
                loads.append({'source':site,'condition_nibble':w>>28,'literal_address':literal,'literal_word':literal_words[literal]})
        windows.append({'extent':[a,b],'stored_image_offset':location,'original_rom_offset':rom_base+offset+location,'sha256':sha(selected),'words':['0x%08x'%w for w in words],'condition_nibbles':[w>>28 for w in words],'llvm_instructions':lines,'llvm_stdout_sha256':sha(llvm.stdout.encode())})
    assert sum(len(w['words']) for w in windows)==47
    literals=[]
    for address,value in literal_words.items():
        word,location=raw(address,4);assert struct.unpack('<I',word)[0]==value
        ownership=[]
        for r in regions:
            for kind in ('initialized','bss'):
                a,b=r[kind]
                if a<=value and value+4<=b:ownership.append({'region':r['kind'],'kind':kind})
        boundaries=[{'region':r['kind'],'kind':k,'boundary':'exclusive_end'} for r in regions for k in ('initialized','bss') if value==r[k][1]]
        if value in(0x027f9c08,0x0380bc90):assert not ownership and any(x['kind']=='bss' for x in boundaries)
        if value in(0x027ff000,0x0380ff80,0x400):assert not ownership
        literals.append({'address':address,'word':value,'sha256':sha(word),'stored_image_offset':location,'original_rom_offset':rom_base+offset+location,'pool_mapping':'initialized autoload0','pointed_word_mapping':ownership or None,'pointed_value_boundaries':boundaries})
    records.append({'identity':layout['identity'],'windows':windows,'literal_reads':literals,'literal_load_arithmetic':loads,'autoload_regions':regions})
assert ROM.read_bytes()==rom and(BASE/'arm7-checked-layouts.json').read_bytes()==layout_bytes
(OUT/'independent-original-read.json').write_text(json.dumps({'status':'passed','fnt_directories':len(dirs),'fnt_files':len(files),'child_file_id':79,'child_rom_extent':[cs,ce],'programs':records,'inputs_unchanged':True,'source_credit_bytes':0},indent=2)+'\n')
print('Independent ten-window/47-instruction and seven initialized data-word reads pass for both exact identities; BSS exclusive-end values remain unmapped.')
