"""Read the fixed caller continuation and epilogue in two original ARM7 images.

Usage: python3 read_original.py OUTPUT_DIRECTORY
No ROM or extracted binary file is written.
"""
import hashlib
import json
import struct
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
OUT = Path(sys.argv[1]).resolve()
OUT.mkdir(exist_ok=True)
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT = HERE.parent / 'arm7-checked-layouts.json'
LLVM = '/opt/homebrew/opt/llvm/bin/llvm-mc'
LLVM_SHA = '76de9d4a660f3e1f6dc8175c5d443197f953eaa4df2871406a19d789b1a34ba0'
SPANS = [(0x037fd070, 0x037fd0c0), (0x037fd0c0, 0x037fd0cc)]
WORDS = [
    (0xe3a00007, 0xebffffc2, 0xe1a01000, 0xe3a00007, 0xebffffa4,
     0xe3a00007, 0xebffffa7, 0xe1a01000, 0xe3a00007, 0xebffff9a,
     0xe3a00008, 0xebffffb8, 0xe1a01000, 0xe3a00008, 0xebffff9a,
     0xe3a00008, 0xebffff9d, 0xe1a01000, 0xe3a00008, 0xebffff90),
    (0xe28dd004, 0xe8bd4000, 0xe12fff1e),
]
DIGESTS = [
    '2682fcfd18c0bdc36ed6547ad546bef1d300ab2a3eea24c1e3c1a2ca7dde3f33',
    '97e49fab5b2490c4b4977ff23d65446f267880f107a387035c5cf63b97d1d2ad',
]


def sha(data):
    return hashlib.sha256(data).hexdigest()


data = ROM.read_bytes()
assert sha(data) == 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
layout_bytes = LAYOUT.read_bytes()
assert sha(layout_bytes) == '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
assert sha(Path(LLVM).read_bytes()) == LLVM_SHA
layouts = json.loads(layout_bytes)
fnt, _, fat, fat_size = struct.unpack_from('<IIII', data, 0x40)


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
records = []
llvm_payloads = {}
for layout, program in zip(layouts, (data, data[child_start:child_end]), strict=True):
    assert sha(program) == layout['identity']['program_sha256']
    image_offset, entry, base, size = struct.unpack_from('<IIII', program, 0x30)
    assert [image_offset, entry, base, size] == [layout[key] for key in ('image_offset', 'entry', 'base', 'image_bytes')]
    image = program[image_offset:image_offset + size]
    assert sha(image) == layout['image_sha256']
    table_start, table_end, initialized_start = struct.unpack_from('<III', image, 0x198)
    assert table_start - base == layout['table_extent']['start']
    assert table_end - base == layout['table_extent']['end']
    assert sha(image[table_start - base:table_end - base]) == layout['table_sha256']
    runtime, initialized_size, bss_size = struct.unpack_from('<III', image, table_start - base)
    stored = initialized_start - base
    region = layout['regions'][1]
    assert region['kind'] == {'autoload': 0} and region['runtime_base'] == runtime
    assert region['bss_bytes'] == bss_size
    assert region['stored_extent'] == {'start': stored, 'end': stored + initialized_size}
    assert sha(image[stored:stored + initialized_size]) == region['sha256']
    selections = []
    for index, (start, end) in enumerate(SPANS):
        assert runtime <= start < end <= runtime + initialized_size
        offset = stored + start - runtime
        payload = image[offset:offset + end - start]
        assert struct.unpack('<' + 'I' * (len(payload) // 4), payload) == WORDS[index]
        assert sha(payload) == DIGESTS[index]
        row = {'start': start, 'end': end, 'stored_image_offset': offset,
               'program_offset': image_offset + offset, 'sha256': sha(payload),
               'words': [f'0x{word:08x}' for word in WORDS[index]]}
        if index == 0:
            calls = []
            for word_index, word in enumerate(WORDS[index]):
                if (word >> 24) & 0xf != 0xb:
                    continue
                immediate = word & 0xffffff
                signed = immediate - (1 << 24) if immediate & (1 << 23) else immediate
                address = start + word_index * 4
                calls.append({'source': address, 'imm24': immediate,
                              'signed_displacement': signed * 4, 'pc_bias': 8,
                              'target': address + 8 + signed * 4,
                              'continuation': address + 4})
            assert [(call['source'], call['target']) for call in calls] == [
                (0x037fd074, 0x037fcf84), (0x037fd080, 0x037fcf18),
                (0x037fd088, 0x037fcf2c), (0x037fd094, 0x037fcf04),
                (0x037fd09c, 0x037fcf84), (0x037fd0a8, 0x037fcf18),
                (0x037fd0b0, 0x037fcf2c), (0x037fd0bc, 0x037fcf04),
            ]
            row['raw_calls'] = calls
        selections.append(row)
        if index in llvm_payloads:
            assert llvm_payloads[index] == payload
        else:
            llvm_payloads[index] = payload
    literal_address = 0x037fd034 + 8 + 0x90
    assert literal_address == SPANS[1][1] == 0x037fd0cc
    literal_offset = stored + literal_address - runtime
    literal_word = struct.unpack_from('<I', image, literal_offset)[0]
    assert literal_word == 0x03808430
    records.append({'identity': layout['identity'], 'image_sha256': sha(image),
                    'image_bytes': len(image), 'autoload0': {'runtime': runtime,
                    'initialized_bytes': initialized_size, 'bss_bytes': bss_size, 'stored_start': stored},
                    'selections': selections,
                    'excluded_literal': {'address': literal_address,
                        'stored_image_offset': literal_offset, 'word': literal_word,
                        'selected_as_instruction': False}})
llvm_runs = []
for index, payload in llvm_payloads.items():
    argv = [LLVM, '--disassemble', '--triple=armv4t-none-eabi']
    result = subprocess.run(argv, input=' '.join(f'0x{byte:02x}' for byte in payload) + '\n',
                            capture_output=True, text=True, check=True)
    assert result.stderr == ''
    assert len([line for line in result.stdout.splitlines() if line.strip()]) == len(WORDS[index])
    filename = ['llvm-continuation.txt', 'llvm-epilogue.txt'][index]
    (OUT / filename).write_text(result.stdout)
    llvm_runs.append({'extent': {'start': SPANS[index][0], 'end': SPANS[index][1]},
                      'argv': argv, 'stdout_file': filename, 'stdout_sha256': sha(result.stdout.encode())})
assert ROM.read_bytes() == data and LAYOUT.read_bytes() == layout_bytes
assert sha(Path(LLVM).read_bytes()) == LLVM_SHA
(OUT / 'original-read.json').write_text(json.dumps({'status': 'passed',
    'rom_sha256': sha(data), 'layout_sha256': sha(layout_bytes), 'llvm_tool_sha256': LLVM_SHA,
    'child_path': 'ChildRom/JSS2Child.srl', 'child_file_id': file_id,
    'child_rom_extent': {'start': child_start, 'end': child_end},
    'programs': records, 'llvm_runs': llvm_runs, 'inputs_unchanged': True,
    'source_credit_bytes': 0, 'original_names_established': False}, indent=2) + '\n')
print('Both original identities, bounded words, eight raw BL targets, excluded literal, and LLVM pass.')
