import hashlib,json,subprocess,sys
from pathlib import Path
proof=Path(__file__).resolve().parent
source=Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus')
spans=json.loads((source/'arm7-reachable-grounding-proof/spans.json').read_text())
golden=json.loads((source/'arm7-reachable-grounding-proof/observations.json').read_text())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
exe=Path(sys.argv[1]).resolve()
commands=[]
for name,indices in [('calls',[2,3]),('startup',[0,1])]:
    requests=[]
    for base in [0,4]:
        selected=[spans[base+i] for i in indices]
        roots=[dict(selection=0,address=selected[0]['extent']['start'],assumption='Grounded explicit ARM root; execution and function extent remain unknown')]
        if name=='startup': roots.append(dict(selection=1,address=0x023800c0,assumption='Independent selected ARM BX suffix; no path from header across the unselected gap asserted'))
        requests.append(dict(program=selected[0]['program'],selections=[{k:v for k,v in s.items() if k!='program'} for s in selected],roots=roots))
    manifest=proof/f'{name}-requests.json';manifest.write_text(json.dumps(requests,indent=2)+'\n')
    layout=source/'arm7-checked-layouts.json'
    argv=[str(exe),'/Users/djdjo/Documents/mine/rom/jus.nds',str(layout),sha(layout),str(manifest),sha(manifest),sha(exe)]
    result=subprocess.run(argv,capture_output=True,text=True)
    assert result.returncode==0,result.stderr
    report=json.loads(result.stdout)
    assert report.get('status')=='bounded_arm7_candidate_graphs_verified',report
    assert report['inputs_unchanged'] and report['source_bytes']==0
    assert report['producer_sha256']==sha(exe)
    assert not report['function_extents_established'] and not report['executable_coverage_established']
    assert len(report['programs'])==2
    assert report['programs'][0]['identity']!=report['programs'][1]['identity']
    for program,old in zip(report['programs'],golden['programs']):
        graph=program['graph']; nodes=graph['nodes']; edges=graph['edges']
        assert graph['observations']==[old['observations'][i] for i in indices]
        assert graph['scope']=='root_assumed_selected_interpretations'
        for root in graph['roots']:
            assert len(root['visited_nodes'])==len(set(root['visited_nodes']))<=len(nodes)
            assert root['edge_examinations']<=len(edges)
        if name=='calls':
            assert len(nodes)==5 and len(edges)==7
            assert sum(e['resolution']['kind']=='selected' for e in edges)==4
            assert sum(e['resolution']['kind']=='frontier' for e in edges)==3
            assert len(graph['roots'][0]['visited_nodes'])==5 and graph['roots'][0]['edge_examinations']==7
            witnesses=program['witnesses'][0]
            assert [t['source'] for t in witnesses[-1]['transfers']]==[0x037f8468,0x037f846c,0x037fcecc,0x037fced0,0x037fced4]
            assert witnesses[-1]['transfers'][-1]['target']['address']==0x037fced8
            assert any(w['transfers'][-1]['target'].get('address')==0x037fd02c for w in witnesses)
        else:
            assert len(nodes)==14 and len(edges)==15
            back=next(e for e in edges if e['original']['source']==0x02380028 and e['original']['guard']=='condition_passed')
            assert nodes[back['resolution']['node']]['instruction']['address']==0x02380020
            bx=next(e for e in edges if e['original']['source']==0x023800c8)
            assert bx['resolution']==dict(kind='frontier',reason='indirect') and bx['original']['target']['kind']=='unknown'
            assert [len(r['visited_nodes']) for r in graph['roots']]==[11,3]
            assert [r['edge_examinations'] for r in graph['roots']]==[12,3]
    (proof/f'{name}-report.json').write_text(result.stdout)
    commands.append(argv)
(proof/'commands.json').write_text(json.dumps(commands,indent=2)+'\n')
print('PASS: separate parent/child calls and startup, exact 8 original observations, N/E bounds, cycle, unknown BX')
