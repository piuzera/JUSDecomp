import hashlib
import json
import struct
from pathlib import Path

H = lambda b: hashlib.sha256(b).hexdigest()
scratch = Path(__file__).resolve().parent
source = scratch / 'low_getter_trial.c'
obj = scratch / 'compiled.o'
worker = Path('/private/tmp/jus-arm7-low-getter-worker-proof')
rom_path = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
layout_path = Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
compiler = Path('/private/tmp/jus-track-a/tools/mwccarm/2.0/base/mwccarm.exe')
runner = Path('/private/tmp/jus-track-a/tools/wibo/wibo-macos')
expected = {
    str(source): 'fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537',
    str(worker / 'low_getter_trial.c'): 'fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537',
    str(obj): 'a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20',
    str(worker / 'compiled.o'): 'a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20',
    str(rom_path): 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27',
    str(layout_path): '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc',
    str(compiler): '7150fa4fe4cb6db6867ac530ec1a0754f6ca4df92868d963a7875196f9222880',
    str(runner): '2b3000ef6a7a490c24ccd71967735ae0005e218922e51806cca1b8d77fd3cf7c',
}
for name, digest in expected.items():
    assert H(Path(name).read_bytes()) == digest, name

elf = obj.read_bytes()
assert elf[:16] == b'\x7fELF\x01\x01\x01' + bytes(9)
assert struct.unpack_from('<HHI', elf, 16) == (1, 40, 1)
shoff = struct.unpack_from('<I', elf, 32)[0]
shentsize, shnum, shstrindex = struct.unpack_from('<HHH', elf, 46)
sections = [struct.unpack_from('<IIIIIIIIII', elf, shoff + i*shentsize) for i in range(shnum)]
def payload(section):
    return elf[section[4]:section[4]+section[5]]
names = payload(sections[shstrindex])
def cstring(blob, offset):
    return blob[offset:blob.index(b'\0', offset)].decode()
section_by_name = {cstring(names, section[0]): (i, section) for i, section in enumerate(sections)}
text_index, text_section = section_by_name['.text']
assert text_section[1] == 1 and text_section[2] == 6 and text_section[5] == 88 and text_section[8] == 4
text = payload(text_section)
assert struct.unpack_from('<II', text, 80) == (0, 0)
sym_index, sym_section = section_by_name['.symtab']
symbols = []
strtab = payload(sections[sym_section[6]])
for at in range(0, sym_section[5], 16):
    name, value, size, info, other, shndx = struct.unpack_from('<IIIBBH', elf, sym_section[4]+at)
    symbols.append(dict(name=cstring(strtab, name), value=value, size=size, binding=info>>4, type=info&15, section=shndx))
assert [(s['name'],s['value'],s['binding'],s['section']) for s in symbols[1:]] == [
    ('$a',0,0,text_index),('$d',80,0,text_index),('arm7_low_getter_trial',0,1,text_index),
    ('hyp_subpriv_arena_lo',0,1,0),('hyp_wram_arena_lo',0,1,0)]
assert symbols[3]['size'] == 88
_, rela_section = section_by_name['.rela.text']
assert rela_section[1] == 4 and rela_section[5] == 24 and rela_section[6] == sym_index and rela_section[7] == text_index
relocations = []
for at in range(0, 24, 12):
    offset, info, addend = struct.unpack_from('<IIi', elf, rela_section[4]+at)
    relocations.append(dict(offset=offset, type=info&255, symbol=symbols[info>>8]['name'], addend=addend))
assert relocations == [
    {'offset':80,'type':2,'symbol':'hyp_subpriv_arena_lo','addend':0},
    {'offset':84,'type':2,'symbol':'hyp_wram_arena_lo','addend':0}]

rom = rom_path.read_bytes()
layouts = json.loads(layout_path.read_text())
fat, fat_size = struct.unpack_from('<II', rom, 0x48)
assert fat_size >= 80*8
child_start, child_end = struct.unpack_from('<II', rom, fat+79*8)
programs = [rom, rom[child_start:child_end]]
start, end = 0x037fcf2c, 0x037fcf84
matches = []
for program, layout in zip(programs, layouts, strict=True):
    assert H(program) == layout['identity']['program_sha256']
    image_offset, entry, base, image_bytes = struct.unpack_from('<IIII', program, 0x30)
    assert (image_offset,entry,base,image_bytes) == tuple(layout[x] for x in ('image_offset','entry','base','image_bytes'))
    image = program[image_offset:image_offset+image_bytes]
    assert H(image) == layout['image_sha256']
    region = layout['regions'][1]
    assert region['kind'] == {'autoload':0}
    runtime = region['runtime_base']
    stored = region['stored_extent']['start']
    assert runtime <= start < end <= runtime + region['stored_extent']['end'] - stored
    original = image[stored+start-runtime:stored+end-runtime]
    assert len(original) == 88
    diffs = [i for i in range(20) if original[4*i:4*i+4] != text[4*i:4*i+4]]
    assert diffs == [13,14], diffs
    assert struct.unpack_from('<II', original, 52) == (0xe3a0050e,0xe59f1014)
    assert struct.unpack_from('<II', text, 52) == (0xe59f1018,0xe3a0050e)
    assert struct.unpack_from('<II', original, 80) == (0x027f9c08,0x0380bc90)
    matches.append({'program_sha256':H(program),'original_sha256':H(original),
                    'instruction_word_differences':diffs,'original_pool_words':['0x027f9c08','0x0380bc90']})
assert matches[0]['original_sha256'] == matches[1]['original_sha256']
for name, digest in expected.items():
    assert H(Path(name).read_bytes()) == digest, f'changed: {name}'
receipt = {'status':'mismatch_confirmed','frozen_inputs_sha256':expected,
           'object_text_bytes':len(text),'mapping_symbols':symbols[1:3],
           'relocations':relocations,'programs':matches,
           'source_credit_bytes':0,'original_function_extent_proven':False,
           'original_symbol_names_established':False,'native_link_attempted':False}
(scratch/'independent-review.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Independent object, relocation, mapped ROM, and input stability checks passed; exact match rejected at words 13–14.')
