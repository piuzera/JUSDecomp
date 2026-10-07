import json,hashlib
from pathlib import Path
P=Path('/private/tmp/jus-arm7-reachable-root-proof')
G=Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-reachable-grounding-proof')
old=json.loads((G/'observations.json').read_text())
assert hashlib.sha256((G/'observations.json').read_bytes()).hexdigest()=='694228421e131c7c390c57963f36812be7eb2f0cd60287e0d3a3a22dbb209167'
results=[]
for name,indices in [('calls',[2,3]),('startup',[0,1])]:
 report=json.loads((P/f'{name}-report.json').read_text())
 requests=json.loads((P/f'{name}-requests.json').read_text())
 assert len(report['programs'])==len(old['programs'])==len(requests)==2
 assert report['source_bytes']==0
 for field in ('function_extents_established','executable_coverage_established','original_relocations_established','arm7_binary_baseline_complete'):assert report[field] is False
 for item,baseline,request in zip(report['programs'],old['programs'],requests):
  graph=item['graph'];identity=baseline['identity']
  assert item['identity']==graph['program']==request['program']==identity
  observations=[baseline['observations'][i] for i in indices]
  assert graph['observations']==observations
  assert graph['scope']=='root_assumed_selected_interpretations'
  instructions=[(observation['identity'],observation['selection']['mode'],ins) for observation in observations for ins in observation['instructions']]
  assert sorted((json.dumps(i,sort_keys=True),m,json.dumps(ins,sort_keys=True)) for i,m,ins in instructions)==sorted((json.dumps(n['identity'],sort_keys=True),n['mode'],json.dumps(n['instruction'],sort_keys=True)) for n in graph['nodes'])
  transfers=[t for observation in observations for t in observation['transfers']]
  assert sorted(json.dumps(t,sort_keys=True) for t in transfers)==sorted(json.dumps(e['original'],sort_keys=True) for e in graph['edges'])
  for e in graph['edges']:
   node=graph['nodes'][e['source_node']];t=e['original'];assert node['instruction']['address']==t['source'] and e['source_condition']==node['instruction']['condition']
   if e['resolution']['kind']=='selected':
    target=graph['nodes'][e['resolution']['node']];assert t['target']['mapping']['identity']==target['identity']
    assert t['target']['address']==target['instruction']['address'] and t['target']['mode']==target['mode']
  for root,req,witnesses in zip(graph['roots'],request['roots'],item['witnesses']):
   assert root['identity']==observations[req['selection']]['identity'] and root['mode']=='Arm'
   assert root['address']==req['address'] and root['assumption']==req['assumption']
   assert len(set(root['visited_nodes']))==len(root['visited_nodes'])<=len(graph['nodes'])
   assert root['edge_examinations']<=len(graph['edges'])
   for witness in witnesses:
    assert len(witness['transfers'])<=len(graph['nodes'])
    assert all(t in transfers for t in witness['transfers'])
  if name=='calls':
   assert len(graph['nodes'])==5 and len(graph['edges'])==7
   assert sum(e['resolution']['kind']=='selected' for e in graph['edges'])==4
   assert len(graph['roots'][0]['visited_nodes'])==5 and graph['roots'][0]['edge_examinations']==7
   witnesses=item['witnesses'][0];assert len(witnesses)==3
   by_target={w['transfers'][-1]['target']['address']:w for w in witnesses}
   assert set(by_target)=={0x037f8470,0x037fd02c,0x037fced8}
   for destination in (0x037fd02c,0x037fced8):assert [t['source'] for t in by_target[destination]['transfers']]==[0x037f8468,0x037f846c,0x037fcecc,0x037fced0,0x037fced4]
   assert by_target[0x037fd02c]['transfers'][-1]['kind']=='call'
   assert by_target[0x037f8470]['transfers'][-1]['guard']==by_target[0x037fced8]['transfers'][-1]['guard']=='call_returned'
  else:
   assert len(graph['nodes'])==14 and len(graph['edges'])==15
   assert [len(r['visited_nodes']) for r in graph['roots']]==[11,3]
   assert [r['edge_examinations'] for r in graph['roots']]==[12,3]
   loop=next(e for e in graph['edges'] if e['original']['source']==0x02380028 and e['original']['guard']=='condition_passed')
   assert graph['nodes'][loop['resolution']['node']]['instruction']['address']==0x02380020
   assert loop['source_condition']=='lt'
   untaken=next(e for e in graph['edges'] if e['original']['source']==0x02380028 and e['original']['guard']=='condition_failed')
   assert untaken['original']['target']['address']==0x0238002c and untaken['resolution']['reason']=='outside_selection'
   exchange=next(e for e in graph['edges'] if e['original']['source']==0x023800c8)
   assert exchange['original']['target']['kind']=='unknown' and exchange['resolution']['reason']=='indirect'
  results.append({'fixture':name,'program':identity,'observations_exact_accepted':True,'nodes':len(graph['nodes']),'transfers':len(graph['edges']),'root_visits':[len(r['visited_nodes']) for r in graph['roots']],'edge_examinations':[r['edge_examinations'] for r in graph['roots']]})
(P/'graph-readback.json').write_text(json.dumps({'status':'passed','program_fixtures':results,'source_bytes':0,'T10_complete':False},indent=2)+'\n')
print('PASS: four independently checked program/fixture graphs, exact original observations, full identities, conditions, guards, witnesses and finite bounds')
