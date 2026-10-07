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
                      (0x037fd0c0, 0x037fd0c8), (0x037fcf04, 0x037fcf2c),
                      (0x037fd064, 0x037fd070)]
    assert [(selection['extent']['start'], selection['extent']['end'])
            for selection in request['selections']] == expected_spans
    assert all(selection['region'] == {'autoload': 0} and selection['mode'] == 'Arm'
               for selection in request['selections'])
    assert request['roots'] == [{'selection': 0, 'address': 0x037f8468,
        'assumption': 'Grounded explicit ARM root; execution and function extent remain unknown'}]
    graph = program['graph']
    root = graph['roots'][0]
    assert program['identity'] == request['program'] == graph['program']
    assert len(graph['nodes']) == 34 and len(graph['edges']) == 41
    assert set(root['visited_nodes']) == set(range(34)) and root['edge_examinations'] == 41
    assert root['frontiers'] == [{'edge': edge, 'kind': 'edge'} for edge in [2, 6, 26, 16, 23, 36, 40, 31]]
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
    assert edges[12]['guard'] == 'condition_passed' and edges[13]['guard'] == 'condition_failed'
    assert graph['edges'][20]['resolution'] == {'kind': 'selected', 'node': 26}
    assert graph['edges'][24]['resolution'] == {'kind': 'selected', 'node': 31}
    assert graph['edges'][39]['resolution'] == {'kind': 'selected', 'node': 21}
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
        'counts': {'observations': 7, 'nodes': 34, 'edges': 41, 'visited_nodes': 34,
                   'edge_examinations': 41, 'selected_edges': 33, 'frontier_edges': 8,
                   'unknown_target_edges': 2, 'mode_conflicts': 0}})
(OUT / 'graph-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print('Exact identities, counts, selected joins, NE/return guards, unknown exchanges, and witnesses pass.')
