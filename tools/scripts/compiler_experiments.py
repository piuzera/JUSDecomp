#!/usr/bin/env python3
"""Reproduce bounded, header-free compiler experiments without source promotion.

Targets are dsd whole-function reference TUs. Reports contain digests, relocation
metadata and mismatch offsets, never original instruction payloads. Equivalence
sets describe only the saved source and contexts, not original compiler identity.
"""
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from source_build import compare_objects, _object, _relocations, _functions, _masked, require_header_free


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def context_hash(context):
    value = {key: value for key, value in context.items() if key not in ('id', 'sha256')}
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def inside(root, name):
    result = (root / name).resolve()
    if not result.is_relative_to(root.resolve()):
        raise ValueError('input path escapes root')
    return result


def validate_unit(unit, root):
    source = inside(Path(root), unit['source'])
    if digest(source) != unit['source_sha256']:
        raise ValueError('source hash differs from saved experiment')
    if source.suffix != '.c':
        raise ValueError('this bounded experiment supports C only')
    for context in unit['contexts']:
        if context_hash(context) != context['sha256']:
            raise ValueError('context hash differs from saved experiment')
        require_header_free(source, context['flags'], context['headers'], context['include_paths'])


def validate_compiler(compiler, tool_root):
    directory = inside(Path(tool_root), compiler['package'])
    actual = {path.name: digest(path) for path in directory.iterdir()
              if path.is_file() and path.suffix.lower() in ('.exe', '.dll')}
    if actual != compiler['binaries'] or actual.get('mwccarm.exe') != compiler['sha256']:
        raise ValueError('compiler package binary hash/inventory differs from saved experiment')


def summarize_object(path):
    elf, symbols, sections = _object(path)
    relocations = _relocations(elf, symbols, sections)
    summary = {'sha256': digest(path), 'functions': list(_functions(elf, symbols).values()),
               'relocations': relocations, 'sections': []}
    for name, (_, section) in sorted(sections.items()):
        summary['sections'].append({'name': name, 'size': section[5], 'flags': section[2],
                                    'sha256': hashlib.sha256(elf.content(section)).hexdigest()
                                    if section[1] == 1 else None})
    return summary


def emitted_fingerprint(summary):
    value = {key: summary[key] for key in ('functions', 'sections', 'relocations')}
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def mismatch_offsets(reference, compiled):
    ref, rs, rsecs = _object(reference)
    obj, cs, csecs = _object(compiled)
    rr = _relocations(ref, rs, rsecs); cr = _relocations(obj, cs, csecs)
    result = {}
    for name in sorted(set(rsecs) & set(csecs)):
        left, right = rsecs[name][1], csecs[name][1]
        if left[1] != 1 or right[1] != 1:
            continue
        a = _masked(ref.content(left), [r for r in rr if r['section'] == name])
        b = _masked(obj.content(right), [r for r in cr if r['section'] == name])
        result[name] = {'reference_size': len(a), 'compiled_size': len(b),
                        'positions': [i for i in range(max(len(a), len(b)))
                                      if a[i:i + 1] != b[i:i + 1]]}
    return result


def validate_manifest(manifest):
    if manifest['schema_version'] != 1:
        raise ValueError('unsupported experiment schema')
    packages = [compiler['package'] for compiler in manifest['compilers']]
    if not packages or len(packages) != len(set(packages)):
        raise ValueError('nonempty unique compiler inventory required')
    objects = [unit['object'] for unit in manifest['translation_units']]
    if not objects or len(objects) != len(set(objects)):
        raise ValueError('nonempty unique target inventory required')
    for unit in manifest['translation_units']:
        ids = [context['id'] for context in unit['contexts']]
        if not ids or len(ids) != len(set(ids)):
            raise ValueError('nonempty unique context inventory required')


def run_experiments(manifest, root, reference_dir, tool_root, runner, output):
    validate_manifest(manifest)
    root, reference_dir, tool_root, output = map(lambda p: Path(p).resolve(),
                                                (root, reference_dir, tool_root, output))
    runner = Path(runner).resolve()
    if manifest['schema_version'] != 1 or digest(runner) != manifest['runner']['sha256']:
        raise ValueError('runner pin or experiment schema differs')
    if output.exists():
        raise ValueError('fresh experiment output directory required')
    for unit in manifest['translation_units']:
        validate_unit(unit, root)
        if digest(inside(reference_dir, unit['object'])) != unit['reference_sha256']:
            raise ValueError('reference hash differs from saved experiment')
    for compiler in manifest['compilers']:
        validate_compiler(compiler, tool_root)
    output.mkdir(parents=True)
    report = {'schema_version': 1, 'status': 'completed', 'source_promotions': 0,
              'runner': manifest['runner'], 'target_provenance': manifest['target_provenance'],
              'compiler_inventory': [], 'units': [],
              'implementation_hashes': {name: digest(Path(__file__).resolve().parent / name)
                                        for name in ('compiler_experiments.py', 'source_build.py',
                                                     'relocation_check.py', 'native_link.py')},
              'manifest_fingerprint': hashlib.sha256(json.dumps(manifest, sort_keys=True,
                                                               separators=(',', ':')).encode()).hexdigest()}
    # Exclude inherited compiler settings; -nostdinc also disables MWCIncludes.
    environment = {key: value for key, value in os.environ.items()
                   if not key.upper().startswith(('MWC', 'MWARM'))}
    for compiler in manifest['compilers']:
        path = inside(tool_root, compiler['package'] + '/mwccarm.exe')
        version = subprocess.run([str(runner), str(path), '-version'], env=environment,
                                 capture_output=True, text=True)
        report['compiler_inventory'].append(dict(compiler, version_exit=version.returncode,
                                                 version_output=version.stdout + version.stderr))
    for unit in manifest['translation_units']:
        source = inside(root, unit['source']); reference = inside(reference_dir, unit['object'])
        item = {'source': unit['source'], 'source_sha256': unit['source_sha256'],
                'identity': unit['identity'], 'reference': summarize_object(reference),
                'contexts': unit['contexts'], 'trials': [], 'equivalence_sets': []}
        report['units'].append(item)
        for context in unit['contexts']:
            equivalent = []
            emitted_groups = {}
            for compiler in manifest['compilers']:
                path = inside(tool_root, compiler['package'] + '/mwccarm.exe')
                destination = output / unit['identity']['symbol'] / context['id'] / compiler['package'] / 'compiled.o'
                destination.parent.mkdir(parents=True)
                command = [str(runner), str(path), '-c', '-proc', context['cpu'],
                           *context['flags'], '-o', str(destination), str(source)]
                result = subprocess.run(command, cwd=root, env=environment, capture_output=True, text=True)
                trial = {'compiler': compiler['package'], 'compiler_sha256': compiler['sha256'],
                         'context': context['id'], 'context_sha256': context['sha256'],
                         'command': command, 'exit_status': result.returncode,
                         'status': 'compiler_failed' if result.returncode else 'unresolved'}
                item['trials'].append(trial)
                (destination.parent / 'compile.log').write_text(result.stdout + result.stderr)
                if not result.returncode and destination.is_file():
                    try:
                        trial['object'] = summarize_object(destination)
                        fingerprint = emitted_fingerprint(trial['object'])
                        emitted_groups.setdefault(fingerprint, []).append(compiler['package'])
                        trial['mismatches'] = mismatch_offsets(reference, destination)
                        try:
                            compare_objects(reference, destination, [unit['identity']['symbol']])
                            trial['status'] = 'equivalent'
                            equivalent.append(compiler['package'])
                        except ValueError as error:
                            trial.update(status='nonmatching', reason=str(error))
                    except Exception as error:
                        trial['reason'] = str(error)
            item['equivalence_sets'].append({'context': context['id'], 'compilers': equivalent,
                                              'identity_conclusion': 'unresolved',
                                              'emitted_groups': [{'fingerprint': key, 'compilers': names}
                                                                 for key, names in sorted(emitted_groups.items())]})
        validate_unit(unit, root)
        if digest(reference) != unit['reference_sha256']:
            raise ValueError('reference changed during sweep')
    for compiler in manifest['compilers']:
        validate_compiler(compiler, tool_root)
    if digest(runner) != manifest['runner']['sha256']:
        raise ValueError('runner changed during sweep')
    (output / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('manifest', 'root', 'reference-dir', 'tool-root', 'runner', 'output'):
        parser.add_argument('--' + name, required=True, type=Path)
    args = parser.parse_args()
    run_experiments(json.loads(args.manifest.read_text()), args.root, args.reference_dir,
                    args.tool_root, args.runner, args.output)

if __name__ == '__main__':
    main()
