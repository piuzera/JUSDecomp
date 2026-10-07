"""Read frozen getter instruction windows and separate four-byte literal words.

Usage: python3 read_original.py OUTPUT_DIRECTORY
No ROM or extracted binary file is written.
"""
import hashlib
import json
import struct
import subprocess
import sys
from pathlib import Path

OUT = Path(sys.argv[1]).resolve()
OUT.mkdir(exist_ok=True)
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT = Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
LLVM = '/opt/homebrew/opt/llvm/bin/llvm-mc'
HERE = Path(__file__).resolve().parent
MANIFEST = json.loads((HERE / 'original-manifest.json').read_text())
SPANS = [(row['start'], row['end']) for row in MANIFEST['instruction_windows']]
WORDS = [tuple(int(word, 16) for word in row['words']) for row in MANIFEST['instruction_windows']]
DIGESTS = [row['sha256'] for row in MANIFEST['instruction_windows']]
assert len(SPANS) == 5 and sum((end-start)//4 for start,end in SPANS) == 20
assert all(end <= next_start for (_,end),(next_start,_) in zip(SPANS,SPANS[1:]))
assert all(not start <= item['address'] < end for start,end in SPANS for item in MANIFEST['literal_words'])


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
    checked_regions = []
    for index, checked in enumerate(layout['regions'][1:]):
        runtime, initialized_size, bss_size = struct.unpack_from('<III', image, table_start - base + index*12)
        stored = initialized_start - base + sum(item['initialized_bytes'] for item in checked_regions)
        assert checked['kind'] == {'autoload': index} and checked['runtime_base'] == runtime
        assert checked['bss_bytes'] == bss_size
        assert checked['stored_extent'] == {'start': stored, 'end': stored + initialized_size}
        assert sha(image[stored:stored + initialized_size]) == checked['sha256']
        checked_regions.append({'region': checked['kind'], 'runtime': runtime,
            'initialized_bytes': initialized_size, 'bss_bytes': bss_size, 'stored_start': stored,
            'initialized_end': runtime + initialized_size, 'bss_end': runtime + initialized_size + bss_size})
    runtime = checked_regions[0]['runtime']
    stored = checked_regions[0]['stored_start']
    initialized_size = checked_regions[0]['initialized_bytes']
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
        selections.append(row)
        if index in llvm_payloads:
            assert llvm_payloads[index] == payload
        else:
            llvm_payloads[index] = payload
    def classify(value):
        matches = []
        boundaries = []
        for checked in checked_regions:
            if checked['runtime'] <= value < checked['initialized_end']:
                matches.append({'kind': 'initialized', 'region': checked['region']})
            elif checked['initialized_end'] <= value < checked['bss_end']:
                matches.append({'kind': 'bss', 'region': checked['region']})
            if value == checked['bss_end']:
                boundaries.append({'boundary': 'exclusive_bss_end', 'region': checked['region']})
        startup = layout['regions'][0]
        if startup['runtime_base'] <= value < startup['runtime_base'] + startup['stored_extent']['end'] - startup['stored_extent']['start']:
            matches.append({'kind': 'initialized', 'region': 'startup'})
        return {'matches': matches, 'kind': 'unmapped' if not matches else matches[0]['kind'],
                'exclusive_boundary_matches': boundaries}
    literals = []
    for item in MANIFEST['literal_words']:
        address = item['address']
        assert runtime <= address and address + 4 <= runtime + initialized_size
        offset = stored + address - runtime
        payload = image[offset:offset+4]
        value = struct.unpack('<I', payload)[0]
        assert sha(payload) == item['sha256'] and value == int(item['word'], 16)
        for source in item['load_sources']:
            instruction_offset = stored + source - runtime
            word = struct.unpack_from('<I', image, instruction_offset)[0]
            assert word & 0xfffff000 in (0xe59f0000, 0xe59f1000)
            assert source + 8 + (word & 0xfff) == address
        literals.append({**item, 'stored_image_offset': offset,
            'literal_storage': 'initialized autoload0 in this exact program',
            'value_mapping': classify(value)})
    records.append({'identity': layout['identity'], 'image_sha256': sha(image),
                    'image_bytes': len(image), 'checked_autoload_regions': checked_regions,
                    'selections': selections, 'literals': literals})
llvm_runs = []
for index, payload in llvm_payloads.items():
    argv = [LLVM, '--disassemble', '--triple=armv4t-none-eabi']
    result = subprocess.run(argv, input=' '.join(f'0x{byte:02x}' for byte in payload) + '\n',
                            capture_output=True, text=True, check=True)
    assert result.stderr == ''
    assert len([line for line in result.stdout.splitlines() if line.strip()]) == len(WORDS[index])
    filename = 'llvm-original-low-getter.txt'
    llvm_runs.append({'extent': {'start': SPANS[index][0], 'end': SPANS[index][1]},
                      'argv': argv, 'stdout': result.stdout, 'stdout_sha256': sha(result.stdout.encode())})
llvm_text = ''.join(f"[{run['extent']['start']:08x},{run['extent']['end']:08x})\n{run['stdout']}" for run in llvm_runs)
(OUT / 'llvm-original-low-getter.txt').write_text(llvm_text)
assert ROM.read_bytes() == data and LAYOUT.read_bytes() == layout_bytes
(OUT / 'original-read.json').write_text(json.dumps({'status': 'passed',
    'rom_sha256': sha(data), 'layout_sha256': sha(layout_bytes),
    'child_path': 'ChildRom/JSS2Child.srl', 'child_file_id': file_id,
    'child_rom_extent': {'start': child_start, 'end': child_end},
    'programs': records, 'llvm_runs': llvm_runs, 'llvm_combined_sha256': sha(llvm_text.encode()), 'inputs_unchanged': True,
    'source_credit_bytes': 0, 'original_names_established': False}, indent=2) + '\n')
print('Both exact identities, frozen instruction ownership, separate literal words/PC arithmetic, checked mapping, and LLVM pass.')
