#!/usr/bin/env python3
"""Reconcile reviewed aliases with DSD identities without changing link symbols.

Scope is the declared ARM9 metadata, including ITCM/DTCM and overlays. ARM7 and
embedded executables remain unclassified. Data extents and C layouts are never
inferred from adjacent symbols. Evidence snapshots are recorded; optional local
provenance verification checks the referenced document hashes and closed beads.
"""
import argparse
import hashlib
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

FIELDS = ('rom_sha256', 'cpu', 'module', 'section', 'address', 'mode')
SECTION = re.compile(r'^\s+(\.[\w.]+)\s+start:(0x[0-9a-fA-F]+)\s+end:(0x[0-9a-fA-F]+)')
SYMBOL = re.compile(r'^(\S+)\s+kind:(\S+)\s+addr:(0x[0-9a-fA-F]+)(?:\s.*)?$')
FUNCTION = re.compile(r'function\((arm|thumb),size=(0x[0-9a-fA-F]+)\)')


def _hash(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def _key(identity):
    if set(identity) != set(FIELDS):
        raise ValueError('identity requires exactly ROM/CPU/module/section/address/mode')
    return tuple(identity[x] for x in FIELDS)


def load_identities(config_root: Path, rom_sha256: str) -> dict:
    """Read DSD symbol/section authority; preserve module identity and raw kinds."""
    root = Path(config_root)
    if not re.fullmatch('[0-9a-f]{64}', rom_sha256):
        raise ValueError('ROM SHA256 must be lowercase 64-digit hex')
    records, units, hashes, modules = [], [], {}, set()
    paths = sorted((root / 'arm9').rglob('symbols.txt'))
    if not paths:
        raise ValueError('no declared ARM9 symbols metadata')
    for path in paths:
        relative = path.parent.relative_to(root / 'arm9')
        parts = relative.parts
        if not parts:
            module = 'main'
        elif parts in [('itcm',), ('dtcm',)]:
            module = parts[0]
        elif len(parts) == 2 and parts[0] == 'overlays' and re.fullmatch(r'ov\d{3}', parts[1]):
            module = parts[1]
        else:
            raise ValueError(f'unknown DSD module directory: {relative}')
        modules.add(module)
        delinks = path.with_name('delinks.txt')
        sections, tu, tu_sections = [], None, []
        for line in delinks.read_text().splitlines():
            if line and not line[0].isspace() and line.endswith(':'):
                if tu:
                    units.append({'module': module, 'object': str(Path(tu).with_suffix('.o')), 'sections': tu_sections})
                tu, tu_sections = line[:-1], []
            match = SECTION.match(line)
            if match:
                name, start, end = match.groups()
                section = {'name': name, 'start': int(start, 16), 'end': int(end, 16)}
                if section['end'] < section['start']:
                    raise ValueError('negative DSD section extent')
                (tu_sections if tu else sections).append(section)
        if tu:
            units.append({'module': module, 'object': str(Path(tu).with_suffix('.o')), 'sections': tu_sections})
        for metadata in (path, delinks):
            hashes[str(metadata.relative_to(root))] = _hash(metadata)
        for line in path.read_text().splitlines():
            if not line.strip() or line.lstrip().startswith('//'):
                continue
            match = SYMBOL.fullmatch(line)
            if not match:
                raise ValueError(f'unsupported DSD symbol row in {path.relative_to(root)}')
            name, raw_kind, address = match.groups()
            address = int(address, 16)
            containing = [s for s in sections if s['start'] <= address < s['end']]
            if len(containing) != 1:
                raise ValueError(f'symbol {name} has missing/ambiguous DSD section')
            function = FUNCTION.fullmatch(raw_kind)
            kind = raw_kind.split('(')[0]
            if kind not in ('function', 'data', 'bss', 'label') or (kind == 'function' and not function):
                raise ValueError(f'unsupported DSD kind: {raw_kind}')
            mode, size = (function[1], int(function[2], 16)) if function else ('data' if kind in ('data','bss') else 'unknown', None)
            if size is not None and (size <= 0 or address + size > containing[0]['end']):
                raise ValueError(f'function {name} exceeds declared section')
            records.append({'identity': dict(zip(FIELDS, (rom_sha256, 'arm9', module, containing[0]['name'], address, mode))),
                            'dsd_name': name, 'kind': kind, 'raw_kind': raw_kind, 'size': size,
                            'metadata': str(path.relative_to(root))})
    return {'schema_version': 1, 'rom_sha256': rom_sha256, 'symbols': records, 'translation_units': units,
            'metadata_sha256': hashes, 'scope': {'cpu': 'arm9', 'modules': sorted(modules),
            'unclassified': ['arm7', 'embedded_executables'], 'global_coverage_percent': None}}


def _provenance(claim, root):
    evidence = claim.get('provenance')
    if not claim.get('reviewed') or claim.get('confidence') not in ('confirmed_static', 'confirmed_runtime', 'cross_confirmed') or not evidence:
        raise ValueError('claim needs reviewed confirmed evidence with bead provenance')
    for item in evidence:
        if item.get('repository') != 'jus_re' or item.get('bead_status') != 'closed' or not item.get('bead','').startswith('jus-') or not item.get('summary'):
            raise ValueError('reviewed provenance requires a closed jus_re bead and evidence summary')
        if not re.fullmatch('[0-9a-f]{40}', item.get('commit','')) or not re.fullmatch('[0-9a-f]{64}', item.get('sha256','')):
            raise ValueError('provenance commit/document hashes missing')
        path = Path(item.get('path',''))
        if path.is_absolute() or '..' in path.parts or not path.parts:
            raise ValueError('invalid provenance document path')
        if root is not None:
            if _hash(Path(root) / path) != item['sha256']:
                raise ValueError('provenance document hash mismatch')
            beads = [json.loads(line) for line in (Path(root)/'.beads/issues.jsonl').read_text().splitlines() if line.strip()]
            matches = [b for b in beads if b['id'] == item['bead']]
            if len(matches) != 1 or matches[0]['status'] != 'closed':
                raise ValueError('provenance bead absent or not closed')


def _source_symbols(inventory, source):
    result = {'status': 'not_requested', 'verified': [], 'findings': []}
    if source is None:
        return result
    result['status'] = 'passed'
    if source.get('status') != 'passed' or not source.get('units'):
        result.update(status='unresolved', findings=['source build absent or not passed'])
        return result
    for unit in source['units']:
        try:
            if unit.get('status') != 'passed':
                raise ValueError('source unit not passed')
            placements = [x for x in inventory['translation_units'] if x['module'] == unit['module'] and x['object'] == unit['object']]
            if len(placements) != 1:
                raise ValueError('missing/ambiguous authoritative TU placement')
            for kind in ('reference','compiled'):
                evidence = unit[kind]
                if _hash(evidence['path']) != evidence['sha256']:
                    raise ValueError('source object hash differs from gate evidence')
            sys.path.insert(0,str(Path(__file__).resolve().parent))
            try:
                from source_build import compare_objects
                actual = compare_objects(Path(unit['reference']['path']),Path(unit['compiled']['path']),unit['functions'])
            finally:
                sys.path.pop(0)
            functions = unit.get('checks',{}).get('functions',[])
            if actual['functions'] != functions:
                raise ValueError('actual source object functions differ from gate report')
            if not functions or sorted(x['name'] for x in functions) != sorted(unit['functions']):
                raise ValueError('source function inventory differs from declaration')
            for function in functions:
                sections = [s for s in placements[0]['sections'] if s['name'] == function['section']]
                if len(sections) != 1:
                    raise ValueError('missing/ambiguous source section placement')
                address = sections[0]['start'] + function['offset']
                if function['offset'] < 0 or address + function['size'] > sections[0]['end']:
                    raise ValueError('source function exceeds authoritative complete-TU extent')
                matches = [s for s in inventory['symbols'] if s['dsd_name'] == function['name'] and s['identity']['module'] == unit['module']]
                if len(matches) != 1 or matches[0]['kind'] != 'function' or matches[0]['size'] != function['size'] or matches[0]['identity']['mode'] != function['mode'] or matches[0]['identity']['section'] != function['section'] or matches[0]['identity']['address'] != address:
                    raise ValueError('source function kind/extent/mode/placement differs from DSD authority')
                result['verified'].append({'object': unit['object'], 'identity': matches[0]['identity'], 'name': function['name'], 'size': function['size']})
        except (ValueError,OSError,KeyError,TypeError) as exc:
            result['status'] = 'unresolved';result['findings'].append(str(exc))
    return result


def reconcile_aliases(inventory: dict, manifest: dict, *, provenance_root=None, source_build=None) -> dict:
    """Return per-identity evidence/aliases; unresolved claims never rename DSD symbols.

    primary_name/type claims are exclusive per identity. role=alias can retain
    multiple reviewed alternate names. Unsupported or uncertain claims are kept
    with reasons. Optional source evidence reconciles gate-verified function
    kinds/extents/modes with authoritative complete-TU placement.
    """
    by_identity = defaultdict(list)
    for symbol in inventory['symbols']:
        by_identity[_key(symbol['identity'])].append(symbol)
    groups = defaultdict(list)
    invalid = []
    for claim in manifest.get('claims',[]):
        try: groups[_key(claim['identity'])].append(claim)
        except (ValueError,KeyError,TypeError): invalid.append(claim)
    result = {'schema_version': 1, 'status': 'passed', 'counts': {'accepted':0,'unresolved':0}, 'records':[],
              'scope': inventory['scope'], 'metadata_sha256': inventory['metadata_sha256'],
              'provenance_verification': 'local_documents_and_beads' if provenance_root is not None else 'recorded_pins',
              'source_symbols': _source_symbols(inventory,source_build)}
    valid_manifest = manifest.get('schema_version') == 1 and manifest.get('rom_sha256') == inventory['rom_sha256'] and isinstance(manifest.get('claims'),list) and bool(manifest['claims'])
    for key, claims in list(groups.items()) + [(None,[c]) for c in invalid]:
        symbols = by_identity.get(key,[])
        record = {'identity': claims[0].get('identity') if isinstance(claims[0],dict) else None, 'dsd_names': sorted({s['dsd_name'] for s in symbols}),
                  'claims': claims, 'accepted_aliases': [], 'accepted_types': [], 'status':'passed'}
        reasons = []
        for claim in claims:
            try:
                if not valid_manifest or key is None or not symbols:
                    raise ValueError('manifest or complete symbol identity does not match DSD authority')
                matches = [s for s in symbols if s['dsd_name'] == claim.get('dsd_name')]
                if len(matches) != 1 or matches[0]['kind'] != claim.get('kind') or matches[0]['size'] != claim.get('size'):
                    raise ValueError('claimed DSD name/kind/extent differs from authority')
                if claim.get('role') not in ('primary_name','alias','type') or not claim.get('alias'):
                    raise ValueError('unknown claim role or empty alias')
                _provenance(claim,provenance_root)
            except (ValueError,OSError,KeyError,TypeError) as exc:
                reasons.append(str(exc))
        for role in ('primary_name','type'):
            if len({c.get('alias') for c in claims if isinstance(c,dict) and c.get('role') == role}) > 1:
                reasons.append(f'conflicting {role} claims retained')
        if reasons:
            record.update(status='unresolved',reason='; '.join(sorted(set(reasons))))
            result['counts']['unresolved'] += len(claims)
        else:
            record['accepted_aliases'] = sorted({c['alias'] for c in claims if c['role'] != 'type'})
            record['accepted_types'] = sorted({c['alias'] for c in claims if c['role'] == 'type'})
            result['counts']['accepted'] += len(claims)
        result['records'].append(record)
    if result['counts']['unresolved'] or not valid_manifest or result['source_symbols']['status'] == 'unresolved':
        result['status'] = 'unresolved'
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--aliases', type=Path, required=True)
    parser.add_argument('--provenance-root', type=Path)
    parser.add_argument('--source-build', type=Path)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    try:
        manifest = json.loads(args.aliases.read_text())
        if not isinstance(manifest,dict):
            raise ValueError('alias manifest must be an object')
        inventory = load_identities(args.config,manifest['rom_sha256'])
        result = reconcile_aliases(inventory,manifest,provenance_root=args.provenance_root,
                                  source_build=json.loads(args.source_build.read_text()) if args.source_build else None)
    except (ValueError,OSError,KeyError,TypeError) as exc:
        result = {'schema_version':1,'status':'unresolved','reason':str(exc)}
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    return 0 if result['status'] == 'passed' else 1


if __name__ == '__main__': raise SystemExit(main())
