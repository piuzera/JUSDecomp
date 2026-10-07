#!/usr/bin/env python3
"""Replay the one released ordinary-C physical initializer experiment."""
if not __debug__:
    raise SystemExit('Optimized Python disables verification checks; run without -O or -OO.')
import argparse
import hashlib
import json
import os
import shutil
import stat
import subprocess
import sys
import time
from pathlib import Path
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[4]
CAPSULE = Path(__file__).resolve().parent


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def check_snapshot(snapshot):
    for name, expected in snapshot.items():
        path = Path(name)
        if path.is_symlink():
            aliases = json.loads((CAPSULE / 'pins.json').read_text())['external_resolved_targets']
            if aliases.get(name) != str(path.resolve()):
                raise ValueError('symlinked pinned input/artifact: ' + name)
        if not path.is_file() or digest(path) != expected:
            raise ValueError('changed or missing pinned input/artifact: ' + name)


def fresh_output(path):
    if path.exists() or path.is_symlink():
        raise ValueError('output already exists; supply a fresh directory')
    path.mkdir(parents=True)


def publish_receipt(path, payload, snapshot):
    with path.open('xb') as stream:
        stream.write(payload)
        stream.flush()
        original = os.fstat(stream.fileno())
        def require_owned_receipt():
            current = path.lstat()
            if not stat.S_ISREG(current.st_mode) or (current.st_dev, current.st_ino) != (original.st_dev, original.st_ino):
                raise ValueError('published receipt path is no longer the exclusively created regular file')
            if path.read_bytes() != payload:
                raise ValueError('published receipt bytes changed')
        try:
            require_owned_receipt()
            check_snapshot(snapshot)
            expected_files = {Path(name) for name in snapshot if Path(name).is_relative_to(path.parent)}
            produced = [p for p in path.parent.rglob('*') if '.git' not in p.relative_to(path.parent).parts and p != path]
            if any(p.is_symlink() for p in produced):
                raise ValueError('post-publication artifact is symlinked')
            actual_files = {p for p in produced if p.is_file()}
            if actual_files != expected_files:
                raise ValueError('post-publication artifact inventory changed')
            require_owned_receipt()
        except BaseException:
            path.unlink(missing_ok=True)
            raise


def input_snapshot():
    pin_path = CAPSULE / 'pins.json'
    pins = json.loads(pin_path.read_text())
    for alias, target in pins['external_resolved_targets'].items():
        if str(Path(alias).resolve()) != target:
            raise ValueError('external tool locator target changed: ' + alias)
    snapshot = {str(ROOT / name): value for name, value in pins['repository'].items()}
    snapshot.update({str(CAPSULE / name): value for name, value in pins['owned'].items()})
    snapshot.update(pins['external'])
    snapshot[str(pin_path)] = digest(pin_path)
    for name in (*pins['repository'],):
        if (ROOT / name).is_symlink():
            raise ValueError('repository input is symlinked: ' + name)
    for name in pins['owned']:
        if (CAPSULE / name).is_symlink():
            raise ValueError('owned input is symlinked: ' + name)
    check_snapshot(snapshot)
    recipe = json.loads((CAPSULE / 'recipe.json').read_text())
    package = Path(recipe['external_paths']['compiler']).parent
    actual = {p.name: digest(p) for p in package.iterdir() if p.suffix.lower() in ('.exe', '.dll')}
    if actual != recipe['compiler_package_inventory']:
        raise ValueError('compiler EXE/DLL package inventory changed')
    return snapshot


def helpers():
    # No repository module is imported before checking its actual bytes and reference authority.
    input_snapshot()
    sys.path.insert(0, str(ROOT / 'tools/scripts'))
    import compiler_experiments
    import source_build
    import verify
    return compiler_experiments, source_build, verify


def require_reference(path):
    experiments, builder, _ = helpers()
    path = Path(path)
    if path.is_symlink() or not path.is_file():
        raise ValueError('original complete TU missing or symlinked')
    expected = json.loads((CAPSULE / 'reference-shape.json').read_text())
    builder.compare_objects(path, path, ['func_0202c4ac'])
    actual = experiments.summarize_object(path)
    if actual != expected:
        raise ValueError('current original complete TU differs from pinned full92-byte shape/payload/RELA')
    return actual


def loaded_original(rom, recipe):
    import struct
    data = rom.read_bytes()
    arm9_offset, _, arm9_base, arm9_size = struct.unpack_from('<4I', data, 0x20)
    offset = arm9_offset + 0x0202c4ac - arm9_base
    payload = data[offset:offset + 92]
    if arm9_base != 0x02000000 or len(payload) != 92 or hashlib.sha256(payload).hexdigest() != recipe['rom_loaded92_sha256']:
        raise ValueError('original loaded full92 ROM bytes differ')
    return {'rom_offset': offset, 'arm9_load_address': arm9_base, 'arm9_size': arm9_size,
            'loaded92_sha256': hashlib.sha256(payload).hexdigest()}


def artifact_controls(reference, output):
    experiments, builder, _ = helpers()
    os.environ['JUS37_REFERENCE'] = str(reference)
    sys.path.insert(0, str(CAPSULE))
    from test_replay import mutations
    output.mkdir()
    rows = []
    for name, data in {'exact_copy': reference.read_bytes(), **mutations(reference.read_bytes())}.items():
        path = output / (name + '.o'); path.write_bytes(data)
        error = None
        try:
            builder.compare_objects(reference, path, ['func_0202c4ac'])
            passed = True
        except ValueError as exc:
            passed = False; error = str(exc)
        expected = name in ('exact_copy', 'pool_placeholder')
        if passed != expected:
            raise ValueError('unexpected actual comparator control: ' + name)
        raw_passed = True
        try:
            require_reference(path)
        except ValueError:
            raw_passed = False
        if raw_passed != (name == 'exact_copy'):
            raise ValueError('unexpected original raw boundary control: ' + name)
        rows.append({'name': name, 'sha256': digest(path), 'comparator_passed': passed,
                     'original_boundary_passed': raw_passed, 'diagnostic': error})
    (output / 'results.json').write_text(json.dumps(rows, indent=2) + '\n')
    return rows



def precompiler_controls(directory):
    directory.mkdir()
    recipe = json.loads((CAPSULE / 'recipe.json').read_text())
    paths = [CAPSULE / 'physical_initializer.c', CAPSULE / 'reference-shape.json',
             Path(recipe['external_paths']['compiler']), Path(recipe['external_paths']['runner'])]
    paths += [Path(recipe['external_paths']['compiler']).parent / name for name in
              ('ELFIO.dll', 'MSL_All-DLL80_x86.dll', 'lmgr8c.dll')]
    rows = []
    for path in paths:
        try:
            check_snapshot({str(path): '0' * 64})
        except ValueError as exc:
            rows.append({'input': str(path), 'actual_sha256': digest(path), 'wrong_pin_rejected': True, 'diagnostic': str(exc)})
        else:
            raise ValueError('wrong actual source/tool pin accepted')
    absent = directory / 'optimized-output'
    for option in ('-O', '-OO'):
        result = subprocess.run([sys.executable, option, str(CAPSULE / 'replay.py'), '--output', str(absent)], capture_output=True, text=True)
        if result.returncode == 0 or absent.exists():
            raise ValueError('optimized Python control failed')
        rows.append({'control': option, 'exit_status': result.returncode, 'output_absent': True, 'stderr': result.stderr})
    existing = directory / 'existing-output'; existing.mkdir()
    marker = existing / 'marker'; marker.write_bytes(b'keep')
    result = subprocess.run([sys.executable, str(CAPSULE / 'replay.py'), '--output', str(existing)], capture_output=True, text=True)
    if result.returncode == 0 or marker.read_bytes() != b'keep' or list(existing.iterdir()) != [marker]:
        raise ValueError('existing-output control failed')
    rows.append({'control': 'existing_output', 'exit_status': result.returncode, 'marker_unchanged': True, 'stderr': result.stderr})
    (directory / 'results.json').write_text(json.dumps(rows, indent=2) + '\n')
    return rows


def command(args, cwd, commands):
    result = subprocess.run(list(map(str, args)), cwd=cwd, capture_output=True, text=True)
    commands.append({'command': list(map(str, args)), 'cwd': str(cwd), 'exit_status': result.returncode,
                     'stdout': result.stdout, 'stderr': result.stderr})
    if result.returncode:
        raise ValueError('genuine command failed: ' + ' '.join(map(str, args)))
    return result


def replay(output: Path) -> Path:
    started_ns = time.time_ns()
    inputs = input_snapshot()
    recipe = json.loads((CAPSULE / 'recipe.json').read_text())
    tools = {name: Path(value) for name, value in recipe['external_paths'].items()}
    experiments, builder, verifier = helpers()
    fresh_output(output)
    commands = []; gates = []
    research = output / 'research-root'
    command(['git', 'clone', '--shared', '--no-checkout', ROOT, research], ROOT, commands)
    command(['git', 'checkout', '--detach', recipe['base_commit']], research, commands)
    for relative, expected in json.loads((CAPSULE / 'pins.json').read_text())['repository'].items():
        if digest(research / relative) != expected:
            raise ValueError('research snapshot differs from pinned helper/metadata: ' + relative)
    # Record exact research derivation; this is the only declaration/source/manifest change.
    delinks = research / 'decomp/arm9/delinks.txt'
    for relative in json.loads((CAPSULE / 'pins.json').read_text())['repository']:
        inputs[str(research / relative)] = digest(research / relative)
    before = digest(delinks)
    delinks.write_text(delinks.read_text().rstrip() + recipe['complete_declaration'])
    source = research / recipe['source_manifest']['translation_units'][0]['source']
    source.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(CAPSULE / 'physical_initializer.c', source)
    manifest = research / 'task37-source-manifest.json'
    manifest.write_text(json.dumps(recipe['source_manifest'], indent=2) + '\n')
    derivation = {'base_commit': recipe['base_commit'], 'delinks_before_sha256': before,
                  'modified': {str(p.relative_to(research)): digest(p) for p in (delinks, source, manifest)},
                  'git_status': command(['git', 'status', '--short', '--untracked-files=all'], research, commands).stdout}
    inputs.update({str(p): digest(p) for p in (delinks, source, manifest)})
    check_snapshot(inputs)
    # Fresh unchanged reference extraction and distinct complete TU before any compiler invocation.
    preflight = output / 'original-preflight'; preflight.mkdir()
    regions = json.loads((research / 'decomp/matching-notes/baseline-t01/executable-regions.json').read_text())
    verifier.prepare_config(research, preflight, verifier.expected_modules(regions))
    command([tools['dsd'], 'rom', 'extract', '-r', tools['rom'], '-o', preflight / 'extract'], research, commands)
    command([tools['dsd'], 'delink', '-c', preflight / 'config/config.yaml'], research, commands)
    candidate = verifier.prepare_source_config(research, preflight, recipe['source_manifest'])
    command([tools['dsd'], 'delink', '-c', candidate['config']], research, commands)
    reference = preflight / 'candidate-delinks/src/main/physical_initializer.o'
    shape = require_reference(reference)
    loaded = loaded_original(tools['rom'], recipe)
    controls = artifact_controls(reference, output / 'original-controls')
    input_controls = precompiler_controls(output / 'input-controls')
    check_snapshot(inputs)
    actual_reference = output / 'verify/candidate-delinks/src/main/physical_initializer.o'
    def stage_runner(args, cwd):
        result = verifier.run_command(args, cwd)
        if list(map(str, args)) == [str(tools['dsd']), 'delink', '-c', str(output / 'verify/candidate-config/config.yaml')] and result.returncode == 0:
            current = require_reference(actual_reference)
            loaded_original(tools['rom'], recipe)
            check_snapshot(inputs)
            gates.append({'boundary': 'completed_actual_source_delink_before_source_build',
                          'command': list(map(str, result.args)), 'reference': str(actual_reference), 'shape': current})
        return result
    # Exactly one invocation; only its unchanged source_build stage compiles the model.
    report, report_path = verifier.verify(tools['rom'], output / 'verify', tools['dsd'], tools['lld'], tools['clang'],
                             root=research, stage_runner=stage_runner, source_manifest=manifest,
                             source_compiler=tools['compiler'], compiler_runner=tools['runner'])
    check_snapshot(inputs)
    require_reference(reference)
    diagnostics = None
    source_stage = next((s for s in report['stages'] if s['name'] == 'source_build'), None)
    if not gates or source_stage is None:
        status = 'blocked'
    elif report['status'] == 'passed':
        # The unchanged verifier completed genuine input selection, link, modules and whole ROM.
        status = 'exact_research_match'
    else:
        compiled = output / 'verify/source-build/src/main/physical_initializer.o'
        if compiled.is_file() and not compiled.is_symlink() and source_stage.get('result', {}).get('status') == 'failed':
            unit = source_stage['result']['units'][0]
            if unit.get('exit_status') != 0 or unit.get('compiled', {}).get('sha256') != digest(compiled):
                raise ValueError('diagnostic object differs from genuine compiler result')
            if unit.get('source_sha256') != digest(source) or unit.get('reference', {}).get('sha256') != digest(actual_reference):
                raise ValueError('diagnostic source/reference differs from genuine compiler inputs')
            try:
                builder.compare_objects(actual_reference, compiled, ['func_0202c4ac'])
            except builder.Unresolved as exc:
                raise ValueError('unsupported diagnostic object: ' + str(exc))
            except ValueError as exc:
                actual_failure = str(exc)
            else:
                raise ValueError('failed verifier object unexpectedly compares exact')
            require_reference(actual_reference)
            diagnostics = {'reference': experiments.summarize_object(actual_reference),
                           'compiled': experiments.summarize_object(compiled),
                           'masked_mismatch_offsets': experiments.mismatch_offsets(actual_reference, compiled),
                           'source_build_result': source_stage.get('result'), 'rechecked_comparator_failure': actual_failure}
            status = 'measured_rejection'
        else:
            status = 'blocked'
    evidence = {'schema_version': 1, 'status': status, 'commands': commands, 'research_derivation': derivation,
                'original_reference': shape, 'loaded_original': loaded, 'original_controls': controls, 'input_controls': input_controls,
                'precompiler_gates': gates, 'diagnostics': diagnostics, 'raw_verifier_report': 'verify/report.json',
                'verify_invocations': 1, 'canonical_changed': False,
                'source_model_sha256': digest(CAPSULE / 'physical_initializer.c'),
                'recipe_sha256': digest(CAPSULE / 'recipe.json')}
    # Actual diagnostics, reference, reports, tool/input and research derivation rechecked on failures too.
    produced = [p for p in output.rglob('*') if '.git' not in p.relative_to(output).parts]
    if any(p.is_symlink() for p in produced):
        raise ValueError('produced artifact is symlinked')
    artifacts = {str(p): digest(p) for p in produced if p.is_file()}
    if any(Path(p).stat().st_mtime_ns < started_ns for p in artifacts):
        raise ValueError('produced artifact predates fresh replay')
    evidence['replay_started_ns'] = started_ns
    evidence['artifact_sha256'] = {str(Path(p).relative_to(output)): value for p, value in artifacts.items()}
    evidence['input_sha256'] = inputs
    snapshot = dict(inputs); snapshot.update(artifacts)
    check_snapshot(snapshot)
    payload = (json.dumps(evidence, indent=2) + '\n').encode()
    publish_receipt(output / 'receipt.json', payload, snapshot)
    return output / 'receipt.json'


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True, type=Path)
    args = parser.parse_args()
    try:
        receipt = replay(args.output.absolute())
        status = json.loads(receipt.read_text())['status']
        print(json.dumps({'status': status, 'receipt': str(receipt)}))
        raise SystemExit(0 if status in ('exact_research_match', 'measured_rejection') else 1)
    except (ValueError, OSError) as exc:
        print('blocked: ' + str(exc), file=sys.stderr)
        raise SystemExit(1)
