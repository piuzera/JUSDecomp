"""Check root-relative guards and provenance against the actual fresh report."""
import json
from pathlib import Path

OUT = Path(__file__).resolve().parent
report=json.loads((OUT/'report.json').read_bytes())
expected_frontiers=[2,6,16,20,23,24,26]
expected_witnesses=[
    [0,2],
    [0,1,3,4,6],
    [0,1,3,4,5,7,8,9,10,11,12,25,26],
    [0,1,3,4,5,7,8,9,10,11,13,14,15,16],
    [0,1,3,4,5,7,8,9,10,11,13,14,15,17,18,19,20],
    [0,1,3,4,5,7,8,9,10,11,13,14,15,17,18,19,21,22,23],
    [0,1,3,4,5,7,8,9,10,11,13,14,15,17,18,19,21,22,24],
]
receipts=[]
for program in report['programs']:
    g=program['graph'];edges=g['edges'];root,=g['roots']
    assert sorted(f['edge'] for f in root['frontiers'])==expected_frontiers
    assert all(n['instruction']['address']!=0x037fd0cc for n in g['nodes'])
    actual=[]
    for witness,indices in zip(program['witnesses'][0],expected_witnesses,strict=True):
        transfers=witness['transfers']
        assert transfers==[edges[i]['original'] for i in indices]
        assert witness['reason']=='outside_selection'
        assert transfers[0]['source']==root['address']
        assert all(a['target']['address']==b['source'] for a,b in zip(transfers,transfers[1:]))
        assert edges[indices[-1]]['resolution']=={'kind':'frontier','reason':'outside_selection'}
        expected_branch=12 if indices[-1]==26 else (13 if indices[-1] in [16,20,23,24] else None)
        if expected_branch is not None:
            assert expected_branch in indices
            assert edges[expected_branch]['source_condition']=='ne'
            assert edges[expected_branch]['original']['guard']==('condition_passed' if expected_branch==12 else 'condition_failed')
        actual.append({'edges':indices,'last_target':transfers[-1]['target']['address'],'last_guard':transfers[-1]['guard']})
    receipts.append({'identity':program['identity'],'frontier_witnesses':actual,'literal_excluded_from_selected_nodes':True})
(OUT/'witness-checks.json').write_text(json.dumps({'status':'passed','programs':receipts},indent=2)+'\n')
print('All seven per-program frontier witnesses preserve NE and call-return guards; raw literal is excluded from selected code.')
