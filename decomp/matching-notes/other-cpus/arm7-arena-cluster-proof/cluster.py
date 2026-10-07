"""Private fixed four-role ARM7 native integration proof."""
from dataclasses import dataclass, asdict, replace
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess

HERE = Path(__file__).resolve().parent
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')


def _sha(data):
    return hashlib.sha256(data).hexdigest()


@dataclass(frozen=True)
class FourBindings:
    subpriv: int
    wram: int
    irq: int
    system: int


@dataclass(frozen=True)
class VerifiedCandidate:
    row: dict
    object_path: Path
    elf: dict
    compile_command: dict


def _load_contract():
    contract = json.loads((HERE/'contract.json').read_text())
    rows = contract['candidates']
    assert tuple(r['role'] for r in rows) == ('lower_store','upper_store','lower_getter','upper_getter')
    assert all(a['vma']+a['bytes'] == b['vma'] for a,b in zip(rows,rows[1:]))
    assert [r['recipe'] for r in rows] == ['build82_O4s','build114_O4p','build82_O4s','build82_O4s']
    assert set(contract['bindings']) == {'subpriv', 'wram', 'irq', 'system'}
    return contract


def _binding_symbols(contract, bindings):
    return {row['symbol']:getattr(bindings, field) for field,row in contract['bindings'].items()}


def _run(argv, directory, filename):
    result = subprocess.run(argv, cwd=directory, capture_output=True, text=True)
    record = {'argv':argv, 'returncode':result.returncode, 'stdout':result.stdout, 'stderr':result.stderr}
    (directory/filename).write_text(json.dumps(record,indent=2)+'\n')
    return record


def _inspect_object(path, row, contract):
    data = path.read_bytes()
    assert _sha(data) == row['object_sha256'], row['role']+' object identity'
    header = struct.unpack_from('<16sHHIIIIIHHHHHH', data)
    assert header[0][:7] == b'\x7fELF\x01\x01\x01' and header[1:4] == (1,40,1)
    assert header[11] == 40
    raw = [struct.unpack_from('<IIIIIIIIII',data,header[6]+i*40) for i in range(header[12])]
    names_row = raw[header[13]]
    names = data[names_row[4]:names_row[4]+names_row[5]]
    sections = [{'index':i,'name':names[s[0]:names.index(0,s[0])].decode(),
                 'type':s[1],'flags':s[2],'offset':s[4],'size':s[5],
                 'link':s[6],'info':s[7],'alignment':s[8],'entry_size':s[9]} for i,s in enumerate(raw)]
    tables = {}
    for section in sections:
        if section['type'] != 2:
            continue
        strings = sections[section['link']]
        strings = data[strings['offset']:strings['offset']+strings['size']]
        assert section['entry_size'] == 16
        symbols = []
        for offset in range(section['offset'],section['offset']+section['size'],16):
            name,value,size,info,other,index = struct.unpack_from('<IIIBBH',data,offset)
            symbols.append({'name':strings[name:strings.index(0,name)].decode(),'value':value,'size':size,
                            'binding':info>>4,'type':info&15,'other':other,'section_index':index})
        tables[section['index']] = symbols
    symbols = [s for table in tables.values() for s in table]
    function, = [s for s in symbols if s['name'] == row['function']]
    text_section = sections[function['section_index']]
    assert (function['binding'],function['type'],function['value'],function['size']) == (1,2,0,row['bytes'])
    assert (text_section['name'],text_section['flags'],text_section['alignment'],text_section['size']) == ('.text',6,4,row['bytes'])
    modes = [s for s in symbols if s['name'] in ('$a','$d','$t')]
    expected_modes = [('$a',0)] + ([('$d',row['code_bytes'])] if row['code_bytes'] < row['bytes'] else [])
    assert [(s['name'],s['value']) for s in modes] == expected_modes
    text = data[text_section['offset']:text_section['offset']+text_section['size']]
    relocations = []
    for rel in sections:
        if rel['type'] not in (4,9):
            continue
        assert rel['type'] == 4 and rel['entry_size'] == 12 and rel['info'] == text_section['index']
        for offset in range(rel['offset'],rel['offset']+rel['size'],12):
            target,info,addend = struct.unpack_from('<IIi',data,offset)
            symbol = tables[rel['link']][info>>8]
            assert (symbol['section_index'],symbol['binding'],symbol['type'],symbol['value'],symbol['size']) == (0,1,0,0,0)
            assert row['code_bytes'] <= target <= len(text)-4
            relocations.append({'section':rel['name'],'offset':target,'type':info&255,'symbol':symbol['name'],'addend':addend})
    expected = [(r['offset'],r['type'],contract['bindings'][r['binding']]['symbol'],r['addend']) for r in row['relocations']]
    assert [(r['offset'],r['type'],r['symbol'],r['addend']) for r in relocations] == expected
    return {'object_sha256':_sha(data),'object_bytes':len(data),'flags':header[7],'sections':sections,'symbols':symbols,
            'trial_symbol':function,'mode':'Arm','mode_evidence':modes,'instruction_bytes':row['code_bytes'],
            'pool_bytes':row['bytes']-row['code_bytes'],'text_hex':text.hex(),'relocations':relocations}


def _load_originals(contract, recipe, output):
    layout_bytes = (HERE/'checked-layouts.json').read_bytes()
    assert _sha(layout_bytes) == '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
    layouts = json.loads(layout_bytes)
    rom = ROM.read_bytes()
    assert _sha(rom) == layouts[0]['identity']['parent_rom_sha256']
    manifest = json.loads((HERE/'original-manifest.json').read_text())
    fnt,_,fat,fat_size = struct.unpack_from('<IIII',rom,0x40)
    def named_entry(directory,wanted):
        offset,file_id,_ = struct.unpack_from('<IHH',rom,fnt+(directory&0xfff)*8)
        cursor = fnt+offset
        while rom[cursor]:
            length = rom[cursor]; cursor += 1
            name = rom[cursor:cursor+(length&0x7f)].decode('ascii'); cursor += length&0x7f
            if length&0x80:
                identifier = struct.unpack_from('<H',rom,cursor)[0]; cursor += 2; kind = 'directory'
            else:
                identifier = file_id; file_id += 1; kind = 'file'
            if name == wanted:
                return kind,identifier
        raise AssertionError(wanted)
    kind,directory = named_entry(0xf000,'ChildRom'); assert kind == 'directory'
    kind,file_id = named_entry(directory,'JSS2Child.srl')
    assert kind == 'file' and file_id == 79 and (file_id+1)*8 <= fat_size
    child_start,child_end = struct.unpack_from('<II',rom,fat+file_id*8)
    originals = []
    for index,(program,layout) in enumerate(zip((rom,rom[child_start:child_end]),layouts,strict=True)):
        assert _sha(program) == layout['identity']['program_sha256']
        offset,entry,base,size = struct.unpack_from('<IIII',program,0x30)
        assert [offset,entry,base,size] == [layout[k] for k in ('image_offset','entry','base','image_bytes')]
        image = program[offset:offset+size]; assert _sha(image) == layout['image_sha256']
        table_start,table_end,initialized_start = struct.unpack_from('<III',image,0x198)
        assert table_start-base == layout['table_extent']['start'] and table_end-base == layout['table_extent']['end']
        assert _sha(image[table_start-base:table_end-base]) == layout['table_sha256']
        stored = initialized_start-base
        for number,region in enumerate(layout['regions'][1:]):
            runtime,initialized,bss = struct.unpack_from('<III',image,table_start-base+number*12)
            assert region['kind'] == {'autoload':number} and region['runtime_base'] == runtime and region['bss_bytes'] == bss
            assert region['stored_extent'] == {'start':stored,'end':stored+initialized}
            assert _sha(image[stored:stored+initialized]) == region['sha256']; stored += initialized
        region = layout['regions'][1]
        candidate_reads = []
        for row in contract['candidates']:
            observed = manifest[row['role']]
            windows = observed['instruction_windows']; literals = observed['literal_words']
            assert windows[0]['start'] == row['vma'] and windows[-1]['end'] == row['vma']+row['code_bytes']
            assert all(a['end'] == b['start'] for a,b in zip(windows,windows[1:]))
            code = b''
            for window in windows:
                position = region['stored_extent']['start']+window['start']-region['runtime_base']
                data = image[position:position+window['end']-window['start']]
                assert _sha(data) == window['sha256']
                assert list(struct.unpack('<'+'I'*(len(data)//4),data)) == [int(w,16) for w in window['words']]
                code += data
            pool = b''
            for literal in literals:
                position = region['stored_extent']['start']+literal['address']-region['runtime_base']
                data = image[position:position+4]
                assert _sha(data) == literal['sha256'] and struct.unpack('<I',data)[0] == int(literal['word'],16)
                assert not any(w['start'] <= literal['address'] < w['end'] for w in windows)
                for source in literal['load_sources']:
                    instruction_offset = region['stored_extent']['start']+source-region['runtime_base']
                    word = struct.unpack_from('<I',image,instruction_offset)[0]
                    assert word&0xfffff000 in (0xe59f0000,0xe59f1000) and source+8+(word&0xfff) == literal['address']
                pool += data
            assert len(code) == row['code_bytes'] and len(code+pool) == row['bytes']
            assert [l['address'] for l in literals] == list(range(row['vma']+row['code_bytes'],row['vma']+row['bytes'],4))
            argv = [recipe['llvm_mc'],'--disassemble','--triple=armv4t-none-eabi']
            llvm = subprocess.run(argv,input=' '.join(f'0x{x:02x}' for x in code)+'\n',capture_output=True,text=True,check=True)
            assert llvm.stderr == '' and len(llvm.stdout.strip().splitlines()) == len(code)//4
            (output/f'original-{index}-{row["role"]}-llvm.txt').write_text(llvm.stdout)
            candidate_reads.append({'role':row['role'],'stored_image_offset':region['stored_extent']['start']+row['vma']-region['runtime_base'],
                                 'code_sha256':_sha(code),'pool_words':[f'0x{x:08x}' for x in struct.unpack('<'+'I'*(len(pool)//4),pool)],
                                 'bytes_sha256':_sha(code+pool),'bytes_hex':(code+pool).hex(),'llvm_command':argv,'llvm_sha256':_sha(llvm.stdout.encode())})
        originals.append({'layout':layout,'image':image,'candidate_reads':candidate_reads})
    assert ROM.read_bytes() == rom and (HERE/'checked-layouts.json').read_bytes() == layout_bytes
    return originals


def _diagnostic_bytes(getter, contract, bindings):
    text = bytearray.fromhex(getter.elf['text_hex'])
    values = _binding_symbols(contract,bindings)
    for relocation in getter.elf['relocations']:
        assert relocation['type'] == 2
        value = values[relocation['symbol']]+relocation['addend']
        assert 0 <= value <= 0xffffffff
        struct.pack_into('<I',text,relocation['offset'],value)
    return bytes(text)


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


def _build_script(layout, contract, bindings, swapped=False):
    segments = _native_layout(layout)
    lines = [f"ARM7_HEADER_ENTRY = {layout['entry']};",'ENTRY(ARM7_HEADER_ENTRY)','PHDRS {']
    lines += [f'p{i} PT_LOAD FLAGS({s["flags"]});' for i,s in enumerate(segments)]
    lines += ['}']+[f'{symbol} = 0x{value:08x};' for symbol,value in _binding_symbols(contract,bindings).items()]+['SECTIONS {']
    rows = contract['candidates']
    roles = [rows[1],rows[0],rows[2],rows[3]] if swapped else rows
    for i,segment in enumerate(segments):
        name = segment['section']
        if name == '.arm7.autoload0':
            selectors = 'prefix.o(.arm7.autoload0.prefix) '
            for expected,actual in zip(contract['candidates'],roles,strict=True):
                role = expected['role']
                selectors += f'__{role}_start = .; {actual["role"]}.o(.text) __{role}_end = .; '
            selectors += 'suffix.o(.arm7.autoload0.suffix)'
        else:
            obj = 'bss0.o' if name == '.arm7.bss.autoload0' else ('autoload1.o' if 'autoload1' in name else name.removeprefix('.arm7.')+'.o')
            selectors = f'{obj}({name})'
        noload = '(NOLOAD)' if not segment['file_bytes'] else ''
        lines += [f'{name} {segment["vma"]} {noload} : AT({segment["lma"]}) {{ {selectors} }} :p{i}',f'ASSERT(SIZEOF({name}) == {segment["memory_bytes"]}, "section size")']
    lines += ['}']
    for row in contract['candidates']:
        role = row['role']
        lines += [f'ASSERT(__{role}_start == {row["vma"]}, "getter {role} start")',
                  f'ASSERT(__{role}_end == {row["vma"]+row["bytes"]}, "getter {role} end")',
                  f'ASSERT(__{role}_end - __{role}_start == {row["bytes"]}, "getter {role} size")']
    return '\n'.join(lines)+'\n'


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



def _read_native(elf_path, map_path, candidates, original, contract, bindings, require_original=True):
    data = elf_path.read_bytes()
    header,sections,segments,symbols = _parse_elf(elf_path)
    layout = original['layout']; expected = _native_layout(layout)
    assert header['entry'] == layout['entry'] and len(segments) == len(expected)
    allocated = [s for s in sections if s['flags']&2 and s['size']]
    assert [s['name'] for s in allocated] == [s['section'] for s in expected]
    for section,segment,wanted in zip(allocated,segments,expected,strict=True):
        assert segment['type'] == 1 and segment['align'] == section['align'] == 4
        assert all(segment[key] == wanted[key] for key in ('vma','lma','file_bytes','memory_bytes','flags'))
        assert section['vma'] == wanted['vma'] and section['size'] == wanted['memory_bytes']
        assert section['type'] == (1 if wanted['file_bytes'] else 8)
        assert section['flags'] == (6 if wanted['section']=='.arm7.autoload0' else (2 if wanted['file_bytes'] else 3))
        if segment['file_bytes']:
            assert segment['offset'] == section['offset']
            assert segment['offset']+segment['file_bytes'] <= len(data)
            assert data[segment['offset']:segment['offset']+segment['file_bytes']] == data[section['offset']:section['offset']+section['size']]
    named = dict(zip([s['section'] for s in expected],segments,strict=True))
    image = b''.join(data[named['.arm7.'+part]['offset']:named['.arm7.'+part]['offset']+named['.arm7.'+part]['file_bytes']] for part in ('startup','autoload0','autoload1','table'))
    assert len(image) == len(original['image']) == layout['image_bytes']
    region = layout['regions'][1]
    pair_start = region['stored_extent']['start']+candidates[0].row['vma']-region['runtime_base']
    pair_end = region['stored_extent']['start']+candidates[-1].row['vma']+candidates[-1].row['bytes']-region['runtime_base']
    assert image[:pair_start] == original['image'][:pair_start] and image[pair_end:] == original['image'][pair_end:]
    bss_bytes = sum(s['memory_bytes'] for s in segments if not s['file_bytes'])
    assert bss_bytes == sum(r['bss_bytes'] for r in layout['regions'])
    assert not any(s['type'] in (4,9) and s['size'] for s in sections)
    observed_bindings = {}
    for field,spec in contract['bindings'].items():
        symbol, = [s for s in symbols if s['name'] == spec['symbol']]
        assert symbol['vma'] == getattr(bindings,field) and symbol['size'] == 0 and symbol['section'] == 0xfff1
        observed_bindings[field] = symbol['vma']
    map_lines = map_path.read_text().splitlines()
    candidate_reads = []
    for getter in candidates:
        row = getter.row; role = row['role']
        actual_input = elf_path.parent/(role+'.o')
        assert _sha(actual_input.read_bytes()) == getter.elf['object_sha256'] == row['object_sha256']
        pattern = re.compile(r'^\s*([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+(\d+)\s+'+re.escape(role+'.o:(.text)')+r'\s*$')
        map_matches = [(line,pattern.match(line)) for line in map_lines if pattern.match(line)]
        map_line,match = map_matches[0]; assert len(map_matches) == 1
        map_vma,map_lma,map_size = [int(match.group(i),16) for i in (1,2,3)]
        position = region['stored_extent']['start']+row['vma']-region['runtime_base']
        assert (map_vma,map_lma,map_size,int(match.group(4))) == (row['vma'],layout['base']+position,row['bytes'],4), f'{role} map placement {(map_vma,map_lma,map_size)} differs from contract'
        function, = [s for s in symbols if s['name'] == row['function']]
        assert function['vma'] == row['vma'] and function['size'] == row['bytes']
        assert sections[function['section']]['name'] == '.arm7.autoload0'
        for suffix,address in (('start',row['vma']),('end',row['vma']+row['bytes'])):
            boundary, = [s for s in symbols if s['name'] == '__'+role+'_'+suffix]
            assert boundary['vma'] == address
        linked = image[position:position+row['bytes']]
        assert linked == _diagnostic_bytes(getter,contract,bindings)
        shared = [r for r in getter.elf['relocations'] if r['symbol'] == contract['bindings']['wram']['symbol']]
        assert len(shared) == (1 if row['role'].endswith('getter') else 0)
        candidate_reads.append({'role':role,'actual_input_sha256':_sha(actual_input.read_bytes()),'map_input':role+'.o:(.text)',
                             'map_row':map_line,'map_vma':map_vma,'map_lma':map_lma,'map_bytes':map_size,'function':function,
                             'stored_image_offset':position,'linked_bytes_sha256':_sha(linked),
                             'linked_wram_word':struct.unpack_from('<I',linked,shared[0]['offset'])[0] if shared else None})
    mismatches = [i for i,(actual,wanted) in enumerate(zip(image,original['image'],strict=True)) if actual != wanted]
    if require_original and mismatches:
        raise ValueError(f'original image mismatch at stored offsets {mismatches}')
    return {'linked_elf_sha256':_sha(data),'elf_header':header,'sections':allocated,'segments':segments,
            'bindings':asdict(bindings),'observed_bindings':observed_bindings,'candidates':candidate_reads,
            'image_bytes':len(image),'image_sha256':_sha(image),'image_mismatch_offsets':mismatches,
            'BSS_bytes':bss_bytes,'noncandidate_bytes_unchanged':True,'linked_relocation_sections':0}



def _produce_cluster(candidates,bindings,originals,contract,recipe,output):
    assert [c.row for c in candidates] == contract['candidates']
    assert tuple(c.row['role'] for c in candidates) == ('lower_store','upper_store','lower_getter','upper_getter')
    for candidate in candidates:
        assert _sha(candidate.object_path.read_bytes()) == candidate.row['object_sha256']
    output.mkdir();records=[]
    for index,original in enumerate(originals):
        layout=original['layout'];image=original['image'];region=layout['regions'][1]
        a0_start=region['stored_extent']['start'];a0_end=region['stored_extent']['end']
        hole_start=candidates[0].row['vma']-region['runtime_base']
        hole_end=candidates[-1].row['vma']+candidates[-1].row['bytes']-region['runtime_base']
        assert 0<=hole_start<hole_end<=a0_end-a0_start
        folder=output/f'program-{index}';folder.mkdir()
        parts={'startup':image[layout['regions'][0]['stored_extent']['start']:layout['regions'][0]['stored_extent']['end']],
               'table':image[layout['table_extent']['start']:layout['table_extent']['end']],
               'autoload1':image[layout['regions'][2]['stored_extent']['start']:layout['regions'][2]['stored_extent']['end']],
               'prefix':image[a0_start:a0_start+hole_start],'suffix':image[a0_start+hole_end:a0_end]}
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
        for candidate in candidates:
            assert _sha(candidate.object_path.read_bytes())==candidate.row['object_sha256']
            (folder/(candidate.row['role']+'.o')).write_bytes(candidate.object_path.read_bytes())
        input_names=['startup.o','table.o','autoload1.o','prefix.o']+[c.row['role']+'.o'for c in candidates]+['suffix.o','bss0.o']
        input_pins={name:_sha((folder/name).read_bytes())for name in input_names}
        record={'identity':layout['identity'],'opaque_ranges':{'prefix_bytes':hole_start,'candidate_bytes':hole_end-hole_start,'suffix_bytes':a0_end-a0_start-hole_end},
                'input_sha256':input_pins,'opaque_parts_sha256':{name:_sha(data)for name,data in parts.items()},'assembly_commands':commands,'omitted':{}}
        for trial,values in[('positive',bindings),('wrong_shared_wram',replace(bindings,wram=bindings.wram+4))]:
            script=_build_script(layout,contract,values);(folder/(trial+'.ld')).write_text(script)
            argv=[recipe['lld'],'-m','armelf','--nmagic','-T',trial+'.ld','-Map',trial+'.map','-o',trial+'.elf',*input_names]
            assert all(_sha((folder/name).read_bytes())==pin for name,pin in input_pins.items())
            linked=_run(argv,folder,trial+'-command.json');assert linked['returncode']==0,linked['stderr']
            readback=_read_native(folder/(trial+'.elf'),folder/(trial+'.map'),candidates,original,contract,values,trial=='positive')
            readback.update({'native_command':linked,'actual_inputs_sha256':input_pins,'map_sha256':_sha((folder/(trial+'.map')).read_bytes()),'linker_script':script,'linker_script_sha256':_sha(script.encode())})
            if trial!='positive':
                changed=[]
                for candidate in candidates:
                    before=_diagnostic_bytes(candidate,contract,bindings);after=_diagnostic_bytes(candidate,contract,values)
                    position=a0_start+candidate.row['vma']-region['runtime_base']
                    changed += [position+i for i,(a,b)in enumerate(zip(before,after,strict=True))if a!=b]
                assert readback['image_mismatch_offsets']==changed
                readback['derived_mismatch_offsets']=changed
                try:_read_native(folder/(trial+'.elf'),folder/(trial+'.map'),candidates,original,contract,values)
                except ValueError as error:readback['strict_rejection']=str(error)
                else:raise AssertionError('wrong shared binding accepted')
            record[trial]=readback
        for candidate in candidates:
            role=candidate.row['role'];trial='omitted_'+role
            script=_build_script(layout,contract,bindings);(folder/(trial+'.ld')).write_text(script)
            selected=[name for name in input_names if name!=role+'.o']
            argv=[recipe['lld'],'-m','armelf','--nmagic','-T',trial+'.ld','-Map',trial+'.map','-o',trial+'.elf',*selected]
            linked=_run(argv,folder,trial+'-command.json');assert linked['returncode']!=0,trial+' unexpectedly linked'
            linked.update({'input_sha256':{name:input_pins[name]for name in selected},'linker_script_sha256':_sha(script.encode())})
            record['omitted'][role]=linked
        trial='swapped_stores';script=_build_script(layout,contract,bindings,True);(folder/(trial+'.ld')).write_text(script)
        argv=[recipe['lld'],'-m','armelf','--nmagic','-T',trial+'.ld','-Map',trial+'.map','-o',trial+'.elf',*input_names]
        swapped=_run(argv,folder,trial+'-command.json');assert swapped['returncode']==0,swapped['stderr']
        try:_read_native(folder/(trial+'.elf'),folder/(trial+'.map'),candidates,original,contract,bindings)
        except AssertionError as error:
            _,_,_,symbols=_parse_elf(folder/(trial+'.elf'))
            record['swapped_stores']={'native_command':swapped,'actual_inputs_sha256':input_pins,'strict_role_rejection':str(error),
                                      'actual_store_functions':[s for s in symbols if s['name']in(candidates[0].row['function'],candidates[1].row['function'])],
                                      'map_sha256':_sha((folder/(trial+'.map')).read_bytes()),'linked_elf_sha256':_sha((folder/(trial+'.elf')).read_bytes()),'linker_script':script}
        else:raise AssertionError('equal-sized store swap accepted')
        malformed=bytearray((folder/'positive.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
        offset=struct.unpack_from('<I',malformed,phoff+4)[0];struct.pack_into('<I',malformed,phoff+4,offset+4)
        (folder/'malformed-load.elf').write_bytes(malformed)
        try:_read_native(folder/'malformed-load.elf',folder/'positive.map',candidates,original,contract,bindings)
        except AssertionError:record['malformed_load']={'rejected':True,'old_offset':offset,'wrong_offset':offset+4,'elf_sha256':_sha(malformed)}
        else:raise AssertionError('malformed load accepted')
        assert all(_sha((folder/name).read_bytes())==pin for name,pin in input_pins.items())
        records.append(record)
    assert all(_sha(c.object_path.read_bytes())==c.row['object_sha256']for c in candidates)
    return records
