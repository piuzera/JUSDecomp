"""Replay all five committed triage requests against pinned original input."""
from pathlib import Path
import hashlib
import json
import subprocess

OUT=Path(__file__).resolve().parent
BASE=Path('/private/tmp/jus-arm7-leaf-trial/decomp/matching-notes/other-cpus')
PUBLIC=BASE/'arm7-leaf-c-trial-proof'
PROBE=Path('/private/tmp/jus-arm7-reachable-root-cache/target/release/examples/arm7_reachable_probe')
ROM=Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LAYOUT=BASE/'arm7-checked-layouts.json'
sha=lambda b:hashlib.sha256(b).hexdigest()
pins={PROBE:'28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff',ROM:'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27',LAYOUT:'8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'}
assert all(sha(p.read_bytes())==h for p,h in pins.items())
meta=json.loads((PUBLIC/'triage.json').read_bytes())
receipts=[]
for name,expected_sha in meta['artifacts_sha256'].items():
    published=(PUBLIC/'triage'/name).read_bytes()
    assert sha(published)==expected_sha
    report=json.loads(published)
    request_name=name.replace('probe-','request-',1)
    request=PUBLIC/'triage'/request_name
    request_sha=sha(request.read_bytes())
    assert request_sha==report['request_sidecar_sha256']
    argv=[str(PROBE),str(ROM),str(LAYOUT),pins[LAYOUT],str(request),request_sha,pins[PROBE]]
    run=subprocess.run(argv,capture_output=True)
    (OUT/('replayed-'+name)).write_bytes(run.stdout)
    (OUT/(name+'.stderr.log')).write_bytes(run.stderr)
    assert run.returncode==0 and not run.stderr
    assert run.stdout==published and sha(run.stdout)==expected_sha
    fresh=json.loads(run.stdout)
    assert fresh['inputs_unchanged'] is True and fresh['source_bytes']==0
    assert all(fresh[k] is False for k in ('arm7_binary_baseline_complete','function_extents_established','executable_coverage_established','original_relocations_established'))
    assert len(fresh['programs'])==2 and fresh['programs'][0]['identity']!=fresh['programs'][1]['identity']
    facts=[]
    for p in fresh['programs']:
        g=p['graph'];root,=g['roots']
        facts.append({'identity':p['identity'],'nodes':len(g['nodes']),'edges':len(g['edges']),'visited_nodes':len(root['visited_nodes']),'edge_examinations':root['edge_examinations'],'frontier_targets':[g['edges'][f['edge']]['original']['target'] for f in root['frontiers'] if f['kind']=='edge']})
        if name=='probe-037fcf18.json':
            assert len(root['visited_nodes'])==5 and root['edge_examinations']==5
            assert [g['nodes'][i]['instruction']['address'] for i in root['visited_nodes']]==list(range(0x037fcf18,0x037fcf2c,4))
            bx=g['edges'][4]['original']
            assert bx['source']==0x037fcf28 and bx['target']['kind']=='unknown'
            assert g['nodes'][4]['instruction']['text']=='bx lr'
        if name=='probe-cf18-predecessor.json':
            assert any(n['instruction']['address']==0x037fcf14 and n['instruction']['text']=='bx lr' for n in g['nodes'])
        if name=='probe-caller-context.json':
            assert any(e['original']['source']==0x037fd058 and e['original']['kind']=='call' and e['original']['target']['address']==0x037fcf18 for e in g['edges'])
    receipts.append({'report_file':name,'report_sha256':expected_sha,'request_file':request_name,'request_sha256':request_sha,'replayed_report_bytes':len(run.stdout),'argv':argv,'status':'exact_full_report_reproduced','programs':facts})
assert len(receipts)==5
assert all(sha(p.read_bytes())==h for p,h in pins.items())
(OUT/'triage-replay-receipts.json').write_text(json.dumps({'status':'passed','inputs_unchanged':True,'producer_sha256':pins[PROBE],'receipts':receipts},indent=2)+'\n')
print('All five committed triage requests reproduce their full reports byte for byte; leaf BX remains an unknown-target frontier.')
