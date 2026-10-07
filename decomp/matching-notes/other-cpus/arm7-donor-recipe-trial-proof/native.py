"""Finite actual-MW-object native relocation proof; all binary outputs private."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess

HERE = Path(__file__).resolve().parent
CLANG = '/opt/homebrew/opt/llvm/bin/clang'
LLD = '/opt/homebrew/bin/ld.lld'
IMAGE_SHA = '0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
TOOLS = {CLANG:'d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5',
         LLD:'3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54'}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def split_autoload0(original):
    assert len(original)==66120
    return original[:20268],original[20268:20356],original[20356:]


def build_link_script(layout, binding):
    lines = [f"ARM7_HEADER_ENTRY = {layout['entry']};",'ENTRY(ARM7_HEADER_ENTRY)','PHDRS {']
    lines += [f"p{i} PT_LOAD FLAGS({segment['flags']});" for i,segment in enumerate(layout['segments'])]
    lines += ['}',f'hyp_subpriv_arena_lo = 0x{binding:08x};','hyp_wram_arena_lo = 0x0380bc90;','SECTIONS {']
    for i,segment in enumerate(layout['segments']):
        name=segment['section']
        if name=='.arm7.autoload0':
            selector='prefix.o(.arm7.autoload0.prefix) __candidate_start = .; compiled.o(.text) __candidate_end = .; suffix.o(.arm7.autoload0.suffix)'
        else:
            obj='bss0.o' if name=='.arm7.bss.autoload0' else ('autoload1.o' if 'autoload1' in name else name.removeprefix('.arm7.')+'.o')
            selector=f'{obj}({name})'
        noload='(NOLOAD)' if not segment['file_bytes'] else ''
        lines.append(f"{name} {segment['vma']} {noload} : AT({segment['lma']}) {{ {selector} }} :p{i}")
        lines.append(f'ASSERT(SIZEOF({name}) == {segment["memory_bytes"]}, "size")')
    lines += ['}', 'ASSERT(__candidate_start == 0x037fcf2c, "candidate start")',
              'ASSERT(__candidate_end == 0x037fcf84, "candidate end")',
              'ASSERT(__candidate_end - __candidate_start == 88, "candidate size")']
    return '\n'.join(lines)+'\n'


def parse_elf(path: Path) -> tuple[dict, list[dict], list[dict], list[dict]]:
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


def verify_elf(path, original, layout, require_original=True):
    data=path.read_bytes()
    header,sections,segments,symbols=parse_elf(path)
    assert header['entry']==layout['entry'] and len(segments)==6
    allocated=[s for s in sections if s['flags']&2 and s['size']]
    assert len(allocated)==6
    by_name={s['name']:s for s in allocated}
    expected_names=[s['section'] for s in layout['segments']]
    assert set(by_name)==set(expected_names)
    for segment,expected in zip(segments,layout['segments'],strict=True):
        assert segment['type']==1 and segment['align']==4
        for name in ('vma','lma','file_bytes','memory_bytes','flags'):
            assert segment[name]==expected[name],(name,segment,expected)
        assert segment['vma']%4==segment['offset']%4
        section=by_name[expected['section']]
        assert section['vma']==expected['vma'] and section['size']==expected['memory_bytes']
        assert section['type']==(1 if expected['file_bytes'] else 8) and section['align']==4
        expected_flags=6 if expected['section']=='.arm7.autoload0' else (2 if expected['file_bytes'] else 3)
        assert section['flags']==expected_flags
        if segment['file_bytes']:
            assert segment['offset']==section['offset']
            assert segment['offset']+segment['file_bytes']<=len(data)
            assert data[segment['offset']:segment['offset']+segment['file_bytes']]==data[section['offset']:section['offset']+section['size']]
    named_segments=dict(zip(expected_names,segments,strict=True))
    image=b''.join(data[named_segments['.arm7.'+name]['offset']:named_segments['.arm7.'+name]['offset']+named_segments['.arm7.'+name]['file_bytes']]
                   for name in ('startup','autoload0','autoload1','table'))
    assert len(image)==len(original)==165552
    mismatches=[i for i,(actual,wanted) in enumerate(zip(image,original,strict=True)) if actual!=wanted]
    if require_original and mismatches:
        raise ValueError(f'original image mismatch at stored offsets {mismatches}')
    assert image[:20700]==original[:20700] and image[20788:]==original[20788:]
    assert sum(s['memory_bytes'] for s in segments if not s['file_bytes'])==21424
    assert not any(s['type'] in (4,9) and s['size'] for s in sections)
    wanted={'arm7_low_getter_trial':(0x037fcf2c,88),'__candidate_start':(0x037fcf2c,0),
            '__candidate_end':(0x037fcf84,0),'hyp_wram_arena_lo':(0x0380bc90,0)}
    for name,(address,size) in wanted.items():
        symbol,=[s for s in symbols if s['name']==name]
        assert symbol['vma']==address and symbol['size']==size
    trial_symbols=[s for s in symbols if s['name'] in (*wanted,'hyp_subpriv_arena_lo')]
    return {'linked_elf_sha256':digest(data),'elf_header':header,'sections':allocated,'segments':segments,
        'candidate_and_binding_symbols':trial_symbols,'image_bytes':len(image),'image_sha256':digest(image),
        'image_mismatch_offsets':mismatches,'exact_original_ELF_only':not mismatches,'BSS_bytes':21424,
        'noncandidate_bytes_unchanged':True,'linked_relocation_sections':0,
        'linked_candidate_sha256':digest(image[20700:20788]),
        'linked_literal_words':[f'0x{word:08x}' for word in struct.unpack_from('<II',image,20780)]}


def run_command(argv,directory,filename):
    result=subprocess.run(argv,cwd=directory,capture_output=True,text=True)
    (directory/filename).write_text(json.dumps({'argv':argv,'returncode':result.returncode},indent=2)+'\nSTDOUT\n'+result.stdout+'\nSTDERR\n'+result.stderr)
    assert result.returncode==0,result.stderr
    return {'argv':argv,'returncode':result.returncode,'stdout':result.stdout,'stderr':result.stderr,
            'log_sha256':digest((directory/filename).read_bytes())}


def run_native(output,object_path,wrong_object_path):
    output.mkdir()
    for tool,pin in TOOLS.items():
        assert digest(Path(tool).read_bytes())==pin
    object_bytes=object_path.read_bytes();wrong_bytes=wrong_object_path.read_bytes()
    assert digest(object_bytes)=='9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b'
    assert digest(wrong_bytes)=='a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20'
    rom_path=Path('/Users/djdjo/Documents/mine/rom/jus.nds');rom=rom_path.read_bytes()
    assert digest(rom)=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
    layout_path=Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
    layout_bytes=layout_path.read_bytes()
    assert digest(layout_bytes)=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
    checked=json.loads(layout_bytes);layout=json.loads((HERE/'native-layout.json').read_text())
    assert layout['image_sha256']==IMAGE_SHA and layout['image_bytes']==165552
    fat=struct.unpack_from('<I',rom,0x48)[0];start,end=struct.unpack_from('<II',rom,fat+79*8)
    result={'status':'actual_MW_RELA_native_exact_original_images','source_credit_bytes':0,'tool_sha256':TOOLS,
            'actual_object_sha256':digest(object_bytes),'wrong_original_object_sha256':digest(wrong_bytes),'programs':[]}
    for index,(program,check) in enumerate(zip((rom,rom[start:end]),checked,strict=True)):
        assert digest(program)==check['identity']['program_sha256']
        offset,entry,base,size=struct.unpack_from('<IIII',program,0x30)
        assert [offset,entry,base,size]==[check[key] for key in ('image_offset','entry','base','image_bytes')]
        image=program[offset:offset+size];assert digest(image)==IMAGE_SHA
        assert layout['entry']==entry
        for segment in layout['segments']:
            name=segment['section']
            if name=='.arm7.startup': assert segment['vma']==base and segment['file_bytes']==432
            elif name=='.arm7.table': assert segment['vma']==base+165528 and segment['file_bytes']==24
            else:
                region=check['regions'][2 if 'autoload1' in name else 1]
                initialized=region['stored_extent']['end']-region['stored_extent']['start']
                if '.bss.' in name:
                    assert segment['vma']==region['runtime_base']+initialized and segment['file_bytes']==0 and segment['memory_bytes']==region['bss_bytes']
                else:
                    assert segment['vma']==region['runtime_base'] and segment['lma']==base+region['stored_extent']['start'] and segment['file_bytes']==initialized
        folder=output/f'program-{index}';folder.mkdir()
        prefix,candidate,suffix=split_autoload0(image[432:66552])
        assert digest(candidate)=='3e92f8f0b8ebb25e84dbe31ad77910309085d7d1def7e4a5821cbf196f62b9c2'
        parts={'startup':image[:432],'table':image[165528:],'autoload1':image[66552:165528],'prefix':prefix,'suffix':suffix}
        assembly_commands=[]
        for name,payload in parts.items():
            (folder/(name+'.bin')).write_bytes(payload)
            section='.arm7.autoload0.'+name if name in ('prefix','suffix') else '.arm7.'+name
            asm=f'.cpu arm7tdmi\n.section {section},"a",%progbits\n.balign 4\n.incbin "{name}.bin"\n'
            if name=='autoload1': asm+='.section .arm7.bss.autoload1,"aw",%nobits\n.balign 4\n.space 6504\n'
            (folder/(name+'.s')).write_text(asm)
            assembly_commands.append(run_command([CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c',name+'.s','-o',name+'.o'],folder,'clang-'+name+'.log'))
        (folder/'bss0.s').write_text('.cpu arm7tdmi\n.section .arm7.bss.autoload0,"aw",%nobits\n.balign 4\n.space 14920\n')
        assembly_commands.append(run_command([CLANG,'--target=arm-none-eabi','-mcpu=arm7tdmi','-c','bss0.s','-o','bss0.o'],folder,'clang-bss0.log'))
        opaque={name:digest((folder/name).read_bytes()) for name in ('startup.o','table.o','autoload1.o','prefix.o','suffix.o','bss0.o')}
        entry_record={'identity':check['identity'],'opaque_objects_sha256':opaque,'opaque_parts_sha256':{name:digest(payload) for name,payload in parts.items()},'assembly_commands':assembly_commands}
        for trial,binding,actual_object in [('positive',0x027f9c08,object_bytes),('wrong_binding',0x027fafcc,object_bytes),('wrong_object',0x027f9c08,wrong_bytes)]:
            (folder/'compiled.o').write_bytes(actual_object)
            script=build_link_script(layout,binding);(folder/'physical.ld').write_text(script)
            argv=[LLD,'-m','armelf','--nmagic','-T','physical.ld','-Map',trial+'.map','-o',trial+'.elf','startup.o','table.o','autoload1.o','prefix.o','compiled.o','suffix.o','bss0.o']
            linked=run_command(argv,folder,'lld-'+trial+'.log')
            readback=verify_elf(folder/(trial+'.elf'),image,layout,trial=='positive')
            assert f'compiled.o:(.text)' in (folder/(trial+'.map')).read_text()
            record={'actual_object_sha256':digest(actual_object),'binding':binding,'native_command':linked,
                    'linker_script_sha256':digest(script.encode()),'linker_script':script,
                    'map_sha256':digest((folder/(trial+'.map')).read_bytes()),'readback':readback,
                    'image_mismatch_offsets':readback['image_mismatch_offsets']}
            if trial!='positive':
                expected=[20780,20781] if trial=='wrong_binding' else list(range(20752,20760))
                assert readback['image_mismatch_offsets']==expected
                try: verify_elf(folder/(trial+'.elf'),image,layout)
                except ValueError as error: record['original_comparison_rejection']=str(error)
                else: raise AssertionError('negative native output accepted as original')
            entry_record[trial]=record
        malformed=bytearray((folder/'positive.elf').read_bytes());phoff=struct.unpack_from('<I',malformed,28)[0]
        old_offset=struct.unpack_from('<I',malformed,phoff+4)[0];struct.pack_into('<I',malformed,phoff+4,old_offset+4)
        (folder/'malformed-load.elf').write_bytes(malformed)
        try: verify_elf(folder/'malformed-load.elf',image,layout)
        except AssertionError: entry_record['malformed_load_offset_rejected']=True
        else: raise AssertionError('malformed load offset accepted')
        entry_record['malformed_elf_sha256']=digest(malformed)
        assert all(digest((folder/name).read_bytes())==pin for name,pin in opaque.items())
        result['programs'].append(entry_record)
    assert object_path.read_bytes()==object_bytes and wrong_object_path.read_bytes()==wrong_bytes
    assert rom_path.read_bytes()==rom and layout_path.read_bytes()==layout_bytes
    assert all(digest(Path(tool).read_bytes())==pin for tool,pin in TOOLS.items())
    result['inputs_unchanged']=True
    (output/'native-proof.json').write_text(json.dumps(result,indent=2)+'\n')
    return result
