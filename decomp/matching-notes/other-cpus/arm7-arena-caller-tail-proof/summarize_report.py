"""Retain bounded graph counts, complete compact edges, roots, and witnesses.

Usage: python3 summarize_report.py PRIVATE_REPORT_DIRECTORY
"""
import hashlib
import json
import sys
from pathlib import Path

OUT = Path(sys.argv[1]).resolve()
HERE = Path(__file__).resolve().parent
report_bytes = (OUT / 'report.json').read_bytes()
report = json.loads(report_bytes)
requests = json.loads((HERE / 'requests.json').read_text())
assert hashlib.sha256((HERE / 'requests.json').read_bytes()).hexdigest() == report['request_sidecar_sha256']
assert report['producer_sha256'] == '28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff'
assert report['source_bytes'] == 0 and report['inputs_unchanged']
summary = {key: value for key, value in report.items() if key != 'programs'}
summary['report_sha256'] = hashlib.sha256(report_bytes).hexdigest()
summary['programs'] = []
for program, request in zip(report['programs'], requests, strict=True):
    expected_spans = [(0x037f8468, 0x037f8470), (0x037fcecc, 0x037fced8),
                      (0x037fd02c, 0x037fd044), (0x037fd044, 0x037fd064),
                      (0x037fd0c0, 0x037fd0cc), (0x037fcf04, 0x037fcf2c),
                      (0x037fd064, 0x037fd070), (0x037fd070, 0x037fd0c0)]
    assert [(selection['extent']['start'], selection['extent']['end'])
            for selection in request['selections']] == expected_spans
    assert all(selection['region'] == {'autoload': 0} and selection['mode'] == 'Arm'
               for selection in request['selections'])
    assert request['roots'] == [{'selection': 0, 'address': 0x037f8468,
        'assumption': 'Grounded explicit ARM root; execution and function extent remain unknown'}]
    graph = program['graph']
    root = graph['roots'][0]
    assert program['identity'] == request['program'] == graph['program']
    assert len(graph['observations']) == 8
    assert len(graph['nodes']) == 55 and len(graph['edges']) == 70
    assert set(root['visited_nodes']) == set(range(55)) and root['edge_examinations'] == 70
    assert root['frontiers'] == [{'edge': edge, 'kind': 'edge'} for edge in
        [2, 6, 27, 16, 23, 37, 43, 32, 50, 57, 64]]
    assert all(node['instruction']['address'] != 0x037fd0cc for node in graph['nodes'])
    edges = []
    for index, edge in enumerate(graph['edges']):
        original = edge['original']
        target = original['target']
        if target['kind'] == 'address':
            assert target['mode'] == 'Arm' and target['mapping']['kind'] == 'initialized'
            assert target['mapping']['identity']['program'] == program['identity']
            assert target['mapping']['identity']['region'] == {'autoload': 0}
            compact_target = {'address': target['address'], 'mode': target['mode'],
                              'mapping': 'initialized autoload0 in this exact program',
                              'observation_boundary': target['boundary']}
        else:
            assert target == {'kind': 'unknown'}
            compact_target = target
        edges.append({'edge': index, 'source_node': edge['source_node'],
                      'condition': edge['source_condition'], 'source': original['source'],
                      'kind': original['kind'], 'guard': original['guard'],
                      'target': compact_target, 'resolution': edge['resolution']})
    def edge_at(source, kind):
        found = [edge for edge in edges if edge['source'] == source and edge['kind'] == kind]
        assert len(found) == 1, (source, kind)
        return found[0]
    ne_branch = edge_at(0x037fd040, 'branch')
    ne_fallthrough = edge_at(0x037fd040, 'fallthrough')
    assert ne_branch['condition'] == ne_fallthrough['condition'] == 'ne'
    assert ne_branch['guard'] == 'condition_passed' and ne_branch['target']['address'] == 0x037fd0c0
    assert ne_fallthrough['guard'] == 'condition_failed' and ne_fallthrough['target']['address'] == 0x037fd044
    assert edge_at(0x037fd06c, 'call_continuation')['target']['address'] == 0x037fd070
    expected_calls = [(0x037fd074, 0x037fcf84), (0x037fd080, 0x037fcf18),
                      (0x037fd088, 0x037fcf2c), (0x037fd094, 0x037fcf04),
                      (0x037fd09c, 0x037fcf84), (0x037fd0a8, 0x037fcf18),
                      (0x037fd0b0, 0x037fcf2c), (0x037fd0bc, 0x037fcf04)]
    for source, target in expected_calls:
        call = edge_at(source, 'call')
        continuation = edge_at(source, 'call_continuation')
        assert call['target']['address'] == target and call['guard'] == 'always'
        assert continuation['guard'] == 'call_returned' and continuation['resolution']['kind'] == 'selected'
        assert continuation['target']['address'] == source + 4
        assert call['resolution']['kind'] == ('frontier' if target in (0x037fcf84, 0x037fcf2c) else 'selected')
    assert edge_at(0x037fd0c8, 'exchange')['resolution'] == {'kind': 'frontier', 'reason': 'indirect'}
    witnesses = []
    for witness in program['witnesses'][0]:
        path = []
        for transfer in witness['transfers']:
            matches = [index for index, edge in enumerate(graph['edges']) if edge['original'] == transfer]
            assert len(matches) == 1
            path.append(matches[0])
        witnesses.append({'reason': witness['reason'], 'edges': path})
    assert all(not node['mode_conflict'] and node['identity']['program'] == program['identity']
               for node in graph['nodes'])
    summary['programs'].append({'identity': program['identity'], 'root': root,
        'nodes': [{'node': index, 'mode': node['mode'], **node['instruction']}
                  for index, node in enumerate(graph['nodes'])],
        'edges': edges, 'frontier_witnesses': witnesses,
        'counts': {'observations': 8, 'nodes': 55, 'edges': 70, 'visited_nodes': 55,
                   'edge_examinations': 70, 'selected_edges': 59, 'frontier_edges': 11,
                   'unknown_target_edges': 3, 'mode_conflicts': 0}})
(OUT / 'graph-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print('Exact identities, ID-7/8 calls, counts, NE/return guards, unknown exchanges, and witnesses pass.')
