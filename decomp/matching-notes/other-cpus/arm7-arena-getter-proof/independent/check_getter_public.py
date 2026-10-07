"""Bind frozen public getter proof to independent original words and graph replay."""
from pathlib import Path
import hashlib
import json
import subprocess

OUT=Path(__file__).resolve().parent
REPO=Path('/private/tmp/jus-arm7-getter-independent')
BASE=REPO/'decomp/matching-notes/other-cpus'
PUBLIC=BASE/'arm7-arena-getter-proof'
COMMIT='d942d2cc1a8b4f20da388ac6b8978d584803ef9f'
sha=lambda b:hashlib.sha256(b).hexdigest()
raw=json.loads((OUT/'independent-original-read.json').read_bytes())
manifest=json.loads((PUBLIC/'frozen-manifest.json').read_bytes())
assert sha((PUBLIC/'frozen-manifest.json').read_bytes())=='978c0a6d743ba6a790de8f2d4277747055913d27044cd9d2c2c8afadc7b18310'
assert manifest['instruction_count']==47 and manifest['literal_bytes']==28 and manifest['source_credit_bytes']==0 and manifest['original_function_extent_proven'] is False
published_original=json.loads((PUBLIC/'original-read.json').read_bytes())
for own,pub in zip(raw['programs'],published_original['programs'],strict=True):
    assert own['identity']==pub['identity']
    for window,frozen,readback in zip(own['windows'],manifest['instruction_windows'],pub['selections'],strict=True):
        assert window['extent']==[frozen['start'],frozen['end']]==[readback['start'],readback['end']]
        assert window['sha256']==frozen['sha256']==readback['sha256'] and window['words']==frozen['words']==readback['words']
        assert window['stored_image_offset']==readback['stored_image_offset']
    for literal,frozen,readback in zip(own['literal_reads'],manifest['literal_words'],pub['literals'],strict=True):
        assert literal['address']==frozen['address']==readback['address']
        assert literal['sha256']==frozen['sha256']==readback['sha256']
        assert '0x%08x'%literal['word']==frozen['word']==readback['word']
        assert literal['stored_image_offset']==readback['stored_image_offset']
        assert literal['pointed_word_mapping'] is None and readback['value_mapping']['kind']=='unmapped' and not readback['value_mapping']['matches']
        sources=[item['source'] for item in own['literal_load_arithmetic'] if item['literal_address']==literal['address']]
        assert sources==frozen['load_sources']==readback['load_sources']
        assert bool(literal['pointed_value_boundaries'])==bool(readback['value_mapping']['exclusive_boundary_matches'])
        assert readback['literal_storage']=='initialized autoload0 in this exact program'

blob=(OUT/'reproduced/report.json').read_bytes()
assert len(blob)==1272089 and sha(blob)=='128ea0b92922521b237d5d7f65a820d3154c289ba8605f71fa00bea10bdb9560'
full=json.loads(blob);summary=json.loads((PUBLIC/'graph-summary.json').read_bytes())
assert summary['report_sha256']==sha(blob)
for k,v in full.items():
    if k!='programs':assert summary[k]==v
assert full['source_bytes']==0 and full['inputs_unchanged'] is True
assert all(full[k] is False for k in ('arm7_binary_baseline_complete','function_extents_established','executable_coverage_established','original_relocations_established'))
requests=json.loads((PUBLIC/'requests.json').read_bytes());previous=json.loads((BASE/'arm7-sdk-arena-proof/requests.json').read_bytes())
assert sha((PUBLIC/'requests.json').read_bytes())=='a7c79ddf45b866017e2e7da3c3d298ac9d42cef9a54368c912fee0934012aa01'
expected_bx=[0x037fcf14,0x037fcf28,0x037fcf4c,0x037fcf5c,0x037fcf70,0x037fcf78,0x037fcfa4,0x037fcfac,0x037fcfd4,0x037fcfe4,0x037fcfec]
graphs=[]
for p,c,req,prior,own in zip(full['programs'],summary['programs'],requests,previous,raw['programs'],strict=True):
    g=p['graph'];edges=g['edges'];root,=g['roots']
    assert p['identity']==g['program']==req['program']==prior['program']==c['identity']==own['identity']
    assert req['roots']==prior['roots'] and req['selections'][:7]==prior['selections'] and len(req['selections'])==17
    expected=[{'region':{'autoload':0},'mode':'Arm','extent':{'start':w['extent'][0],'end':w['extent'][1]}} for w in own['windows']]
    assert req['selections'][7:]==expected
    extents=sorted((s['extent']['start'],s['extent']['end']) for s in req['selections'])
    assert all(end<=start for (_,end),(start,_) in zip(extents,extents[1:]))
    assert all(not a<=l['address']<b for a,b in extents for l in own['literal_reads'])
    assert len(g['nodes'])==81 and len(edges)==95 and len(g['observations'])==17
    assert c['nodes']==[{'node':i,'mode':n['mode'],**n['instruction']} for i,n in enumerate(g['nodes'])]
    assert all(not n['mode_conflict'] and n['mode']=='Arm' and n['identity']['program']==req['program'] for n in g['nodes'])
    assert all(o['executability']=='unknown' for o in g['observations'])
    condition_names={0:'eq',1:'ne',8:'hi',10:'ge',11:'lt',14:None}
    nodes={n['instruction']['address']:n['instruction'] for n in g['nodes']}
    for w in own['windows']:
        for i,condition in enumerate(w['condition_nibbles']):
            instruction=nodes[w['extent'][0]+4*i]
            assert instruction['byte_len']==4 and instruction['condition']==condition_names[condition]
    assert c['root']==root and set(root['visited_nodes'])==set(range(81)) and root['edge_examinations']==95 and len(root['frontiers'])==15
    assert c['counts']=={'observations':17,'nodes':81,'edges':95,'visited_nodes':81,'edge_examinations':95,'selected_edges':80,'frontier_edges':15,'unknown_target_edges':11,'mode_conflicts':0}
    for i,(e,ce) in enumerate(zip(edges,c['edges'],strict=True)):
        original=e['original'];target=original['target']
        if target['kind']=='address':
            assert target['mode']=='Arm' and target['mapping']['kind']=='initialized'
            assert target['mapping']['identity']['program']==req['program']
            compact={'address':target['address'],'mode':target['mode'],'mapping':'initialized autoload0 in this exact program','observation_boundary':target['boundary']}
        else:assert target=={'kind':'unknown'};compact=target
        assert ce=={'edge':i,'source_node':e['source_node'],'condition':e['source_condition'],'source':original['source'],'kind':original['kind'],'guard':original['guard'],'target':compact,'resolution':e['resolution']}
    unknown=[e for e in edges if e['original']['target']['kind']=='unknown']
    assert sorted(e['original']['source'] for e in unknown)==expected_bx
    assert all(e['resolution']=={'kind':'frontier','reason':'indirect'} for e in unknown)
    outside=[e['original']['target']['address'] for e in edges if e['resolution']=={'kind':'frontier','reason':'outside_selection'}]
    assert sorted(outside)==[0x037f8470,0x037fced8,0x037fd070,0x037fd0c8]
    assert edges[87]['original']['source']==edges[88]['original']['source']==0x037fcfd4
    assert edges[87]['source_condition']=='eq' and edges[87]['original']['guard']=='condition_passed' and edges[87]['original']['target']=={'kind':'unknown'}
    assert edges[88]['source_condition']=='eq' and edges[88]['original']['guard']=='condition_failed' and edges[88]['resolution']=={'kind':'selected','node':75}
    assert g['nodes'][75]['instruction']['address']==0x037fcfd8
    for passed,failed in [(42,43),(45,46),(48,49),(65,66),(68,69),(71,72)]:
        assert edges[passed]['source_condition']==edges[failed]['source_condition']=='eq'
        assert edges[passed]['original']['guard']=='condition_passed' and edges[failed]['original']['guard']=='condition_failed'
    for i,condition in [(55,'hi'),(60,'hi'),(84,'hi'),(90,'lt'),(91,'ge')]:
        assert edges[i]['source_condition']==condition and edges[i]['original']['guard']=='always' and edges[i]['original']['kind']=='fallthrough'
    assert edges[12]['source_condition']==edges[13]['source_condition']=='ne'
    assert edges[12]['original']['guard']=='condition_passed' and edges[13]['original']['guard']=='condition_failed'
    witnesses=[]
    for w,cw in zip(p['witnesses'][0],c['frontier_witnesses'],strict=True):
        assert cw['reason']==w['reason'] and [edges[i]['original'] for i in cw['edges']]==w['transfers']
        path=w['transfers'];assert path[0]['source']==root['address']
        assert all(a['target'].get('address')==b['source'] for a,b in zip(path,path[1:]))
        assert edges[cw['edges'][-1]]['resolution']['kind']=='frontier'
        witnesses.append({'edges':cw['edges'],'reason':cw['reason'],'guards':[t['guard'] for t in path]})
    graphs.append({'identity':req['program'],'counts':c['counts'],'frontier_witnesses':witnesses,'literal_pool_nodes':0,'unknown_exchanges_unresolved':True})

before=json.loads((OUT/'input-snapshot-before.json').read_bytes());after={n:sha(Path(n).read_bytes()) for n in before};assert after==before
(OUT/'input-snapshot-after.json').write_text(json.dumps(after,indent=2)+'\n')
names=subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r',COMMIT],cwd=REPO,text=True).splitlines();assert len(names)==12
hashes={}
for name in names:
    assert name.startswith('decomp/matching-notes/other-cpus/arm7-arena-getter-')
    frozen=subprocess.check_output(['git','show',COMMIT+':'+name],cwd=REPO)
    assert(REPO/name).read_bytes()==frozen==subprocess.check_output(['git','show','HEAD:'+name],cwd=REPO)
    hashes[name]=sha(frozen)
sources=json.loads((PUBLIC/'external-sources.json').read_bytes())
assert sources['commit']=='38f3650189f8989aed91618745aa74029fa60247'
primary=[s['url'] for s in sources['sources']]
receipt={'status':'accepted','findings':[],'reviewed_commit':COMMIT,'isolated_cherry_pick_commit':subprocess.check_output(['git','rev-parse','HEAD'],cwd=REPO,text=True).strip(),'public_git_blobs_sha256':hashes,'independent_original_read_sha256':sha((OUT/'independent-original-read.json').read_bytes()),'frozen_manifest_sha256':sha((PUBLIC/'frozen-manifest.json').read_bytes()),'request_sha256':full['request_sidecar_sha256'],'full_report_sha256':sha(blob),'full_report_bytes':len(blob),'graphs':graphs,'inputs_unchanged':True,'before_snapshot_sha256':sha((OUT/'input-snapshot-before.json').read_bytes()),'after_snapshot_sha256':sha((OUT/'input-snapshot-after.json').read_bytes()),'packaged_reproduction_exact_outputs':True,'executable_sha256':{n:h for n,h in before.items() if n.endswith('arm7_reachable_probe') or n.endswith('llvm-mc')},'primary_donor_sources_verified':primary,'donor_comparison':'Pinned reconstructed low cases cap/raise via u32 comparisons, matching encoded unsigned HI. High case chooses the low bound by unsigned comparison, then handles zero, negative, and otherwise signed system-stack sizes, consistent with encoded EQ/LT/GE. Donor low ID1 hardcodes 027fafcc; JUS literal is 027f9c08. Pinned memory constants derive 027ff000 and0380ff80. These corroborate a hypothesis, not JUS names/types/ownership.','condition_semantics':'HI uses C=1,Z=0 (unsigned higher); EQ uses Z=1; LT uses N!=V; GE uses N=V. Conditional arithmetic keeps its condition despite an always-fallthrough transfer; BXEQ retains passed unknown target and failed selected continuation. No runtime feasibility or return inference.','scope_review':'Ten frozen nonoverlapping ARM windows and seven separate initialized data reads only; exclusive BSS endpoints remain unmapped. Parent/child program identities and prior roots/selections remain distinct/unchanged. No source/ABI/function extent/runtime/relocation/SDK identity/ownership promotion; canonical304 and T10 unchanged.','source_credit_bytes':0,'canonical_update':False,'T10_complete':False,'independent_scripts_sha256':{n:sha((OUT/n).read_bytes()) for n in ('read_getters.py','check_getter_public.py')},'independent_llvm_logs_sha256':{p.name:sha(p.read_bytes()) for p in OUT.glob('program-*-window-*-llvm.txt')}}
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Accepted, no findings: independent47 instructions/seven literals, guarded81-node95-edge graph, primary donor facts, package replay and12 frozen Git blobs agree.')
