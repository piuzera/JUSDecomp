"""Independent original-ROM and graph checks; writes only this proof directory."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess

OUT = Path(__file__).resolve().parent
REPO = Path('/private/tmp/jus-arm7-callee-grounding-write')
BASE = REPO / 'decomp/matching-notes/other-cpus'
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
PROBE = Path('/private/tmp/jus-arm7-reachable-root-cache/target/release/examples/arm7_reachable_probe')
LAYOUT = BASE / 'arm7-checked-layouts.json'
REQUEST = BASE / 'arm7-callee-prefix-proof/requests.json'
PINS = {
    ROM: 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27',
    PROBE: '28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff',
    LAYOUT: '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc',
    REQUEST: '91fc7b3da7000d67be18042a49e513a4d5ac474cb4430bb13a13ea21f33296ef',
}
digest = lambda b: hashlib.sha256(b).hexdigest()
snapshots = {p: p.read_bytes() for p in PINS}
for p, wanted in PINS.items():
    assert digest(snapshots[p]) == wanted, str(p)
assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=REPO, text=True).strip() == '59760663c617c589d7c7d253595f64a02a8b7da3'
rom = snapshots[ROM]
fnt_off, fnt_len, fat_off, fat_len = struct.unpack_from('<4I', rom, 0x40)
fnt = memoryview(rom)[fnt_off:fnt_off + fnt_len]
directory_count = struct.unpack_from('<H', fnt, 6)[0]
files = {}
seen_dirs = set()

def walk(directory, prefix):
    number = directory - 0xf000
    assert 0 <= number < directory_count and directory not in seen_dirs
    seen_dirs.add(directory)
    cursor, next_file, parent = struct.unpack_from('<IHH', fnt, number * 8)
    while True:
        tag = fnt[cursor]
        cursor += 1
        if tag == 0:
            return
        size = tag & 127
        name = bytes(fnt[cursor:cursor+size]).decode('ascii')
        cursor += size
        path = prefix + name
        if tag & 128:
            child = struct.unpack_from('<H', fnt, cursor)[0]
            cursor += 2
            walk(child, path + '/')
        else:
            assert path not in files and (next_file + 1) * 8 <= fat_len
            files[path] = next_file
            next_file += 1

walk(0xf000, '')
assert files['ChildRom/JSS2Child.srl'] == 79
child_start, child_end = struct.unpack_from('<II', rom, fat_off + 79 * 8)
assert (child_start, child_end) == (0x23b800, 0x4464c8)
layouts = json.loads(snapshots[LAYOUT])
requests = json.loads(snapshots[REQUEST])
old = json.loads((BASE / 'arm7-reachable-proof/calls-requests.json').read_bytes())
records = []
llvm_commands = []
expected_words = (0xe92d4000, 0xe24dd004, 0xe59f1090, 0xe5910000, 0xe3500000, 0x1a00001e)
for index, (program, original_base, layout, req, prior) in enumerate(zip(
        (rom, rom[child_start:child_end]), (0, child_start), layouts, requests, old, strict=True)):
    assert req['program'] == prior['program'] == layout['identity']
    assert req['selections'][:2] == prior['selections'] and req['roots'] == prior['roots']
    assert req['selections'][2:] == [{'region': {'autoload': 0}, 'mode': 'Arm', 'extent': {'start': 0x037fd02c, 'end': 0x037fd044}}]
    assert digest(program) == layout['identity']['program_sha256']
    assert layout['identity']['parent_rom_sha256'] == PINS[ROM]
    offset, entry, base, size = struct.unpack_from('<4I', program, 0x30)
    assert (offset, entry, base, size) == (layout['image_offset'], layout['entry'], layout['base'], layout['image_bytes'])
    image = program[offset:offset + size]
    assert len(image) == size and digest(image) == layout['image_sha256']
    assert digest(program[:0x4000]) == layout['header_sha256']
    parameters = image[layout['params_offset']:layout['params_offset'] + 20]
    assert digest(parameters) == layout['params_sha256']
    table_begin, table_end, data_begin, bss_begin, bss_end = struct.unpack('<5I', parameters)
    assert (table_begin-base, table_end-base) == tuple(layout['table_extent'][k] for k in ('start', 'end'))
    table = image[table_begin-base:table_end-base]
    assert digest(table) == layout['table_sha256'] and len(table) % 12 == 0
    stored_cursor = data_begin-base
    entries = []
    for i in range(len(table)//12):
        runtime, initialized, zeroed = struct.unpack_from('<3I', table, i*12)
        region = layout['regions'][i+1]
        assert region['kind'] == {'autoload': i}
        assert (stored_cursor, stored_cursor+initialized) == tuple(region['stored_extent'][k] for k in ('start', 'end'))
        assert runtime == region['runtime_base'] and zeroed == region['bss_bytes']
        assert digest(image[stored_cursor:stored_cursor+initialized]) == region['sha256']
        entries.append((runtime, initialized, zeroed, stored_cursor))
        stored_cursor += initialized
    runtime, initialized, zeroed, stored_begin = entries[0]
    assert (runtime, initialized, zeroed, stored_begin) == (0x037f8000, 0x10248, 0x3a48, 0x1b0)
    location = stored_begin + 0x037fd02c - runtime
    assert location == 0x51dc and 0x037fd044 <= runtime+initialized
    selected = image[location:location+24]
    assert struct.unpack('<6I', selected) == expected_words
    assert digest(selected) == 'cc0404050002c6ff8309766ef0431c16eabaeb11f1407ee6fdff635cbb08e871'
    branch = expected_words[-1]
    imm = branch & 0xffffff
    signed = struct.unpack('<i', struct.pack('<I', imm << 8))[0] >> 8
    assert branch >> 28 == 1 and branch & 0x0f000000 == 0x0a000000
    assert 0x037fd040 + 8 + signed*4 == 0x037fd0c0
    llvm_argv = ['/opt/homebrew/opt/llvm/bin/llvm-mc', '--disassemble', '--triple=armv4t-none-eabi']
    llvm = subprocess.run(llvm_argv, input=' '.join('0x%02x' % b for b in selected)+'\n', text=True, capture_output=True)
    assert llvm.returncode == 0 and not llvm.stderr
    lines = [x.strip() for x in llvm.stdout.splitlines() if x.strip() and x.strip() != '.text']
    assert lines == ['stmdb\tsp!, {lr}', 'sub\tsp, sp, #4', 'ldr\tr1, [pc, #144]', 'ldr\tr0, [r1]', 'cmp\tr0, #0', 'bne\t#120'], lines
    (OUT / ('llvm-program-%d.txt' % index)).write_text(llvm.stdout)
    llvm_commands.append(llvm_argv)
    records.append({'identity': req['program'], 'header': {'image_offset': offset, 'entry': entry, 'base': base, 'image_bytes': size}, 'autoloads': entries, 'prefix_original_rom_offset': original_base+offset+location, 'prefix_stored_offset': location, 'prefix_sha256': digest(selected), 'branch_target': 0x037fd0c0, 'fallthrough': 0x037fd044})

argv = [str(PROBE), str(ROM), str(LAYOUT), PINS[LAYOUT], str(REQUEST), PINS[REQUEST], PINS[PROBE]]
run = subprocess.run(argv, capture_output=True)
(OUT / 'report.json').write_bytes(run.stdout)
(OUT / 'probe-stderr.txt').write_bytes(run.stderr)
assert run.returncode == 0 and not run.stderr
report_hash = digest(run.stdout)
assert report_hash == 'e3920a2a353cbfb5c9a35a0d0e2a01f23cfe4a75e3580215f38de62f389b8bf7'
report = json.loads(run.stdout)
summary = json.loads((BASE / 'arm7-callee-prefix-proof/graph-summary.json').read_bytes())
assert summary['report_sha256'] == report_hash
for k, v in report.items():
    if k != 'programs':
        assert summary[k] == v
assert report['source_bytes'] == 0 and report['inputs_unchanged'] is True
for k in ('arm7_binary_baseline_complete', 'executable_coverage_established', 'function_extents_established', 'original_relocations_established'):
    assert report[k] is False
assert report['status'] == 'bounded_arm7_candidate_graphs_verified'
assert len(report['programs']) == 2
witnesses = [[0, 2], [0, 1, 3, 4, 6], [0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 12], [0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 13]]
for item, compact, req in zip(report['programs'], summary['programs'], requests, strict=True):
    g = item['graph']
    assert item['identity'] == g['program'] == compact['identity'] == req['program']
    assert g['scope'] == compact['scope'] == 'root_assumed_selected_interpretations'
    assert len(g['nodes']) == 11 and len(g['edges']) == 14 and len(g['observations']) == 3
    assert compact['counts'] == {'observations':3, 'nodes':11, 'edges':14, 'visited_nodes':11, 'edge_examinations':14, 'selected_edges':10, 'frontier_edges':4, 'unknown_target_edges':0, 'mode_conflicts':0}
    assert compact['observations'] == [{'selection':o['selection'], 'executability':o['executability'], 'instruction_count':len(o['instructions']), 'transfer_count':len(o['transfers'])} for o in g['observations']]
    assert [{'node':i, 'mode':n['mode'], 'mode_conflict':n['mode_conflict'], **n['instruction']} for i,n in enumerate(g['nodes'])] == compact['nodes']
    assert all(n['identity']['program'] == req['program'] and n['mode'] == 'Arm' and not n['mode_conflict'] for n in g['nodes'])
    assert sum(e['resolution']['kind'] == 'selected' for e in g['edges']) == 10
    assert [i for i,e in enumerate(g['edges']) if e['resolution']['kind'] == 'frontier'] == [2,6,12,13]
    for edge_index, e in enumerate(g['edges']):
        c = compact['edges'][edge_index]
        o = e['original']
        assert c['edge'] == edge_index and c['source_node'] == e['source_node'] and c['source_condition'] == e['source_condition']
        assert all(c[k] == o[k] for k in ('source','kind','guard'))
        assert c['target'] == o['target']['address'] and c['target_mode'] == o['target']['mode']
        assert c['observation_boundary'] == o['target']['boundary'] and c['resolution'] == e['resolution']
        assert o['target']['mapping']['identity']['program'] == req['program']
        assert o['target']['mapping']['kind'] == 'initialized'
    for i, source, target, guard, cond in ((2,0x037f846c,0x037f8470,'call_returned',None),(6,0x037fced4,0x037fced8,'call_returned',None),(12,0x037fd040,0x037fd0c0,'condition_passed','ne'),(13,0x037fd040,0x037fd044,'condition_failed','ne')):
        e = g['edges'][i]
        assert (e['original']['source'],e['original']['target']['address'],e['original']['guard'],e['source_condition']) == (source,target,guard,cond)
        assert e['resolution'] == {'kind':'frontier','reason':'outside_selection'}
    root, = g['roots']
    assert root == compact['root'] and root['visited_nodes'] == list(range(11)) and root['edge_examinations'] == 14
    assert root['assumption'] == req['roots'][0]['assumption'] and root['address'] == req['roots'][0]['address']
    for actual_witness, expected_edges, compact_witness in zip(item['witnesses'][0], witnesses, compact['frontier_witnesses'], strict=True):
        assert actual_witness['transfers'] == [g['edges'][i]['original'] for i in expected_edges]
        assert actual_witness['reason'] == 'outside_selection' and compact_witness == {'reason':'outside_selection','edges':expected_edges}
    assert [o['executability'] for o in g['observations']] == ['unknown']*3
    last = g['observations'][2]
    assert [i['address'] for i in last['instructions']] == list(range(0x037fd02c,0x037fd044,4))
    assert [i['byte_len'] for i in last['instructions']] == [4]*6
    assert [i['condition'] for i in last['instructions']] == [None]*5+['ne']

assert all(p.read_bytes() == snapshots[p] for p in PINS)
receipt = {'status':'accepted', 'findings':[], 'reviewed_commit':'59760663c617c589d7c7d253595f64a02a8b7da3', 'independence':'Full FNT traversal and original-ROM headers/parameters/table readback; fresh per-program LLVM decode; exact frozen-producer replay; graph and compact-summary field checks.', 'fnt_directories_visited':len(seen_dirs), 'fnt_files_visited':len(files), 'child_file_id':79, 'child_rom_extent':[child_start,child_end], 'programs':records, 'complete_report_sha256':report_hash, 'complete_report_bytes':len(run.stdout), 'graph_counts_per_program':{'nodes':11,'edges':14,'selected_edges':10,'frontier_edges':4,'visited_nodes':11,'edge_examinations':14}, 'frontier_edges':[2,6,12,13], 'witness_edges':witnesses, 'source_bytes':0, 'function_extents_established':False, 'executable_coverage_established':False, 'original_relocations_established':False, 'arm7_binary_baseline_complete':False, 'inputs_unchanged':True, 'probe_argv':argv, 'llvm_argv':llvm_commands, 'public_files_sha256':{p.relative_to(BASE).as_posix():digest(p.read_bytes()) for p in (BASE/'arm7-callee-prefix-proof').iterdir() if p.is_file()}}
receipt['public_files_sha256']['arm7-callee-prefix-grounding.md'] = digest((BASE/'arm7-callee-prefix-grounding.md').read_bytes())
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
(OUT/'commands.json').write_text(json.dumps({'probe':argv,'llvm':llvm_commands},indent=2)+'\n')
print('Accepted: original ROM identity/mapping, six ARM instructions, full producer report, and compact graph evidence agree.')
