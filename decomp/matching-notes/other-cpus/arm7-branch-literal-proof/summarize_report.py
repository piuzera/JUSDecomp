"""Validate and compact the exact frozen-probe output without new graph semantics."""
import hashlib
import json
import sys
from pathlib import Path

PROOF = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path(__file__).resolve().parent
BASE = Path('/private/tmp/jus-arm7-branch-grounding/decomp/matching-notes/other-cpus')
report_bytes = (PROOF / 'report.json').read_bytes()
report = json.loads(report_bytes)
requests = json.loads((PROOF / 'requests.json').read_text())
prior = json.loads((BASE / 'arm7-callee-prefix-proof/requests.json').read_text())
assert hashlib.sha256((PROOF / 'requests.json').read_bytes()).hexdigest() == report['request_sidecar_sha256']
assert report['inputs_unchanged'] and report['source_bytes'] == 0
for before, after in zip(prior, requests, strict=True):
    assert before['program'] == after['program'] and before['roots'] == after['roots']
    assert before['selections'] == after['selections'][:3] and len(after['selections']) == 5
summary = {key: value for key, value in report.items() if key != 'programs'}
summary['report_sha256'] = hashlib.sha256(report_bytes).hexdigest()
summary['programs'] = []
for program, request in zip(report['programs'], requests, strict=True):
    graph = program['graph']
    root = graph['roots'][0]
    assert program['identity'] == request['program'] == graph['program']
    assert len(graph['nodes']) == 21 and len(graph['edges']) == 27
    assert set(root['visited_nodes']) == set(range(21)) and root['edge_examinations'] == 27
    assert root['frontiers'] == [{'edge': edge, 'kind': 'edge'} for edge in [2, 6, 26, 16, 20, 23, 24]]
    assert all(not node['mode_conflict'] and node['identity']['program'] == program['identity']
               and node['mode'] == 'Arm' for node in graph['nodes'])
    assert graph['edges'][12]['source_condition'] == graph['edges'][13]['source_condition'] == 'ne'
    assert graph['edges'][12]['original']['guard'] == 'condition_passed'
    assert graph['edges'][13]['original']['guard'] == 'condition_failed'
    assert graph['edges'][12]['resolution'] == {'kind': 'selected', 'node': 19}
    assert graph['edges'][13]['resolution'] == {'kind': 'selected', 'node': 11}
    edges = []
    for index, edge in enumerate(graph['edges']):
        original = edge['original']
        target = original['target']
        assert target['kind'] == 'address' and target['mode'] == 'Arm'
        assert target['mapping']['kind'] == 'initialized'
        assert target['mapping']['identity']['program'] == program['identity']
        assert target['mapping']['identity']['region'] == {'autoload': 0}
        edges.append({'edge': index, 'source_node': edge['source_node'],
                      'source_condition': edge['source_condition'], 'source': original['source'],
                      'kind': original['kind'], 'guard': original['guard'], 'target': target['address'],
                      'target_mode': target['mode'], 'observation_boundary': target['boundary'],
                      'mapping': 'initialized autoload0 in this exact program',
                      'resolution': edge['resolution']})
    witnesses = []
    for witness in program['witnesses'][0]:
        path = []
        for transfer in witness['transfers']:
            matches = [index for index, edge in enumerate(graph['edges']) if edge['original'] == transfer]
            assert len(matches) == 1
            path.append(matches[0])
        witnesses.append({'reason': witness['reason'], 'edges': path})
    assert [witness['edges'][-1] for witness in witnesses] == [2, 6, 26, 16, 20, 23, 24]
    summary['programs'].append({'identity': program['identity'], 'scope': graph['scope'],
        'nodes': [{'node': index, 'mode': node['mode'], 'mode_conflict': node['mode_conflict'],
                   **node['instruction']} for index, node in enumerate(graph['nodes'])],
        'edges': edges, 'root': root, 'frontier_witnesses': witnesses,
        'observations': [{'selection': observation['selection'], 'executability': observation['executability'],
                          'instruction_count': len(observation['instructions']),
                          'transfer_count': len(observation['transfers'])} for observation in graph['observations']],
        'counts': {'observations': 5, 'nodes': 21, 'edges': 27, 'visited_nodes': 21,
                   'edge_examinations': 27, 'selected_edges': 20, 'frontier_edges': 7,
                   'unknown_target_edges': 0, 'mode_conflicts': 0}})
(PROOF / 'graph-summary.json').write_text(json.dumps(summary, indent=2) + '\n')
print('Exact identities, unchanged prior selections/root, NE resolutions, all edges and witnesses pass.')
