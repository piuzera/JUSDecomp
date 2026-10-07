"""Read the selected prefix directly from the pinned original NDS.

No extracted ROM or binary file is written. LLVM receives only the selected
24 bytes through stdin, and the outputs contain metadata and disassembly.
"""
import hashlib
import json
import struct
import subprocess
from pathlib import Path

PROOF = Path(__file__).resolve().parent
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT = Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
LLVM = '/opt/homebrew/opt/llvm/bin/llvm-mc'
START, END = 0x037fd02c, 0x037fd044


def sha(data):
    return hashlib.sha256(data).hexdigest()


def u32(data, offset):
    return struct.unpack_from('<I', data, offset)[0]


data = ROM.read_bytes()
assert sha(data) == 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
layout_bytes = LAYOUT.read_bytes()
assert sha(layout_bytes) == '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
layouts = json.loads(layout_bytes)
fnt, fnt_size, fat, fat_size = struct.unpack_from('<IIII', data, 0x40)


def named_entry(directory, wanted):
    offset, file_id, _ = struct.unpack_from('<IHH', data, fnt + (directory & 0xfff) * 8)
    cursor = fnt + offset
    while data[cursor]:
        length = data[cursor]
        cursor += 1
        name = data[cursor:cursor + (length & 0x7f)].decode('ascii')
        cursor += length & 0x7f
        if length & 0x80:
            identifier = struct.unpack_from('<H', data, cursor)[0]
            cursor += 2
            kind = 'directory'
        else:
            identifier = file_id
            file_id += 1
            kind = 'file'
        if name == wanted:
            return kind, identifier
    raise AssertionError(wanted)


kind, directory = named_entry(0xf000, 'ChildRom')
assert kind == 'directory'
kind, file_id = named_entry(directory, 'JSS2Child.srl')
assert kind == 'file' and file_id == 79 and (file_id + 1) * 8 <= fat_size
child_start, child_end = struct.unpack_from('<II', data, fat + file_id * 8)
programs = [data, data[child_start:child_end]]
readback = []
llvm_input = None
for layout, program in zip(layouts, programs, strict=True):
    assert sha(program) == layout['identity']['program_sha256']
    image_offset, entry, base, image_size = struct.unpack_from('<IIII', program, 0x30)
    assert [image_offset, entry, base, image_size] == [
        layout['image_offset'], layout['entry'], layout['base'], layout['image_bytes']]
    image = program[image_offset:image_offset + image_size]
    assert len(image) == image_size and sha(image) == layout['image_sha256']
    table_start, table_end, initialized_start = struct.unpack_from('<III', image, 0x198)
    assert table_start - base == layout['table_extent']['start']
    assert table_end - base == layout['table_extent']['end']
    assert sha(image[table_start - base:table_end - base]) == layout['table_sha256']
    runtime_base, initialized_size, bss_size = struct.unpack_from('<III', image, table_start - base)
    stored_start = initialized_start - base
    region = layout['regions'][1]
    assert region['kind'] == {'autoload': 0}
    assert runtime_base == region['runtime_base'] and bss_size == region['bss_bytes']
    assert stored_start == region['stored_extent']['start']
    assert stored_start + initialized_size == region['stored_extent']['end']
    assert runtime_base <= START < END <= runtime_base + initialized_size
    stored_prefix = stored_start + START - runtime_base
    selected = image[stored_prefix:stored_prefix + END - START]
    words = struct.unpack('<6I', selected)
    assert sha(selected) == 'cc0404050002c6ff8309766ef0431c16eabaeb11f1407ee6fdff635cbb08e871'
    assert words == (0xe92d4000, 0xe24dd004, 0xe59f1090, 0xe5910000, 0xe3500000, 0x1a00001e)
    branch = words[-1]
    assert branch >> 28 == 1 and (branch >> 25) & 7 == 5 and not branch & (1 << 24)
    immediate = branch & 0xffffff
    signed = immediate - (1 << 24) if immediate & (1 << 23) else immediate
    branch_target = START + 20 + 8 + signed * 4
    assert branch_target == 0x037fd0c0
    readback.append({
        'identity': layout['identity'], 'image_offset': image_offset,
        'entry': entry, 'image_base': base, 'image_size': image_size,
        'image_sha256': sha(image), 'autoload0': {
            'runtime_base': runtime_base, 'initialized_size': initialized_size,
            'bss_size': bss_size, 'stored_start': stored_start},
        'prefix': {'start': START, 'end': END, 'stored_image_offset': stored_prefix,
                   'program_offset': image_offset + stored_prefix,
                   'original_rom_offset': image_offset + stored_prefix +
                   (0 if layout['identity']['program']['kind'] == 'parent' else child_start),
                   'sha256': sha(selected), 'words': [f'0x{word:08x}' for word in words]},
        'raw_branch': {'source': START + 20, 'condition': 'ne', 'imm24': immediate,
                       'signed_displacement': signed * 4, 'pc_bias': 8,
                       'target': branch_target, 'not_taken_target': END},
        'literal_address_only': START + 8 + 8 + 0x90,
    })
    text = ' '.join(f'0x{byte:02x}' for byte in selected) + '\n'
    if llvm_input is None:
        llvm_input = text
    else:
        assert text == llvm_input

argv = [LLVM, '--disassemble', '--triple=armv4t-none-eabi']
result = subprocess.run(argv, input=llvm_input, text=True, capture_output=True, check=True)
assert result.stderr == ''
lines = [line.strip() for line in result.stdout.splitlines() if line.strip() and line.strip() != '.text']
assert len(lines) == 6
assert sha(ROM.read_bytes()) == sha(data) and LAYOUT.read_bytes() == layout_bytes
(PROOF / 'llvm-decode.txt').write_text(result.stdout)
(PROOF / 'original-read.json').write_text(json.dumps({
    'status': 'passed', 'rom_sha256': sha(data), 'layout_sha256': sha(layout_bytes),
    'fnt_offset': fnt, 'fnt_size': fnt_size, 'fat_offset': fat, 'fat_size': fat_size,
    'child_path': 'ChildRom/JSS2Child.srl', 'child_file_id': file_id,
    'child_rom_extent': {'start': child_start, 'end': child_end},
    'programs': readback, 'llvm_argv': argv, 'llvm_stdout_sha256': sha(result.stdout.encode()),
    'llvm_stderr': result.stderr, 'inputs_unchanged': True,
}, indent=2) + '\n')
print(result.stdout, end='')
print('Original parent and FAT 79 child prefix checks passed.')
