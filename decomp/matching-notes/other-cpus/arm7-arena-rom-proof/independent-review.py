import hashlib
import json
import struct
import subprocess
from pathlib import Path

ROOT = Path('/private/tmp/jus-arm7-arena-rom-independent')
OUT = Path('/private/tmp/jus-arm7-arena-rom-independent-proof/public-replay')
PROOF = ROOT / 'decomp/matching-notes/other-cpus/arm7-arena-rom-proof'
OLD = ROOT / 'decomp/matching-notes/other-cpus/arm7-indexed-loads-proof'
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')

def sha(data):
    return hashlib.sha256(data).hexdigest()

def elf_symbols(data):
    e_shoff = struct.unpack_from('<I', data, 32)[0]
    e_shentsize, e_shnum, e_shstrndx = struct.unpack_from('<HHH', data, 46)
    assert e_shentsize == 40
    sections = [struct.unpack_from('<IIIIIIIIII', data, e_shoff + i * 40) for i in range(e_shnum)]
    names_row = sections[e_shstrndx]
    names = data[names_row[4]:names_row[4] + names_row[5]]
    def name(offset):
        return names[offset:names.index(0, offset)].decode()
    named = {name(s[0]): s for s in sections}
    symbols = {}
    for s in sections:
        if s[1] != 2:
            continue
        strings = sections[s[6]]
        strings = data[strings[4]:strings[4] + strings[5]]
        for offset in range(s[4], s[4] + s[5], 16):
            n, value, size, info, other, index = struct.unpack_from('<IIIBBH', data, offset)
            key = strings[n:strings.index(0, n)].decode()
            symbols[key] = (value, size, info, index)
    return named, symbols

def main():
    r = json.loads((OUT / 'trial-proof.json').read_text())
    assert r['status'] == 'passed'
    assert [s['name'] for s in r['stages']] == ['parent_verification','arm7_native_baselines','child_arm9_native_roundtrip','research_trial','integrated_input_gate','research_pack','final_freshness']
    assert r['source_credit']['canonical'] == 304 and r['source_credit']['arm7'] == 0
    assert not r['t06_complete'] and not r['t10_complete']
    parent = json.loads((OUT / 'parent/report.json').read_text())
    checkpoint = json.loads((OUT / 'module-checkpoint.json').read_text())
    assert parent['status'] == 'passed' and len(parent['stages']) == 19
    assert checkpoint['status'] == 'passed' and len(checkpoint['stages']) == 19
    assert [s['name'] for s in checkpoint['stages'][-3:]] == ['arm7_native_baselines','child_arm9_native_roundtrip','freshness']
    assert len(r['artifact_hashes']) == 916 and len(r['trial_artifact_sha256']) == 198 and len(r['input_sha256']) == 153
    for name, pin in r['artifact_hashes'].items():
        path = OUT / name
        assert path.is_file() and not path.is_symlink() and path.resolve().is_relative_to(OUT)
        assert sha(path.read_bytes()) == pin, name
    for name, pin in r['input_sha256'].items():
        path = Path(name)
        assert path.is_file() and sha(path.read_bytes()) == pin, name
    trial = json.loads((OUT / 'trial/trial-proof.json').read_text())
    contract = json.loads((OLD / 'contract.json').read_text())
    assert trial['status'] == 'actual_seven_MW_indexed_loads_exact_original_images'
    assert trial['source_credit_bytes'] == 0
    assert len(trial['candidates']) == len(contract['candidates']) == 7
    for expected, actual in zip(contract['candidates'], trial['candidates'], strict=True):
        assert actual['role'] == expected['role'] and actual['source_sha256'] == expected['source_sha256']
        path = OUT / 'trial' / (expected['role'] + '.o')
        assert sha(path.read_bytes()) == expected['object_sha256'] == actual['elf']['object_sha256']
        assert (OUT / 'trial' / (expected['role'] + '-compile.json')).is_file()
    original = ROM.read_bytes()
    rebuilt = (OUT / 'research.nds').read_bytes()
    assert len(original) == len(rebuilt) == 67108864
    assert original == rebuilt and sha(rebuilt) == r['rom']['sha256'] == 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
    child_start, child_end = 0x23b800, 0x4464c8
    assert sha(rebuilt[child_start:child_end]) == '1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986'
    writes = r['research_pack']['writes']
    assert len(writes) == 20
    assert sum(w['module'] == 'ARM7' for w in writes) == 2
    assert sum('identity' not in w for w in writes) == 17
    assert sum(w['module'] == 'ARM9' and 'identity' in w for w in writes) == 1
    intervals = sorted((w['rom_offset'], w['rom_offset'] + w['size_bytes']) for w in writes)
    assert all(a[1] <= b[0] for a,b in zip(intervals, intervals[1:]))
    programs = []
    expected_bindings = {k:v['value'] for k,v in contract['bindings'].items()}
    expected_roles = {row['role']:row for row in contract['candidates']}
    for i, write in enumerate(w for w in writes if w['module'] == 'ARM7'):
        elf_path = OUT / write['input_file']
        data = elf_path.read_bytes()
        assert write['native_program_index'] == i
        assert sha(data) == write['elf_sha256'] == '75ae967dce740ec4e0131c6e5af8e0cd709c04c73f2af9fd6c305230ef81ac4e'
        assert struct.unpack_from('<I', data, 36)[0] == 0x05000200
        row = r['research_pack']['trial']['programs'][i]
        readback = row['actual_readback']
        assert write['native_readback'] == f'/research_pack/trial/programs/{i}/actual_readback'
        assert readback['linked_elf_sha256'] == write['elf_sha256']
        assert row['elf_sha256'] == write['elf_sha256'] and row['map_sha256'] == readback['map_sha256']
        assert sha((OUT / f'trial/native/program-{i}/positive.map').read_bytes()) == row['map_sha256']
        segments = readback['segments']
        assert len(segments) == 6 and sum(p['memory_bytes'] for p in segments if not p['file_bytes']) == 21424
        by_name = {s['name']:p for s,p in zip(readback['sections'],segments,strict=True)}
        image = b''.join(data[by_name['.arm7.'+name]['offset']:by_name['.arm7.'+name]['offset']+by_name['.arm7.'+name]['file_bytes']] for name in ('startup','autoload0','autoload1','table'))
        assert len(image) == 165552 and sha(image) == write['sha256'] == readback['image_sha256']
        assert rebuilt[write['rom_offset']:write['rom_offset']+write['size_bytes']] == image
        assert readback['bindings'] == readback['observed_bindings'] == expected_bindings
        named, symbols = elf_symbols(data)
        for field, spec in contract['bindings'].items():
            assert symbols[spec['symbol']][0] == expected_bindings[field]
        section = named['.arm7.autoload0']
        for candidate in readback['candidates']:
            expected = expected_roles[candidate['role']]
            assert candidate['map_vma'] == expected['vma'] and candidate['map_bytes'] == expected['bytes']
            assert candidate['map_input'] in (OUT / f'trial/native/program-{i}/positive.map').read_text()
            linked = data[section[4]+expected['vma']-section[3]:section[4]+expected['vma']-section[3]+expected['bytes']]
            assert sha(linked) == candidate['linked_bytes_sha256']
            assert candidate['actual_input_sha256'] == expected['object_sha256']
        calls = readback['initializer_calls']
        assert len(calls) == 12
        for call in calls:
            actual_word = struct.unpack_from('<I', data, section[4] + call['source'] - section[3])[0]
            assert actual_word == int(call['word'],16) and actual_word >> 24 == 0xeb
            delta = actual_word & 0xffffff
            if delta & 0x800000: delta -= 1<<24
            assert call['source']+8+4*delta == call['target'] == call['resolved_symbol_vma']
        programs.append({'program_index':i,'elf_sha256':write['elf_sha256'],'image_sha256':write['sha256'],'calls':len(calls),'bindings':readback['observed_bindings'],'rom_offset':write['rom_offset']})
    assert [p['rom_offset'] for p in programs] == [2162688,4313600]
    head = subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip()
    result = {'status':'No flags','reviewed_commit':head,'receipt_sha256':sha((OUT/'trial-proof.json').read_bytes()),'rom_sha256':sha(rebuilt),'parent_stages':19,'checkpoint_stages':19,'experiment_stages':7,'artifact_count':len(r['artifact_hashes']),'trial_artifacts':len(r['trial_artifact_sha256']),'input_pins':len(r['input_sha256']),'writes':len(writes),'programs':programs,'source_credit':{'canonical':304,'arm7':0},'t06_complete':False,'t10_complete':False}
    target = Path('/private/tmp/jus-arm7-arena-rom-independent-proof/final-review.json')
    target.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k != 'programs'},indent=2))

if __name__ == '__main__': main()
