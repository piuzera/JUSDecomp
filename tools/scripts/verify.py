#!/usr/bin/env python3
"""Strict fresh native ARM9 baseline build and verification; no skipped stages."""
import argparse
import hashlib
import importlib.util
import json
import re
import shutil
import subprocess
import sys
import time
import uuid
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
REQUIRED_STAGES = ('intake', 'tool_versions', 'prepare_config', 'extract', 'delink',
                   'lcf', 'native_link', 'link_inputs', 'check_modules', 'check_symbols',
                   'direct_comparison', 'relocation_check', 'freshness')


def sha256(path):
    digest = hashlib.sha256()
    with Path(path).open('rb') as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b''):
            digest.update(chunk)
    return digest.hexdigest()


def tool_argument(path):
    return path.expanduser().absolute()


def require_tool(path, expected_hash):
    if not path.is_file():
        raise ValueError(f'missing tool: {path.name}')
    actual = sha256(path)
    if actual != expected_hash:
        raise ValueError(f'tool SHA256 mismatch: {path.name}: expected {expected_hash}, got {actual}')
    return actual


def require_unchanged(snapshot):
    for name, digest in snapshot.items():
        path = Path(name)
        if not path.is_file() or sha256(path) != digest:
            raise ValueError(f'input/tool changed during build: {path.name}')


def require_stages(stages):
    names = [stage['name'] for stage in stages]
    for name in REQUIRED_STAGES:
        matches = [s for s in stages if s['name'] == name]
        if len(matches) != 1 or matches[0]['status'] != 'passed':
            raise ValueError(f'required stage missing/skipped/failed: {name}')
    if names != list(REQUIRED_STAGES):
        raise ValueError('verification stage order differs from required pipeline')


def require_module_files(directory, expected):
    for module in expected:
        path = directory / module['filename']
        if not path.is_file() or path.is_symlink():
            raise ValueError(f'missing declared module: {module["region"]}')


def record_stage(report, name, action):
    stage = {'name': name, 'status': 'failed', 'exit_status': None,
             'stdout': '', 'stderr': '', 'started_ns': time.time_ns()}
    report['stages'].append(stage)
    try:
        result = action()
        if isinstance(result, subprocess.CompletedProcess):
            stage.update(command=list(map(str, result.args)), exit_status=result.returncode,
                         stdout=result.stdout or '', stderr=result.stderr or '')
            if result.returncode != 0:
                raise ValueError(f'{name} exited {result.returncode}: {stage["stderr"].strip()}')
        else:
            stage.update(exit_status=0, result=result)
            if isinstance(result, dict) and result.get('status', 'passed') != 'passed':
                raise ValueError(f'{name} did not pass: {result.get("status")}')
        stage['status'] = 'passed'
        return result
    except Exception as error:
        if not stage['stderr']:
            stage['stderr'] = str(error)
        raise
    finally:
        stage['finished_ns'] = time.time_ns()


def run_command(command, cwd):
    return subprocess.run(list(map(str, command)), cwd=cwd, capture_output=True, text=True)


def load_script(path, name):
    if not path.is_file():
        raise ValueError(f'required checker pending/missing: {path.name}')
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def expected_modules(regions):
    arm9 = regions['regions']['arm9']
    modules = [dict(arm9['main'], region='ARM9', filename='arm9.bin')]
    modules += [dict(item, region=item['kind'], filename=item['kind'].lower() + '.bin')
                for item in arm9['autoloads']]
    overlays = regions['regions']['arm9_overlays']
    if [item['id'] for item in overlays] != list(range(14)):
        raise ValueError('expected overlay inventory must contain IDs 0 through 13')
    modules += [dict(item, region=f'OV{item["id"]:03}', filename=f'arm9_ov{item["id"]:03}.bin')
                for item in overlays]
    if [m['region'] for m in modules] != ['ARM9', 'ITCM', 'DTCM'] + [f'OV{i:03}' for i in range(14)]:
        raise ValueError('expected module inventory is not the complete 17-module baseline')
    return modules


def verify_link_record(output, tools):
    native = output / 'native-link'
    record = json.loads((native / 'link-inputs.json').read_text())
    command = record['command']
    if record['returncode'] != 0 or not command:
        raise ValueError('native linker was missing/skipped/failed')
    if command[0] != tools['lld']['command'][0]:
        raise ValueError('actual linker executable differs from pinned tool')
    if record['attributes']['compiler_command'][0] != tools['clang']['command'][0]:
        raise ValueError('actual attributes compiler differs from pinned tool')
    for name in ('lld', 'clang'):
        if record[name + '_sha256'] != tools[name]['sha256']:
            raise ValueError('actual linker/compiler tool hash differs from pin')
    lcf = output / 'linked/arm9.lcf'
    script = native / 'native.ld'
    if record['lcf_sha256'] != sha256(lcf) or record['native_script_sha256'] != sha256(script):
        raise ValueError('actual linker script/input hash differs')
    if command[command.index('-T') + 1] != str(script) or command[command.index('-o') + 1] != str(native / 'linked.elf'):
        raise ValueError('actual linker script/output paths differ from fresh build')
    declared = sorted(set(re.findall(r'(\S+\.o)\(', lcf.read_text())))
    if sorted(item['filename'] for item in record['objects']) != declared:
        raise ValueError('actual linked objects differ from declared LCF inputs')
    expected_paths = []
    for item in record['objects']:
        source = output / 'delinks' / item['filename']
        normalized = Path(item['normalized'])
        if Path(item['source']) != source or not normalized.is_relative_to(native):
            raise ValueError('linked object provenance escapes fresh build')
        if sha256(source) != item['reference_sha256'] or sha256(normalized) != item['normalized_sha256']:
            raise ValueError('linked reference/normalized object hash differs')
        expected_paths.append(str(normalized))
    attributes = native / 'attributes.o'
    if sha256(attributes) != record['attributes']['sha256']:
        raise ValueError('linked attributes object hash differs')
    expected_paths.append(str(attributes))
    actual_inputs = [item['path'] for item in record['inputs']]
    if actual_inputs != expected_paths or command[-len(actual_inputs):] != actual_inputs:
        raise ValueError('actual linker argv does not match recorded input objects')
    for item in record['inputs']:
        if sha256(Path(item['path'])) != item['sha256']:
            raise ValueError('actual linker input hash differs')
    return dict(record, input_domain='normalized reference binary objects; no reconstructed source')


def require_relocation_result(result, reference):
    expected = {str(item['type']): item['count'] for item in reference['relocations']}
    total = sum(expected.values())
    counts = result['counts']
    if (result.get('status') != 'passed' or total <= 0 or counts['total'] != total
            or counts['validated'] != total or counts['failed'] or counts['unresolved']
            or result['relocation_types'] != expected):
        raise ValueError('relocation check failed, unresolved, or missing pinned slots')


def prepare_config(root, output, expected):
    directory = output / 'config'
    shutil.copytree(root / 'decomp/arm9', directory)
    path = directory / 'config.yaml'
    text = path.read_text()
    replacements = {
        'rom_config: ../../extract/config.yaml': 'rom_config: ../extract/config.yaml',
        'build_path: ../../build': 'build_path: ../linked',
        'delinks_path: ../../build/delinks': 'delinks_path: ../delinks',
        'object: ../../build/build/': 'object: ../native-link/',
    }
    for before, after in replacements.items():
        if before not in text:
            raise ValueError(f'unsupported source config: missing {before}')
        text = text.replace(before, after)
    names = re.findall(r'^\s+name:\s*(\S+)\s*$', text, re.M)
    if names != ['main', 'itcm', 'dtcm'] + [f'ov{i:03}' for i in range(14)]:
        raise ValueError('declared config does not contain exactly the 17 baseline modules')
    filenames = re.findall(r'object: ../native-link/(\S+)', text)
    if filenames != [m['filename'] for m in expected]:
        raise ValueError('declared module output inventory differs from manifest')
    path.write_text(text)
    return {'declared_modules': 17, 'config_sha256': sha256(path)}


def direct_comparison(rom, output, expected):
    native = output / 'native-link'
    require_module_files(native, expected)
    metadata = json.loads((native / 'modules.json').read_text())
    if [m['region'] for m in metadata] != [m['region'] for m in expected]:
        raise ValueError('native link inventory differs from declared module inventory')
    native_tool = load_script(ROOT / 'tools/scripts/native_link.py', 'native_link_verify')
    elf = native_tool.Elf32((native / 'linked.elf').read_bytes())
    sections = {elf.section_name(s): s for s in elf.sections}
    symbols = {elf.symbol_name(s): s[1] for s in elf.symbols()}
    data = rom.read_bytes()
    results = []
    for module, linked in zip(expected, metadata):
        region = module['region']
        path = native / module['filename']
        payload = path.read_bytes()
        offset = int(module['parent_rom_offset'], 16)
        reference = data[offset:offset + module['bytes']]
        if len(reference) != module['bytes'] or sha256(path) != module['hashes']['sha256']:
            raise ValueError(f'{region}: module hash/size differs from manifest')
        if payload != reference:
            raise ValueError(f'{region}: module bytes differ from original ROM')
        address = int(module['base'], 16)
        section = sections['.' + region.lower()]
        bss_start = symbols[region + '_BSS_START']
        bss_end = symbols[region + '_BSS_END']
        if section[3] != address or bss_start != address + len(payload):
            raise ValueError(f'{region}: linked module address/BSS boundary differs')
        if bss_end - bss_start != module['bss_bytes'] or section[5] != len(payload) + module['bss_bytes']:
            raise ValueError(f'{region}: linked BSS size differs from manifest')
        if linked['address'] != address or linked['size_bytes'] != len(payload) or linked['sha256'] != sha256(path):
            raise ValueError(f'{region}: native metadata differs from emitted module')
        if elf.content(section)[:len(payload)] != payload:
            raise ValueError(f'{region}: emitted bytes differ from linked ELF section')
        results.append({'module': region, 'size_bytes': len(payload), 'address': address,
                        'bss_bytes': module['bss_bytes'], 'sha256': sha256(path), 'status': 'passed'})
    return {'status': 'passed', 'modules': results, 'total_bytes': sum(m['size_bytes'] for m in results)}


def verify(rom, output, dsd, lld, clang, root=ROOT, stage_runner=run_command):
    output = output.resolve()
    report = {'schema_version': 1, 'build_id': str(uuid.uuid4()), 'status': 'failed',
              'started_ns': time.time_ns(), 'stages': [],
              'scope': 'native ARM9 main/ITCM/DTCM/14 overlays; ARM7 and embedded program unbuilt',
              'source_coverage': {'matched_source_bytes': 0, 'percent': 0}}
    report_path = output / 'report.json'
    try:
        if output.exists():
            report_path = output.parent / f'{output.name}.rejected-{report["build_id"]}.json'
            raise ValueError('output already exists; supply a fresh build directory')
        output.mkdir(parents=True)
        sources = [root / 'tools/scripts' / name for name in
                   ('verify.py', 'baseline_intake.py', 'native_link.py')]
        sources += [root / 'decomp/toolchain.lock.json', root / 'decomp/rom-manifest.json',
                    root / 'decomp/matching-notes/baseline-t01/executable-regions.json',
                    root / 'decomp/matching-notes/baseline-t01/reference-relocations.json']
        sources += sorted((root / 'decomp/arm9').rglob('*'))
        sources = [p for p in sources if p.is_file()]
        checker_path = root / 'tools/scripts/relocation_check.py'
        if checker_path.is_file():
            sources.append(checker_path)
        snapshot = {str(p): sha256(p) for p in sources}
        report['source_hashes'] = {str(p.relative_to(root)): snapshot[str(p)] for p in sources}
        commit = stage_runner(['git', 'rev-parse', 'HEAD'], root)
        if commit.returncode != 0:
            raise ValueError('cannot record source commit')
        report['source_commit'] = commit.stdout.strip()
        report['source_commit_evidence'] = {'command': list(map(str, commit.args)),
                                             'stdout': commit.stdout, 'stderr': commit.stderr,
                                             'exit_status': commit.returncode}
        command = lambda args: stage_runner(args, root)
        record_stage(report, 'intake', lambda: command([
            sys.executable, root / 'tools/scripts/baseline_intake.py', '--rom', rom,
            '--output', output / 'intake.json']))
        intake = json.loads((output / 'intake.json').read_text())
        manifest = json.loads((root / 'decomp/rom-manifest.json').read_text())
        if intake != manifest:
            raise ValueError('intake metadata differs from pinned ROM manifest')
        report['rom'] = intake['rom']
        snapshot[str(rom)] = sha256(rom)
        if snapshot[str(rom)] != manifest['rom']['sha256']:
            raise ValueError('ROM changed after intake or differs from pinned SHA256')
        lock = json.loads((root / 'decomp/toolchain.lock.json').read_text())
        tools = {'dsd': (dsd, lock['dsd']), 'lld': (lld, lock['native_linker']),
                 'clang': (clang, lock['native_attributes_compiler'])}

        def tool_versions():
            versions = {}
            report['tools'] = versions
            for name, (path, pin) in tools.items():
                digest = require_tool(path, pin['sha256'])
                result = command([path, '--version'])
                versions[name] = {'sha256': digest, 'version': pin['version'],
                                  'stdout': result.stdout, 'stderr': result.stderr,
                                  'command': list(map(str, result.args)),
                                  'exit_status': result.returncode}
                if result.returncode or not re.search(r'\b' + re.escape(pin['version']) + r'\b', result.stdout):
                    raise ValueError(f'{name}: pinned tool version mismatch')
                if name == 'dsd' and result.stdout.strip() != pin['verified_version_output']:
                    raise ValueError('dsd: pinned version output mismatch')
                snapshot[str(path)] = digest
            report['tools'] = versions
            return versions

        record_stage(report, 'tool_versions', tool_versions)
        regions = json.loads((root / 'decomp/matching-notes/baseline-t01/executable-regions.json').read_text())
        expected = expected_modules(regions)
        record_stage(report, 'prepare_config', lambda: prepare_config(root, output, expected))
        config = output / 'config/config.yaml'
        record_stage(report, 'extract', lambda: command([dsd, 'rom', 'extract', '-r', rom, '-o', output / 'extract']))
        record_stage(report, 'delink', lambda: command([dsd, 'delink', '-c', config]))
        record_stage(report, 'lcf', lambda: command([dsd, 'lcf', '-c', config]))
        record_stage(report, 'native_link', lambda: command([
            sys.executable, root / 'tools/scripts/native_link.py', '--lcf', output / 'linked/arm9.lcf',
            '--objects', output / 'delinks', '--output', output / 'native-link',
            '--lld', lld, '--clang', clang]))
        report['link_inputs'] = record_stage(report, 'link_inputs', lambda: verify_link_record(output, report['tools']))
        require_module_files(output / 'native-link', expected)
        record_stage(report, 'check_modules', lambda: command([dsd, 'check', 'modules', '-c', config, '-f']))
        record_stage(report, 'check_symbols', lambda: command([
            dsd, 'check', 'symbols', '-c', config, '-e', output / 'native-link/dsd-check.elf', '-f']))
        record_stage(report, 'direct_comparison', lambda: direct_comparison(rom, output, expected))

        def relocations():
            checker = load_script(checker_path, 'relocation_check_verify')
            reference = json.loads((root / 'decomp/matching-notes/baseline-t01/reference-relocations.json').read_text())
            objects = sorted((output / 'delinks').glob('*.o'))
            if len(objects) != reference['objects']:
                raise ValueError('relocation reference objects missing or changed')
            result = checker.validate_relocations(objects, output / 'native-link/linked.elf')
            (output / 'relocations.json').write_text(json.dumps(result, indent=2) + '\n')
            require_relocation_result(result, reference)
            return result

        record_stage(report, 'relocation_check', relocations)

        def freshness():
            require_unchanged(snapshot)
            artifacts = sorted(p for directory in ('delinks', 'linked', 'native-link')
                               for p in (output / directory).rglob('*') if p.is_file())
            for path in artifacts:
                if path.is_symlink() or path.stat().st_mtime_ns < report['started_ns']:
                    raise ValueError(f'stale output artifact: {path.name}')
            report['artifact_hashes'] = {str(p.relative_to(output)): sha256(p) for p in artifacts}
            return {'artifact_count': len(artifacts), 'inputs_unchanged': True}

        record_stage(report, 'freshness', freshness)
        require_stages(report['stages'])
        report['status'] = 'passed'
    except Exception as error:
        report['failure'] = str(error)
    finally:
        report['finished_ns'] = time.time_ns()
        report_path.write_text(json.dumps(report, indent=2) + '\n')
    return report, report_path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('rom', 'output', 'dsd', 'lld', 'clang'):
        parser.add_argument('--' + name, required=True, type=Path)
    args = parser.parse_args()
    report, path = verify(args.rom.resolve(), args.output, tool_argument(args.dsd),
                          tool_argument(args.lld), tool_argument(args.clang))
    print(json.dumps({'status': report['status'], 'report': str(path)}))
    return 0 if report['status'] == 'passed' else 1


if __name__ == '__main__':
    sys.exit(main())
