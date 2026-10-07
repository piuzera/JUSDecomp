"""Compile two pinned recipes and compare actual ELF function bytes to the NDS.

Usage: python3 reproduce.py FRESH_OUTPUT_DIRECTORY
Objects remain in that private output directory. No ROM extraction is written.
"""
import hashlib
import json
import struct
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
OUT = Path(sys.argv[1]).resolve()
OUT.mkdir(exist_ok=False)
SOURCE = HERE / 'store_trial.c'
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT = Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
COMPILER = Path('/private/tmp/jus-track-a/tools/mwccarm/2.0/base/mwccarm.exe')
RUNNER = Path('/private/tmp/jus-track-a/tools/wibo/wibo-macos')
LLVM = Path('/opt/homebrew/opt/llvm/bin')
TRIAGE = HERE / 'triage'
TRIAGE_METADATA = HERE / 'triage.json'
START, END = 0x037fcf18, 0x037fcf2c
SOURCE_SHA = 'a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb'
ORIGINAL_SHA = '1286c0f7baaf3678f915ee9ef9830ab1a2243c5ea8d41e2a75c0b14fa35eaebe'
PINNED = {
    COMPILER: '7150fa4fe4cb6db6867ac530ec1a0754f6ca4df92868d963a7875196f9222880',
    RUNNER: '2b3000ef6a7a490c24ccd71967735ae0005e218922e51806cca1b8d77fd3cf7c',
    COMPILER.parent / 'ELFIO.dll': '25c6e63e127cc6461fee88eb08c189a09ed698ed7e86e7e76831914ca8eec4d2',
    COMPILER.parent / 'MSL_All-DLL80_x86.dll': '11a6d47c8d076eb6eee9a21573e49d371886a5d4ac00ee3619ff0b0e25c45af1',
    COMPILER.parent / 'lmgr8c.dll': '5e675fab488177d5e285d2033d09db9e144f5a50cfb78aed176c5b1715e5afd9',
    ROM: 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27',
    LAYOUT: '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc',
    SOURCE: SOURCE_SHA,
    TRIAGE_METADATA: 'bc8ee39a731209b5a6158f6b2099d3c6ee5ff5a50579938dae9d5d272e374f42',
}


def sha(data):
    return hashlib.sha256(data).hexdigest()


def cstring(data, offset):
    return data[offset:data.index(0, offset)].decode('ascii')


def elf_function(path):
    data = path.read_bytes()
    header = struct.unpack_from('<16sHHIIIIIHHHHHH', data)
    assert data[:7] == b'\x7fELF\x01\x01\x01' and header[1] == 1 and header[2] == 40
    sections = [struct.unpack_from('<IIIIIIIIII', data, header[6] + index * header[11])
                for index in range(header[12])]
    shstr = sections[header[13]]
    names = data[shstr[4]:shstr[4] + shstr[5]]
    symbols = []
    section_rows = []
    relocation_sections = []
    for index, section in enumerate(sections):
        name = cstring(names, section[0])
        section_rows.append({'index': index, 'name': name, 'type': section[1],
                             'flags': section[2], 'offset': section[4], 'size': section[5],
                             'alignment': section[8]})
        if section[1] in (4, 9):
            relocation_sections.append({'name': name, 'size': section[5], 'entry_size': section[9]})
        if section[1] != 2:
            continue
        strings = sections[section[6]]
        strings = data[strings[4]:strings[4] + strings[5]]
        for offset in range(section[4], section[4] + section[5], section[9]):
            symbol = struct.unpack_from('<IIIBBH', data, offset)
            symbols.append({'name': cstring(strings, symbol[0]), 'value': symbol[1],
                            'size': symbol[2], 'binding': symbol[3] >> 4, 'type': symbol[3] & 15,
                            'other': symbol[4], 'section_index': symbol[5]})
    matches = [symbol for symbol in symbols if symbol['name'] == 'arm7_store_trial']
    assert len(matches) == 1
    symbol = matches[0]
    section = sections[symbol['section_index']]
    section_name = cstring(names, section[0])
    assert symbol['type'] == 2 and symbol['binding'] == 1 and symbol['value'] == 0
    assert section_name == '.text' and section[2] == 6 and section[8] == 4
    assert symbol['size'] == section[5] and not relocation_sections
    mappings = [item for item in symbols if item['name'] in ('$a', '$t', '$d')]
    assert len(mappings) == 1 and mappings[0]['name'] == '$a' and mappings[0]['value'] == 0
    code = data[section[4]:section[4] + symbol['size']]
    return code, {'format': 'elf32-littlearm', 'type': header[1], 'machine': header[2],
                  'flags': header[7], 'object_sha256': sha(data), 'sections': section_rows,
                  'symbols': symbols, 'trial_symbol': symbol, 'mode': 'Arm',
                  'mode_evidence': mappings, 'relocation_sections': relocation_sections,
                  'relocation_count': 0, 'text_sha256': sha(code), 'text_bytes': len(code),
                  'words': [f'0x{word:08x}' for word in struct.unpack('<' + 'I' * (len(code) // 4), code)]}


for path, digest in PINNED.items():
    assert sha(path.read_bytes()) == digest, str(path)
data = ROM.read_bytes()
layouts = json.loads(LAYOUT.read_text())
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
originals = []
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
    cursor = initialized_start - base
    mappings = [{'region': 'startup', 'initialized': {'start': base, 'end': base + cursor},
                 'bss': {'start': base + cursor, 'end': base + cursor}}]
    for index, offset in enumerate(range(table_start - base, table_end - base, 12)):
        runtime, initialized_size, bss = struct.unpack_from('<III', image, offset)
        region = layout['regions'][index + 1]
        assert region['runtime_base'] == runtime and region['bss_bytes'] == bss
        assert region['stored_extent'] == {'start': cursor, 'end': cursor + initialized_size}
        assert sha(image[cursor:cursor + initialized_size]) == region['sha256']
        mappings.append({'region': {'autoload': index},
                         'initialized': {'start': runtime, 'end': runtime + initialized_size},
                         'bss': {'start': runtime + initialized_size, 'end': runtime + initialized_size + bss}})
        cursor += initialized_size
    runtime = mappings[1]['initialized']['start']
    assert runtime <= START < END <= mappings[1]['initialized']['end']
    offset = initialized_start - base + START - runtime
    payload = image[offset:offset + END - START]
    assert sha(payload) == ORIGINAL_SHA
    assert struct.unpack('<5I', payload) == (0xe1a00100, 0xe2800627, 0xe2800aff, 0xe5801dc4, 0xe12fff1e)
    target = (0x027ffdc4 + (1 << 2)) & 0xffffffff
    assert target == 0x027ffdc8
    assert not any(mapping[kind]['start'] <= target < mapping[kind]['end']
                   for mapping in mappings for kind in ('initialized', 'bss'))
    originals.append({'identity': layout['identity'], 'extent': {'start': START, 'end': END},
                      'image_sha256': sha(image), 'stored_image_offset': offset,
                      'program_offset': image_offset + offset, 'sha256': sha(payload),
                      'words': [f'0x{word:08x}' for word in struct.unpack('<5I', payload)],
                      'mappings': mappings, 'caller_index': 1, 'caller_effective_store_address': target,
                      'caller_store_mapping': 'unmapped by checked ARM7 module layout',
                      'caller_store_memory_read': False})
assert originals[0]['sha256'] == originals[1]['sha256']
argv = [str(LLVM / 'llvm-mc'), '--disassemble', '--triple=armv4t-none-eabi']
result = subprocess.run(argv, input=' '.join(f'0x{byte:02x}' for byte in payload) + '\n',
                        capture_output=True, text=True, check=True)
assert result.stderr == ''
(OUT / 'original-llvm.txt').write_text(result.stdout)

flags = ['-proc', 'arm7tdmi', '-nothumb', '-interworking', '-nostdinc']
trials = []
for name, optimization in [('baseline', []), ('O4p', ['-O4,p'])]:
    folder = OUT / name
    folder.mkdir()
    command = [str(RUNNER), str(COMPILER), *flags, *optimization, '-c', str(SOURCE), '-o', str(folder / 'compiled.o')]
    result = subprocess.run(command, capture_output=True)
    (folder / 'compiler-stdout.log').write_bytes(result.stdout)
    (folder / 'compiler-stderr.log').write_bytes(result.stderr)
    assert result.returncode == 0
    code, readback = elf_function(folder / 'compiled.o')
    readobj = subprocess.run([str(LLVM / 'llvm-readobj'), '--file-headers', '--sections', '--symbols',
                              '--relocations', str(folder / 'compiled.o')], capture_output=True, text=True, check=True)
    disassembly = subprocess.run([str(LLVM / 'llvm-mc'), '--disassemble', '--triple=armv4t-none-eabi'],
                                 input=' '.join(f'0x{byte:02x}' for byte in code) + '\n',
                                 capture_output=True, text=True, check=True)
    assert readobj.stderr == disassembly.stderr == ''
    (folder / 'elf-readback.txt').write_text(readobj.stdout)
    (folder / 'llvm-disassembly.txt').write_text(disassembly.stdout)
    mismatches = [index for index in range(max(len(code), len(payload)))
                  if index >= len(code) or index >= len(payload) or code[index] != payload[index]]
    trials.append({'recipe': name, 'argv': command, 'returncode': result.returncode,
                   'compiler_stdout': result.stdout.decode(), 'compiler_stderr': result.stderr.decode(),
                   'elf': readback, 'exact_original_bytes_both_programs': code == payload,
                   'byte_mismatch_offsets': mismatches,
                   'llvm_disassembly_sha256': sha(disassembly.stdout.encode())})
    print(name, 'bytes', len(code), 'exact original both programs', code == payload)
assert len(trials) == 2 and trials[0]['elf']['text_bytes'] == 36 and not trials[0]['exact_original_bytes_both_programs']
assert trials[1]['elf']['text_bytes'] == 20 and trials[1]['exact_original_bytes_both_programs']
triage = json.loads(TRIAGE_METADATA.read_text())
receipts = []
for name, digest in triage['artifacts_sha256'].items():
    blob = (TRIAGE / name).read_bytes()
    assert sha(blob) == digest
    receipt = json.loads(blob)
    request_name = name.replace('probe-', 'request-', 1)
    request = (TRIAGE / request_name).read_bytes()
    assert sha(request) == receipt['request_sidecar_sha256']
    receipts.append({'file': name, 'sha256': digest, 'request_sha256': receipt['request_sidecar_sha256'],
                     'request_file': request_name,
                     'producer_sha256': receipt['producer_sha256'], 'status': receipt['status'],
                     'inputs_unchanged': receipt['inputs_unchanged']})
for path, digest in PINNED.items():
    assert sha(path.read_bytes()) == digest, str(path)
(OUT / 'trial-proof.json').write_text(json.dumps({
    'status': 'bounded_plain_C_trial_exact_O4_bytes', 'source_sha256': SOURCE_SHA,
    'input_pins': {str(path): digest for path, digest in PINNED.items()},
    'llvm_tool_sha256': {name: sha((LLVM / name).read_bytes()) for name in ('llvm-mc', 'llvm-readobj')},
    'originals': originals, 'trials': trials, 'triage_receipts': receipts,
    'hypotheses': {'unsigned_int_bits': 32, 'pointer_bits': 32, 'return_type': 'void',
                   'original_symbol_name': None, 'original_function_extent_proven': False,
                   'full_original_ABI_proven': False, 'original_compiler_proven': False,
                   'runtime_execution_proven': False, 'original_link_contract_proven': False},
    'source_credit_bytes': 0, 'canonical_update': False, 'inputs_unchanged': True,
}, indent=2) + '\n')
