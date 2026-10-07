"""Replay one WRAM declaration-kind change and record its unchanged mismatch; never link.

Usage: python3 reproduce.py NEW_PRIVATE_OUTPUT_DIRECTORY
Only the source and original-word manifest in this package are proof inputs.
Objects stay in the new private output directory.
"""
import hashlib
import json
import struct
import subprocess
import sys
from pathlib import Path
from verify import inspect_object, resolve_literals, check_pool

HERE = Path(__file__).resolve().parent
OUT = Path(sys.argv[1]).resolve()
OUT.mkdir()
COMPILER = Path('/private/tmp/jus-track-a/tools/mwccarm/2.0/base/mwccarm.exe')
RUNNER = Path('/private/tmp/jus-track-a/tools/wibo/wibo-macos')
LLVM = Path('/opt/homebrew/opt/llvm/bin')
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT = Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
SOURCE = HERE / 'low_getter_trial.c'
PINNED = {
    COMPILER: '7150fa4fe4cb6db6867ac530ec1a0754f6ca4df92868d963a7875196f9222880',
    RUNNER: '2b3000ef6a7a490c24ccd71967735ae0005e218922e51806cca1b8d77fd3cf7c',
    COMPILER.parent / 'ELFIO.dll': '25c6e63e127cc6461fee88eb08c189a09ed698ed7e86e7e76831914ca8eec4d2',
    COMPILER.parent / 'MSL_All-DLL80_x86.dll': '11a6d47c8d076eb6eee9a21573e49d371886a5d4ac00ee3619ff0b0e25c45af1',
    COMPILER.parent / 'lmgr8c.dll': '5e675fab488177d5e285d2033d09db9e144f5a50cfb78aed176c5b1715e5afd9',
    LLVM / 'llvm-readobj': 'cf8c2b665ea0a064bad08c2fe3f6ba3a21fd3fd368ea5643f0c35e12fcac5540',
    LLVM / 'llvm-mc': '76de9d4a660f3e1f6dc8175c5d443197f953eaa4df2871406a19d789b1a34ba0',
    ROM: 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27',
    LAYOUT: '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc',
    SOURCE: '3f7b22c42f4b98cfed84308f2e5b658ae9cecdb8a17d900421e71ed70c496495',
    HERE/'accepted_original_source.c': 'fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537',
}
for path, expected in PINNED.items():
    assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, str(path)
previous = (HERE/'accepted_original_source.c').read_bytes()
source = SOURCE.read_bytes()
before = b'extern unsigned char hyp_wram_arena_lo;'
after = b'extern void hyp_wram_arena_lo(void);'
assert previous.count(before) == source.count(after) == 1
assert previous.replace(before,after) == source and source.replace(after,before) == previous
assert b'(unsigned int)&hyp_wram_arena_lo > low' in source
assert b'low < (unsigned int)&hyp_wram_arena_lo' not in source
source_diff = {'old_source_sha256': hashlib.sha256(previous).hexdigest(),
    'source_sha256': hashlib.sha256(source).hexdigest(), 'old_declaration': before.decode(),
    'new_declaration': after.decode(), 'old_declaration_offset': previous.index(before),
    'other_C_bytes_unchanged': True, 'original_greater_than_body_preserved': True}
recipe = json.loads((HERE/'accepted-recipe.json').read_text())
assert recipe['compiler_flags'] == ['-proc','arm7tdmi','-nothumb','-interworking','-nostdinc','-O4,p','-c']
subprocess.run([sys.executable, str(HERE/'read_original.py'), str(OUT)], check=True)
original = json.loads((OUT/'original-read.json').read_text())
manifest = json.loads((HERE/'original-manifest.json').read_text())
assert manifest['instruction_count'] == 20 and manifest['literal_bytes'] == 8
assert len(original['programs']) == 2
expected_payloads = []
for program in original['programs']:
    instructions = b''.join(struct.pack('<I', int(word,16))
        for row in program['selections'] for word in row['words'])
    pool = b''.join(struct.pack('<I', int(row['word'],16)) for row in program['literals'])
    assert len(instructions) == 80 and len(pool) == 8
    expected_payloads.append(instructions + pool)
assert expected_payloads[0] == expected_payloads[1]
expected = expected_payloads[0]
argv = [str(RUNNER), str(COMPILER), '-proc', 'arm7tdmi', '-nothumb', '-interworking',
        '-nostdinc', '-O4,p', '-c', str(SOURCE), '-o', str(OUT/'compiled.o')]
assert argv[2:-3] == recipe['compiler_flags']
compiled = subprocess.run(argv, capture_output=True)
(OUT/'compiler-stdout.log').write_bytes(compiled.stdout)
(OUT/'compiler-stderr.log').write_bytes(compiled.stderr)
assert compiled.returncode == 0 and compiled.stdout == compiled.stderr == b''
row = inspect_object(OUT/'compiled.o')
assert row['object_sha256'] == 'a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20'
assert row['instruction_bytes'] == 80 and row['pool_bytes'] == 8
assert [(r['offset'],r['type'],r['symbol'],r['addend']) for r in row['relocations']] == [
    (80,2,'hyp_subpriv_arena_lo',0),(84,2,'hyp_wram_arena_lo',0)]
bindings = {'hyp_subpriv_arena_lo': 0x027f9c08, 'hyp_wram_arena_lo': 0x0380bc90}
check_pool(row, bindings, expected[80:])
explained = resolve_literals(row, bindings)
mismatches = [i for i in range(80) if explained[i] != expected[i]]
assert mismatches == list(range(52,60))
wrong_bindings = {**bindings, 'hyp_subpriv_arena_lo': 0x027fafcc}
wrong = resolve_literals(row, wrong_bindings)
wrong_mismatches = [i for i in range(80,88) if wrong[i] != expected[i]]
assert wrong_mismatches == [80,81]
try:
    check_pool(row, wrong_bindings, expected[80:])
except ValueError as error:
    rejection = str(error)
else:
    raise AssertionError('wrong binding was accepted')
readobj_argv = [str(LLVM/'llvm-readobj'), '--file-headers','--sections','--symbols',
               '--relocations',str(OUT/'compiled.o')]
readobj = subprocess.run(readobj_argv,capture_output=True,text=True,check=True)
assert readobj.stderr == ''
readobj_text = readobj.stdout.replace(str(OUT/'compiled.o'),'compiled.o')
(OUT/'elf-readback.txt').write_text(readobj_text)
llvm_argv = [str(LLVM/'llvm-mc'),'--disassemble','--triple=armv4t-none-eabi']
disassembly = subprocess.run(llvm_argv, input=' '.join(f'0x{x:02x}' for x in explained[:80])+'\n',
    capture_output=True,text=True,check=True)
assert disassembly.stderr == ''
(OUT/'compiled-llvm.txt').write_text(disassembly.stdout)
for path, expected_hash in PINNED.items():
    assert hashlib.sha256(path.read_bytes()).hexdigest() == expected_hash, str(path)
proof = {'status':'single_declaration_kind_same_object_mismatch_stop', 'recipe_count':1,
    'source_diff':source_diff, 'same_compiler_flags_as_original_trial':True,
    'original_trial_object_sha256':recipe['original_object_sha256'],
    'same_full_object_as_original_trial':row['object_sha256'] == recipe['original_object_sha256'],
    'undefined_WRAM_symbol_kind_after_C_function_declaration':'NOTYPE (0), global (1), undefined section (0), value0/size0; unchanged',
    'source_sha256': PINNED[SOURCE], 'argv': argv, 'compile_returncode':compiled.returncode,
    'inputs': [{'path':str(path),'sha256':value} for path,value in PINNED.items()],
    'original_manifest_sha256': hashlib.sha256((HERE/'original-manifest.json').read_bytes()).hexdigest(),
    'original_read_sha256':hashlib.sha256((OUT/'original-read.json').read_bytes()).hexdigest(),
    'originals': [{'identity':program['identity'], 'fixed_instruction_extent':{'start':0x037fcf2c,'end':0x037fcf7c},
        'separate_literal_extents':[{'start':0x037fcf7c,'end':0x037fcf80},{'start':0x037fcf80,'end':0x037fcf84}],
        'fixed_88_byte_sha256':hashlib.sha256(payload).hexdigest()}
        for program,payload in zip(original['programs'],expected_payloads,strict=True)],
    'elf':row, 'hypothesis_bindings':bindings,
    'relocation_explanation':'Diagnostic S+A for observed data ABS32 entries; no native linker or patched object is used.',
    'comparison':{'instruction_mismatch_offsets':mismatches,'explained_pool_exact_both_programs':True,
        'full_88_bytes_exact_both_programs':False,
        'compiled_instruction_sha256':hashlib.sha256(explained[:80]).hexdigest(),
        'original_instruction_sha256':hashlib.sha256(expected[:80]).hexdigest(),
        'explained_88_byte_sha256':hashlib.sha256(explained).hexdigest(),
        'different_words':[{'relative_offset':i,'original':f'0x{struct.unpack_from("<I",expected,i)[0]:08x}',
            'compiled':f'0x{struct.unpack_from("<I",explained,i)[0]:08x}'} for i in (52,56)]},
    'negative':{'wrong_bindings':wrong_bindings,'wrong_binding_literal_mismatch_offsets':wrong_mismatches,
        'verifier_rejection':rejection,'native_link_attempted':False},
    'readback_commands':[readobj_argv,llvm_argv],
    'logs': [{'name':name,'sha256':hashlib.sha256((OUT/name).read_bytes()).hexdigest()}
        for name in ('compiler-stdout.log','compiler-stderr.log','elf-readback.txt','compiled-llvm.txt','llvm-original-low-getter.txt')],
    'native_link_attempted':False, 'native_link_reason':'The isolated WRAM declaration-kind change produces the same full object and eight instruction mismatches; stop condition reached.',
    'full_image_native_link_reconstruction':'not attempted', 'inputs_unchanged':True,
    'original_names_types_ABI_extent_version_ownership_established':False,'source_credit_bytes':0}
(OUT/'trial-proof.json').write_text(json.dumps(proof,indent=2)+'\n')
print('Only the WRAM declaration changed from original source; original greater-than body and flags preserved. Full object/symbol metadata unchanged; eight bytes still mismatch; no native link.')
