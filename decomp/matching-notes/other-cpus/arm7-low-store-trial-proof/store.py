"""Finite original lower-store readback and actual-object native proof."""
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

HERE=Path(__file__).resolve().parent
ROM=Path('/Users/djdjo/Documents/mine/rom/jus.nds')

def _sha(data):
    return hashlib.sha256(data).hexdigest()

def _run(argv, directory, filename):
    result = subprocess.run(argv, cwd=directory, capture_output=True, text=True)
    record = {'argv':argv, 'returncode':result.returncode, 'stdout':result.stdout, 'stderr':result.stderr}
    (directory/filename).write_text(json.dumps(record,indent=2)+'\n')
    return record



def _native_layout(layout):
    base = layout['base']; startup,a0,a1 = layout['regions']
    def initialized(region,name):
        size = region['stored_extent']['end']-region['stored_extent']['start']
        return {'section':'.arm7.'+name,'vma':region['runtime_base'],'lma':base+region['stored_extent']['start'],'file_bytes':size,'memory_bytes':size,'flags':4}
    def bss(region,name):
        address = region['runtime_base']+region['stored_extent']['end']-region['stored_extent']['start']
        return {'section':'.arm7.bss.'+name,'vma':address,'lma':address,'file_bytes':0,'memory_bytes':region['bss_bytes'],'flags':6}
    table = layout['table_extent']; size = table['end']-table['start']
    return [initialized(startup,'startup'),{'section':'.arm7.table','vma':base+table['start'],'lma':base+table['start'],'file_bytes':size,'memory_bytes':size,'flags':4},
            initialized(a1,'autoload1'),bss(a1,'autoload1'),initialized(a0,'autoload0'),bss(a0,'autoload0')]



def _parse_elf(path: Path) -> tuple[dict, list[dict], list[dict], list[dict]]:
    data = path.read_bytes()
    header = struct.unpack_from("<16sHHIIIIIHHHHHH", data)
    assert header[0][:7] == b"\x7fELF\x01\x01\x01" and header[2] == 40
    assert header[3] == 1 and header[9] == 32 and header[11] == 40
    phoff, phnum, shoff, shnum, shstr = header[5], header[10], header[6], header[12], header[13]
    assert phoff == 52 and shoff + shnum * 40 <= len(data)
    sections_raw = [struct.unpack_from("<IIIIIIIIII", data, shoff + i * 40) for i in range(shnum)]
    names_section = sections_raw[shstr]
    names = data[names_section[4] : names_section[4] + names_section[5]]

    def section_name(offset: int) -> str:
        end = names.index(0, offset)
        return names[offset:end].decode("ascii")

    sections = [
        {
            "name": section_name(s[0]),
            "type": s[1],
            "flags": s[2],
            "vma": s[3],
            "offset": s[4],
            "size": s[5],
            "link": s[6],
            "entry_size": s[9],
            "align": s[8],
        }
        for s in sections_raw
    ]
    segments = []
    for i in range(phnum):
        p = struct.unpack_from("<IIIIIIII", data, phoff + i * 32)
        segments.append(
            dict(zip(("type", "offset", "vma", "lma", "file_bytes", "memory_bytes", "flags", "align"), p))
        )
    symbols = []
    for section in sections:
        if section["type"] != 2:
            continue
        strings = sections[section["link"]]
        string_data = data[strings["offset"] : strings["offset"] + strings["size"]]
        for pos in range(section["offset"], section["offset"] + section["size"], 16):
            name, value, size, info, other, shndx = struct.unpack_from("<IIIBBH", data, pos)
            end = string_data.index(0, name)
            symbols.append(
                {"name": string_data[name:end].decode("ascii"), "vma": value, "size": size, "section": shndx}
            )
    return {"entry": header[4], "flags": header[7], "bytes": len(data)}, sections, segments, symbols





def _originals(manifest,recipe,output):
    layout_bytes=(HERE/'checked-layouts.json').read_bytes()
    assert _sha(layout_bytes)=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
    layouts=json.loads(layout_bytes);rom=ROM.read_bytes()
    assert _sha(rom)==layouts[0]['identity']['parent_rom_sha256']
    fnt,_,fat,fat_size=struct.unpack_from('<IIII',rom,0x40)
    def named(directory,wanted):
        offset,file_id,_=struct.unpack_from('<IHH',rom,fnt+(directory&0xfff)*8);cursor=fnt+offset
        while rom[cursor]:
            length=rom[cursor];cursor+=1;name=rom[cursor:cursor+(length&0x7f)].decode();cursor+=length&0x7f
            if length&0x80:
                identifier=struct.unpack_from('<H',rom,cursor)[0];cursor+=2;kind='directory'
            else:
                identifier=file_id;file_id+=1;kind='file'
            if name==wanted:return kind,identifier
        raise AssertionError(wanted)
    kind,directory=named(0xf000,'ChildRom');assert kind=='directory'
    kind,number=named(directory,'JSS2Child.srl');assert kind=='file' and number==79 and(number+1)*8<=fat_size
    child_start,child_end=struct.unpack_from('<II',rom,fat+number*8)
    records=[]
    for index,(program,layout) in enumerate(zip((rom,rom[child_start:child_end]),layouts,strict=True)):
        assert _sha(program)==layout['identity']['program_sha256']
        offset,entry,base,size=struct.unpack_from('<IIII',program,0x30)
        assert [offset,entry,base,size]==[layout[k]for k in('image_offset','entry','base','image_bytes')]
        image=program[offset:offset+size];assert _sha(image)==layout['image_sha256']
        table_start,table_end,initialized_start=struct.unpack_from('<III',image,0x198)
        assert table_start-base==layout['table_extent']['start'] and table_end-base==layout['table_extent']['end']
        assert _sha(image[table_start-base:table_end-base])==layout['table_sha256']
        cursor=initialized_start-base
        for i,region in enumerate(layout['regions'][1:]):
            runtime,initialized,bss=struct.unpack_from('<III',image,table_start-base+i*12)
            assert runtime==region['runtime_base'] and bss==region['bss_bytes']
            assert region['stored_extent']=={'start':cursor,'end':cursor+initialized}
            assert _sha(image[cursor:cursor+initialized])==region['sha256'];cursor+=initialized
        region=layout['regions'][1];vma=manifest['vma'];length=manifest['bytes']
        assert region['runtime_base']<=vma<vma+length<=region['runtime_base']+region['stored_extent']['end']-region['stored_extent']['start']
        position=region['stored_extent']['start']+vma-region['runtime_base'];code=image[position:position+length]
        assert list(struct.unpack('<'+'I'*(length//4),code))==[int(w,16)for w in manifest['words']]
        assert _sha(code)==manifest['code_sha256']
        argv=[recipe['llvm_mc'],'--disassemble','--triple=armv4t-none-eabi']
        llvm=subprocess.run(argv,input=' '.join(f'0x{x:02x}'for x in code)+'\n',capture_output=True,text=True,check=True)
        assert llvm.stderr=='' and len(llvm.stdout.strip().splitlines())==length//4
        (output/f'original-{index}-llvm.txt').write_text(llvm.stdout)
        records.append({'layout':layout,'image':image,'code':code,'readback':{'identity':layout['identity'],
                        'stored_image_offset':position,'program_offset':offset+position,'words':manifest['words'],
                        'code_sha256':_sha(code),'llvm_command':argv,'llvm_stdout_sha256':_sha(llvm.stdout.encode())}})
    assert ROM.read_bytes()==rom and (HERE/'checked-layouts.json').read_bytes()==layout_bytes
    return records


def _inspect_object(path,manifest):
    data=path.read_bytes();header=struct.unpack_from('<16sHHIIIIIHHHHHH',data)
    assert header[0][:7]==b'\x7fELF\x01\x01\x01' and header[1:4]==(1,40,1) and header[11]==40
    raw=[struct.unpack_from('<IIIIIIIIII',data,header[6]+i*40)for i in range(header[12])]
    names_row=raw[header[13]];names=data[names_row[4]:names_row[4]+names_row[5]]
    sections=[{'index':i,'name':names[s[0]:names.index(0,s[0])].decode(),'type':s[1],'flags':s[2],
               'offset':s[4],'size':s[5],'link':s[6],'info':s[7],'alignment':s[8],'entry_size':s[9]}for i,s in enumerate(raw)]
    symbols=[];tables={}
    for section in sections:
        if section['type']!=2:continue
        strings=sections[section['link']];strings=data[strings['offset']:strings['offset']+strings['size']]
        assert section['entry_size']==16
        table=[]
        for offset in range(section['offset'],section['offset']+section['size'],16):
            name,value,size,info,other,index=struct.unpack_from('<IIIBBH',data,offset)
            table.append({'name':strings[name:strings.index(0,name)].decode(),'value':value,'size':size,
                          'binding':info>>4,'type':info&15,'other':other,'section_index':index})
        tables[section['index']]=table;symbols+=table
    function,=[s for s in symbols if s['name']==manifest['function']]
    section=sections[function['section_index']]
    assert(function['binding'],function['type'],function['value'])==(1,2,0)
    assert(section['name'],section['flags'],section['alignment'])==('.text',6,4)
    assert function['size']==section['size']
    modes=[s for s in symbols if s['name']in('$a','$d','$t')]
    assert modes[0]['name']=='$a' and modes[0]['value']==0
    assert not any(s['name']=='$t'for s in modes)
    instruction_bytes=next((s['value']for s in modes if s['name']=='$d'),section['size'])
    text=data[section['offset']:section['offset']+section['size']]
    relas=[]
    for relocation in sections:
        if relocation['type']not in(4,9):continue
        assert relocation['type']==4 and relocation['entry_size']==12 and relocation['info']==section['index']
        for offset in range(relocation['offset'],relocation['offset']+relocation['size'],12):
            target,info,addend=struct.unpack_from('<IIi',data,offset)
            relas.append({'offset':target,'type':info&255,'symbol':tables[relocation['link']][info>>8]['name'],'addend':addend})
    return {'object_sha256':_sha(data),'object_bytes':len(data),'flags':header[7],'sections':sections,'symbols':symbols,
            'trial_symbol':function,'mode':'Arm','mode_evidence':modes,'text_hex':text.hex(),'text_sha256':_sha(text),
            'instruction_bytes':instruction_bytes,'pool_bytes':len(text)-instruction_bytes,'relocations':relas}


def _script(layout,manifest,wrong_placement=False):
    segments=_native_layout(layout)
    lines=[f"ARM7_HEADER_ENTRY = {layout['entry']};",'ENTRY(ARM7_HEADER_ENTRY)','PHDRS {']
    lines += [f'p{i} PT_LOAD FLAGS({s["flags"]});'for i,s in enumerate(segments)]+['}','SECTIONS {']
    for i,s in enumerate(segments):
        name=s['section']
        if name=='.arm7.autoload0':
            selectors='prefix.o(.arm7.autoload0.prefix) '+('. += 4; 'if wrong_placement else '')+'__candidate_start = .; compiled.o(.text) __candidate_end = .; suffix.o(.arm7.autoload0.suffix)'
        else:
            obj='bss0.o'if name=='.arm7.bss.autoload0'else('autoload1.o'if'autoload1'in name else name.removeprefix('.arm7.')+'.o')
            selectors=f'{obj}({name})'
        noload='(NOLOAD)'if not s['file_bytes']else''
        lines += [f'{name} {s["vma"]} {noload} : AT({s["lma"]}) {{ {selectors} }} :p{i}',f'ASSERT(SIZEOF({name}) == {s["memory_bytes"]}, "section size")']
    lines += ['}',f'ASSERT(__candidate_start == {manifest["vma"]}, "candidate start")',
              f'ASSERT(__candidate_end == {manifest["vma"]+manifest["bytes"]}, "candidate end")',
              f'ASSERT(__candidate_end - __candidate_start == {manifest["bytes"]}, "candidate size")']
    return '\n'.join(lines)+'\n'


def _read_native(elf_path,map_path,object_path,original,manifest):
    data=elf_path.read_bytes();header,sections,segments,symbols=_parse_elf(elf_path)
    layout=original['layout'];expected=_native_layout(layout)
    assert header['entry']==layout['entry'] and len(segments)==len(expected)
    allocated=[s for s in sections if s['flags']&2 and s['size']]
    assert[s['name']for s in allocated]==[s['section']for s in expected]
    for section,segment,wanted in zip(allocated,segments,expected,strict=True):
        assert segment['type']==1 and segment['align']==section['align']==4
        assert all(segment[k]==wanted[k]for k in('vma','lma','file_bytes','memory_bytes','flags'))
        assert section['vma']==wanted['vma'] and section['size']==wanted['memory_bytes']
        assert section['type']==(1 if wanted['file_bytes']else 8)
        assert section['flags']==(6 if wanted['section']=='.arm7.autoload0'else(2 if wanted['file_bytes']else 3))
        if segment['file_bytes']:
            assert segment['offset']==section['offset']
            assert segment['offset']+segment['file_bytes']<=len(data)
            assert data[segment['offset']:segment['offset']+segment['file_bytes']]==data[section['offset']:section['offset']+section['size']]
    named=dict(zip([s['section']for s in expected],segments,strict=True))
    image=b''.join(data[named['.arm7.'+name]['offset']:named['.arm7.'+name]['offset']+named['.arm7.'+name]['file_bytes']]for name in('startup','autoload0','autoload1','table'))
    assert len(image)==len(original['image'])==layout['image_bytes'] and image==original['image']
    position=original['readback']['stored_image_offset'];length=manifest['bytes']
    assert image[:position]==original['image'][:position] and image[position+length:]==original['image'][position+length:]
    assert not any(s['type']in(4,9)and s['size']for s in sections)
    actual_object=elf_path.parent/'compiled.o';assert _sha(actual_object.read_bytes())==_sha(object_path.read_bytes())==manifest['object_sha256']
    pattern=re.compile(r'^\s*([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+(\d+)\s+compiled\.o:\(\.text\)\s*$')
    matches=[(line,pattern.match(line))for line in map_path.read_text().splitlines()if pattern.match(line)]
    assert len(matches)==1;map_row,match=matches[0]
    assert tuple(int(match.group(i),16)for i in(1,2,3))==(manifest['vma'],layout['base']+position,length)
    assert int(match.group(4))==4
    function,=[s for s in symbols if s['name']==manifest['function']]
    assert(function['vma'],function['size'])==(manifest['vma'],length)and sections[function['section']]['name']=='.arm7.autoload0'
    for name,address in(('__candidate_start',manifest['vma']),('__candidate_end',manifest['vma']+length)):
        boundary,=[s for s in symbols if s['name']==name];assert boundary['vma']==address
    linked=image[position:position+length];assert linked==original['code']
    bss=sum(s['memory_bytes']for s in segments if not s['file_bytes']);assert bss==sum(r['bss_bytes']for r in layout['regions'])
    return {'linked_elf_sha256':_sha(data),'elf_header':header,'sections':allocated,'segments':segments,
            'map_row':map_row,'map_vma':manifest['vma'],'map_lma':layout['base']+position,'map_bytes':length,
            'function':function,'actual_input_sha256':_sha(actual_object.read_bytes()),'linked_bytes_sha256':_sha(linked),
            'image_bytes':len(image),'image_sha256':_sha(image),'BSS_bytes':bss,'noncandidate_bytes_unchanged':True,'linked_relocation_sections':0}


def _native(output,object_path,originals,manifest,recipe):
    assert _sha(object_path.read_bytes())==manifest['object_sha256']
    output.mkdir();records=[]
    for index,original in enumerate(originals):
        layout=original['layout'];image=original['image'];region=layout['regions'][1]
        first=manifest['vma']-region['runtime_base'];last=first+manifest['bytes']
        start=region['stored_extent']['start'];end=region['stored_extent']['end']
        assert 0<=first<last<=end-start
        folder=output/f'program-{index}';folder.mkdir()
        parts={'startup':image[layout['regions'][0]['stored_extent']['start']:layout['regions'][0]['stored_extent']['end']],
               'table':image[layout['table_extent']['start']:layout['table_extent']['end']],
               'autoload1':image[layout['regions'][2]['stored_extent']['start']:layout['regions'][2]['stored_extent']['end']],
               'prefix':image[start:start+first],'suffix':image[start+last:end]}
        commands=[]
        for name,payload in parts.items():
            (folder/(name+'.bin')).write_bytes(payload)
            section='.arm7.autoload0.'+name if name in('prefix','suffix')else'.arm7.'+name
            assembly=f'.cpu arm7tdmi\n.section {section},"a",%progbits\n.balign 4\n.incbin "{name}.bin"\n'
            if name=='autoload1':assembly+=f'.section .arm7.bss.autoload1,"aw",%nobits\n.balign 4\n.space {layout["regions"][2]["bss_bytes"]}\n'
            (folder/(name+'.s')).write_text(assembly)
            command=_run([recipe['clang'],'--target=arm-none-eabi','-mcpu=arm7tdmi','-c',name+'.s','-o',name+'.o'],folder,'clang-'+name+'.json')
            assert command['returncode']==0,command['stderr'];commands.append(command)
        (folder/'bss0.s').write_text(f'.cpu arm7tdmi\n.section .arm7.bss.autoload0,"aw",%nobits\n.balign 4\n.space {region["bss_bytes"]}\n')
        command=_run([recipe['clang'],'--target=arm-none-eabi','-mcpu=arm7tdmi','-c','bss0.s','-o','bss0.o'],folder,'clang-bss0.json')
        assert command['returncode']==0,command['stderr'];commands.append(command)
        (folder/'compiled.o').write_bytes(object_path.read_bytes())
        inputs=['startup.o','table.o','autoload1.o','prefix.o','compiled.o','suffix.o','bss0.o']
        input_pins={name:_sha((folder/name).read_bytes())for name in inputs}
        record={'identity':layout['identity'],'opaque_ranges':{'prefix_bytes':first,'candidate_bytes':last-first,'suffix_bytes':end-start-last},
                'input_sha256':input_pins,'opaque_parts_sha256':{name:_sha(data)for name,data in parts.items()},'assembly_commands':commands}
        for trial,selected,wrong in[('positive',inputs,False),('omitted_object',[n for n in inputs if n!='compiled.o'],False),('wrong_placement',inputs,True)]:
            script=_script(layout,manifest,wrong);(folder/(trial+'.ld')).write_text(script)
            argv=[recipe['lld'],'-m','armelf','--nmagic','-T',trial+'.ld','-Map',trial+'.map','-o',trial+'.elf',*selected]
            assert all(_sha((folder/n).read_bytes())==pin for n,pin in input_pins.items())
            linked=_run(argv,folder,trial+'-command.json')
            linked.update({'input_sha256':{n:input_pins[n]for n in selected},'linker_script':script,'linker_script_sha256':_sha(script.encode())})
            if trial=='positive':
                assert linked['returncode']==0,linked['stderr']
                readback=_read_native(folder/'positive.elf',folder/'positive.map',object_path,original,manifest)
                readback.update({'native_command':linked,'map_sha256':_sha((folder/'positive.map').read_bytes())})
                record[trial]=readback
            else:
                assert linked['returncode']!=0,trial+' unexpectedly accepted'
                record[trial]=linked
        malformed=bytearray((folder/'positive.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
        previous=struct.unpack_from('<I',malformed,phoff+4)[0];struct.pack_into('<I',malformed,phoff+4,previous+4)
        (folder/'malformed-load.elf').write_bytes(malformed)
        try:_read_native(folder/'malformed-load.elf',folder/'positive.map',object_path,original,manifest)
        except AssertionError:record['malformed_load']={'rejected':True,'old_offset':previous,'wrong_offset':previous+4,'elf_sha256':_sha(malformed)}
        else:raise AssertionError('malformed load offset accepted')
        assert all(_sha((folder/n).read_bytes())==pin for n,pin in input_pins.items())
        records.append(record)
    assert _sha(object_path.read_bytes())==manifest['object_sha256']
    return records
