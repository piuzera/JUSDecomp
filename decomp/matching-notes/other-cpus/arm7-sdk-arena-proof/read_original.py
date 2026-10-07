"""Read only two explicit ARM spans and scan stored ARM7 images for named tokens.

Usage: python3 read_original.py OUTPUT_DIRECTORY
No ROM or extracted binary file is written.
"""
import hashlib
import json
import re
import struct
import subprocess
import sys
from pathlib import Path

OUT = Path(sys.argv[1]).resolve()
OUT.mkdir(exist_ok=True)
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT = Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
LLVM = '/opt/homebrew/opt/llvm/bin/llvm-mc'
SPANS = [(0x037fcf04, 0x037fcf2c), (0x037fd064, 0x037fd070)]
WORDS = [
    (0xe1a00100, 0xe2800627, 0xe2800aff, 0xe5801da0, 0xe12fff1e,
     0xe1a00100, 0xe2800627, 0xe2800aff, 0xe5801dc4, 0xe12fff1e),
    (0xe1a01000, 0xe3a00001, 0xebffffa4),
]
DIGESTS = [
    'dba77433134717ea7a8f1fc995279825ca62de53ab0adf7bdb7f8c7f020c2d59',
    'aeb809ad5a9f8c3894e005fff8eadce11ca04cde1cb44a11f157d9dc258c70cf',
]


def sha(data):
    return hashlib.sha256(data).hexdigest()


data = ROM.read_bytes()
assert sha(data) == 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
layout_bytes = LAYOUT.read_bytes()
assert sha(layout_bytes) == '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
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
        if index == 1:
            immediate = WORDS[index][-1] & 0xffffff
            displacement = (immediate - (1 << 24)) * 4
            target = start + 8 + 8 + displacement
            assert target == 0x037fcf04
            row['raw_call'] = {'source': start + 8, 'signed_displacement': displacement,
                               'pc_bias': 8, 'target': target, 'continuation': end}
        selections.append(row)
        if index in llvm_payloads:
            assert llvm_payloads[index] == payload
        else:
            llvm_payloads[index] = payload
    tokens = [b'OS_SetArena', b'OS_InitArena', b'NitroSDK', b'NITRO', b'SDK_VERSION']
    hits = {token.decode(): [match.start() for match in re.finditer(re.escape(token), image, re.I)]
            for token in tokens}
    assert all(not offsets for offsets in hits.values())
    records.append({'identity': layout['identity'], 'image_sha256': sha(image),
                    'image_bytes': len(image), 'autoload0': {'runtime': runtime,
                    'initialized_bytes': initialized_size, 'bss_bytes': bss_size, 'stored_start': stored},
                    'selections': selections, 'case_insensitive_stored_image_token_offsets': hits})
llvm_runs = []
for index, payload in llvm_payloads.items():
    argv = [LLVM, '--disassemble', '--triple=armv4t-none-eabi']
    result = subprocess.run(argv, input=' '.join(f'0x{byte:02x}' for byte in payload) + '\n',
                            capture_output=True, text=True, check=True)
    assert result.stderr == ''
    assert len([line for line in result.stdout.splitlines() if line.strip()]) == len(WORDS[index])
    filename = ['llvm-setter-pair.txt', 'llvm-caller-tail.txt'][index]
    (OUT / filename).write_text(result.stdout)
    llvm_runs.append({'extent': {'start': SPANS[index][0], 'end': SPANS[index][1]},
                      'argv': argv, 'stdout_file': filename, 'stdout_sha256': sha(result.stdout.encode())})
assert ROM.read_bytes() == data and LAYOUT.read_bytes() == layout_bytes
(OUT / 'original-read.json').write_text(json.dumps({'status': 'passed',
    'rom_sha256': sha(data), 'layout_sha256': sha(layout_bytes),
    'child_path': 'ChildRom/JSS2Child.srl', 'child_file_id': file_id,
    'child_rom_extent': {'start': child_start, 'end': child_end},
    'programs': records, 'llvm_runs': llvm_runs, 'inputs_unchanged': True,
    'source_credit_bytes': 0, 'original_names_established': False}, indent=2) + '\n')
print('Both original identities, bounded words, raw BL target, LLVM, and specified token scan pass.')
