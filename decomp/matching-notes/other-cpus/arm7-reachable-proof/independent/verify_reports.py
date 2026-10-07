import hashlib,json
from pathlib import Path
P=Path('/private/tmp/jus-arm7-reachable-review-proof'); oracle=json.loads(Path('/private/tmp/jus-track-a/build/arm7-reachable-root-grounding/observations.json').read_text());summary=[]
for case,indexes in [('calls',[2,3]),('startup',[0,1])]:
 report=json.loads((P/f'{case}-report.json').read_text());requests=json.loads((P/f'{case}-requests.json').read_text());assert len(report['programs'])==2
 assert report['inputs_unchanged'] and report['source_bytes']==0
 for flag in ['arm7_binary_baseline_complete','function_extents_established','executable_coverage_established','original_relocations_established']:assert report[flag] is False
 for row,reference,request in zip(report['programs'],oracle['programs'],requests):
  g=row['graph']; selected=[reference['observations'][i] for i in indexes];identity=reference['identity']
  assert row['identity']==g['program']==identity; assert g['scope']=='root_assumed_selected_interpretations';assert g['observations']==selected
  expected_nodes=[(o,i) for o in selected for i in o['instructions']]
  assert len(g['nodes'])==len(expected_nodes)
  for node,(o,i) in zip(g['nodes'],expected_nodes):assert node['identity']==o['identity'] and node['instruction']==i and node['mode']==o['selection']['mode'] and node['mode_conflict'] is False
  expected_transfers=[t for o in selected for t in o['transfers']]; assert [e['original'] for e in g['edges']]==expected_transfers
  starts={n['instruction']['address']:i for i,n in enumerate(g['nodes'])}
  for edge in g['edges']:
   src=g['nodes'][edge['source_node']];assert edge['original']['source']==src['instruction']['address'];assert edge['source_condition']==src['instruction']['condition']
   target=edge['original']['target'];resolution=edge['resolution']
   if target['kind']=='unknown':assert resolution=={'kind':'frontier','reason':'indirect'}
   else:
    assert target['mode']=='Arm';assert target['mapping']['kind']=='initialized';assert target['mapping']['identity']['program']==identity
    if target['address'] in starts:assert resolution=={'kind':'selected','node':starts[target['address']]}
    else:assert resolution=={'kind':'frontier','reason':'outside_selection'}
  for root,req,witnesses in zip(g['roots'],request['roots'],row['witnesses']):
   assert root['address']==req['address'] and root['assumption']==req['assumption'];assert root['identity']==selected[req['selection']]['identity'] and root['mode']=='Arm'
   n=len(g['nodes']);e=len(g['edges']);assert len(root['visited_nodes'])<=n and root['edge_examinations']<=e;assert len(set(root['visited_nodes']))==len(root['visited_nodes'])
   assert len(root['frontiers'])==len(witnesses)
   for site,witness in zip(root['frontiers'],witnesses):
    assert site['kind']=='edge';edge=g['edges'][site['edge']];assert witness['reason']==edge['resolution']['reason'];path=witness['transfers'];assert path and len(path)<=n and path[0]['source']==root['address'];assert path[-1]==edge['original']
    for i,t in enumerate(path):
     assert t in expected_transfers
     if i:assert path[i-1]['target']['address']==t['source']
  if case=='calls':
   assert (len(g['nodes']),len(g['edges']),sum(e['resolution']['kind']=='selected' for e in g['edges']),len(g['roots'][0]['frontiers']))==(5,7,4,3)
   w=next(w for w in row['witnesses'][0] if w['transfers'][-1]['target']['address']==0x037fd02c)
   assert [t['source'] for t in w['transfers']]==[0x037f8468,0x037f846c,0x037fcecc,0x037fced0,0x037fced4]
   assert [t['kind'] for t in w['transfers']]==['fallthrough','call','fallthrough','fallthrough','call']
   assert sorted(w['transfers'][-1]['target']['address'] for w in row['witnesses'][0])==[0x037f8470,0x037fced8,0x037fd02c]
  else:
   assert [(len(r['visited_nodes']),r['edge_examinations']) for r in g['roots']]==[(11,12),(3,3)]
   loop=next(e for e in g['edges'] if e['original']['source']==0x02380028 and e['original']['kind']=='branch');assert loop['original']['guard']=='condition_passed' and loop['original']['target']['address']==0x02380020 and loop['source_condition']=='lt'
   assert row['witnesses'][0][0]['transfers'][-1]['guard']=='condition_failed';assert row['witnesses'][0][0]['transfers'][-1]['target']['address']==0x0238002c
   assert row['witnesses'][1][0]['reason']=='indirect'; assert row['witnesses'][1][0]['transfers'][-1]=={'source':0x023800c8,'kind':'exchange','guard':'always','target':{'kind':'unknown'}}
  summary.append({'case':case,'program':identity,'nodes':len(g['nodes']),'transfers':len(g['edges']),'root_work':[[len(r['visited_nodes']),r['edge_examinations']] for r in g['roots']],'frontiers':[len(r['frontiers']) for r in g['roots']]})
assert oracle['programs'][0]['identity']!=oracle['programs'][1]['identity']
(P/'report-comparison.json').write_text(json.dumps({'result':'actual reports match pinned observations, rooted candidate paths and guarded frontiers','program_cases':summary},indent=2)+'\n');print('All 4 program/case reports pass edge-for-edge and root/witness checks')
