"""Ground two explicit ARM spans and one initialized literal in the original NDS.

No ROM or extracted binary is written. BSS has no stored-byte accessor here.
"""
import hashlib
import json
import struct
import subprocess
import sys
from pathlib import Path

PROOF = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path(__file__).resolve().parent
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT = Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
LLVM = '/opt/homebrew/opt/llvm/bin/llvm-mc'
SPANS = [(0x037fd044, 0x037fd064), (0x037fd0c0, 0x037fd0c8)]
EXPECTED_WORDS = [
    (0xe3a00001, 0xe5810000, 0xebffffcc, 0xe1a01000,
     0xe3a00001, 0xebffffae, 0xe3a00001, 0xebffffb1),
    (0xe28dd004, 0xe8bd4000),
]
EXPECTED_DIGESTS = [
    '887a11d8e3585472da9e7b810a454d3cf15fd88c3b165c337bb221e91ecad928',
    '89ccd393f43dde6fb4ef3fc4d2c026a16034d4541dc798f74de12bcc0a90a19f',
]


def sha(data):
    return hashlib.sha256(data).hexdigest()


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
llvm_payloads = {}
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
    cursor = initialized_start - base
    mappings = []
    for index, offset in enumerate(range(table_start - base, table_end - base, 12)):
        runtime, size, bss = struct.unpack_from('<III', image, offset)
        region = layout['regions'][index + 1]
        assert region['kind'] == {'autoload': index}
        assert region['runtime_base'] == runtime and region['bss_bytes'] == bss
        assert region['stored_extent'] == {'start': cursor, 'end': cursor + size}
        assert sha(image[cursor:cursor + size]) == region['sha256']
        mappings.append({'region': {'autoload': index}, 'stored_start': cursor,
                         'initialized': {'start': runtime, 'end': runtime + size},
                         'bss': {'start': runtime + size, 'end': runtime + size + bss}})
        cursor += size
    assert cursor == table_start - base

    def initialized_bytes(address, size):
        matches = [m for m in mappings if m['initialized']['start'] <= address
                   and address + size <= m['initialized']['end']]
        assert len(matches) == 1
        mapping = matches[0]
        offset = mapping['stored_start'] + address - mapping['initialized']['start']
        return image[offset:offset + size], offset

    selections = []
    for index, (start, end) in enumerate(SPANS):
        payload, offset = initialized_bytes(start, end - start)
        words = struct.unpack('<' + 'I' * (len(payload) // 4), payload)
        assert words == EXPECTED_WORDS[index] and sha(payload) == EXPECTED_DIGESTS[index]
        calls = []
        for word_index, word in enumerate(words):
            assert word >> 28 == 14
            if (word >> 25) & 7 == 5:
                assert word & (1 << 24)
                immediate = word & 0xffffff
                signed = immediate - (1 << 24) if immediate & (1 << 23) else immediate
                address = start + word_index * 4
                calls.append({'source': address, 'imm24': immediate,
                              'signed_displacement': signed * 4, 'pc_bias': 8,
                              'target': address + 8 + signed * 4,
                              'continuation': address + 4})
        assert [c['target'] for c in calls] == ([0x037fcf84, 0x037fcf18, 0x037fcf2c] if index == 0 else [])
        selections.append({'start': start, 'end': end, 'stored_image_offset': offset,
                           'program_offset': image_offset + offset,
                           'original_rom_offset': image_offset + offset +
                           (0 if layout['identity']['program']['kind'] == 'parent' else child_start),
                           'sha256': sha(payload), 'words': [f'0x{word:08x}' for word in words],
                           'raw_calls': calls})
        if index in llvm_payloads:
            assert llvm_payloads[index] == payload
        else:
            llvm_payloads[index] = payload
    literal_address = 0x037fd034 + 8 + 0x90
    assert literal_address == 0x037fd0cc
    literal, literal_offset = initialized_bytes(literal_address, 4)
    pointed = struct.unpack('<I', literal)[0]
    assert pointed == 0x03808430
    pointed_matches = [m for m in mappings if m['bss']['start'] <= pointed
                       and pointed + 4 <= m['bss']['end']]
    assert len(pointed_matches) == 1 and pointed_matches[0]['region'] == {'autoload': 0}
    assert not any(m['initialized']['start'] <= pointed < m['initialized']['end'] for m in mappings)
    readback.append({'identity': layout['identity'], 'header': {
        'image_offset': image_offset, 'entry': entry, 'base': base, 'image_size': image_size},
        'image_sha256': sha(image), 'autoload_mappings': mappings, 'selections': selections,
        'literal': {'load_site': 0x037fd034, 'address': literal_address,
                    'stored_image_offset': literal_offset, 'sha256': sha(literal),
                    'word': pointed, 'pointed_word_mapping': 'bss',
                    'pointed_region': {'autoload': 0}, 'pointed_bss_offset':
                    pointed - pointed_matches[0]['bss']['start'],
                    'pointed_original_stored_bytes': False, 'pointed_memory_read': False}})

argv = [LLVM, '--disassemble', '--triple=armv4t-none-eabi']
llvm_runs = []
for index, payload in llvm_payloads.items():
    text = ' '.join(f'0x{byte:02x}' for byte in payload) + '\n'
    result = subprocess.run(argv, input=text, text=True, capture_output=True, check=True)
    assert result.stderr == ''
    lines = [line.strip() for line in result.stdout.splitlines() if line.strip() and line.strip() != '.text']
    assert len(lines) == len(EXPECTED_WORDS[index])
    filename = ['llvm-condition-failed.txt', 'llvm-condition-passed.txt'][index]
    (PROOF / filename).write_text(result.stdout)
    llvm_runs.append({'selection': index + 3, 'argv': argv, 'stdout_file': filename,
                      'stdout_sha256': sha(result.stdout.encode()), 'stderr': result.stderr})
assert sha(ROM.read_bytes()) == sha(data) and LAYOUT.read_bytes() == layout_bytes
(PROOF / 'original-read.json').write_text(json.dumps({
    'status': 'passed', 'rom_sha256': sha(data), 'layout_sha256': sha(layout_bytes),
    'child_path': 'ChildRom/JSS2Child.srl', 'child_file_id': file_id,
    'child_rom_extent': {'start': child_start, 'end': child_end},
    'programs': readback, 'llvm_runs': llvm_runs, 'inputs_unchanged': True,
}, indent=2) + '\n')
print('Both original identities, two selected spans, BSS literal classification, raw BL targets, and LLVM pass.')
