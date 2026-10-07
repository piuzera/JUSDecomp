#!/usr/bin/env python3
"""Strict fresh native ARM9 baseline build and verification; no skipped stages."""
import argparse
import copy
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
MODULE_STAGES = ('intake', 'tool_versions', 'prepare_config', 'extract', 'delink',
                   'lcf', 'native_link', 'link_inputs', 'check_modules', 'check_symbols',
                   'direct_comparison', 'relocation_check', 'freshness')
SOURCE_MODULE_STAGES = (*MODULE_STAGES[:5], 'source_config', 'source_delink', 'source_build',
                        *MODULE_STAGES[5:12], 'source_ownership', 'freshness')
REQUIRED_STAGES = (*MODULE_STAGES, 'rom_roundtrip', 'rom_freshness')
SOURCE_STAGES = (*SOURCE_MODULE_STAGES, 'rom_roundtrip', 'rom_freshness')


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


def source_context_files(root, unit):
    root = Path(root).resolve()
    def inside(name):
        path = Path(name)
        if path.is_absolute() or '..' in path.parts:
            raise ValueError('source/header context must stay inside repository')
        resolved = (root / path).resolve()
        if not resolved.is_relative_to(root):
            raise ValueError('source/header context must stay inside repository')
        return resolved
    files = {inside(unit['source'])}
    files.update(inside(name) for name in unit['headers'])
    files.update(inside(name) for name in unit.get('forced_headers', []))
    for name in unit['include_paths']:
        directory = inside(name)
        for path in directory.rglob('*'):
            if path.is_file():
                files.add(inside(path.relative_to(root)))
    return sorted(files)


def require_stage_sequence(stages, required):
    names = [stage['name'] for stage in stages]
    for name in required:
        matches = [s for s in stages if s['name'] == name]
        if len(matches) != 1 or matches[0]['status'] != 'passed':
            raise ValueError(f'required stage missing/skipped/failed: {name}')
    if names != list(required):
        raise ValueError('verification stage order differs from required pipeline')


def require_stages(stages, source_enabled=False):
    require_stage_sequence(stages, SOURCE_STAGES if source_enabled else REQUIRED_STAGES)


def verified_module_checkpoint(report, source_enabled=False):
    required = SOURCE_MODULE_STAGES if source_enabled else MODULE_STAGES
    require_stage_sequence(report['stages'], required)
    checkpoint = copy.deepcopy(report)
    checkpoint['status'] = 'passed'
    return checkpoint


def require_rom_freshness(snapshot, report, output, rom, expected_hash):
    require_unchanged(snapshot)
    for name, digest in report['artifact_hashes'].items():
        path = output / name
        if (not path.is_file() or path.is_symlink()
                or not path.resolve().is_relative_to(output.resolve())
                or sha256(path) != digest):
            raise ValueError(f'output artifact changed during ROM packing: {name}')
    if (not rom.is_file() or rom.is_symlink()
            or not rom.resolve().is_relative_to(output.resolve())
            or rom.stat().st_mtime_ns < report['started_ns']):
        raise ValueError('rebuilt ROM is missing, stale, or outside the fresh build')
    if sha256(rom) != expected_hash:
        raise ValueError('rebuilt ROM hash changed after packing')
    report['artifact_hashes'][str(rom.relative_to(output))] = expected_hash
    return {'inputs_unchanged': True, 'artifact_count': len(report['artifact_hashes']),
            'rom_sha256': expected_hash}


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


def require_source_input(item, source_build, source_directory):
    compiled = Path(source_build['objects'].get(item['filename'], '/missing')).resolve()
    if (item.get('kind') != 'source' or Path(item['source']).resolve() != compiled
            or Path(item.get('compiled', '/missing')).resolve() != compiled
            or not compiled.is_relative_to(source_directory.resolve())
            or sha256(compiled) != item.get('compiled_sha256')):
        raise ValueError('actual compiled source object differs from source build')


def verify_link_record(output, tools, source_build=None):
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
    references = output / ('candidate-delinks' if source_build else 'delinks')
    source_names = set()
    for item in record['objects']:
        source = Path(item.get('reference', item['source']))
        normalized = Path(item['normalized'])
        if (not source.is_relative_to(references) or source.name != item['filename']
                or not normalized.is_relative_to(native)):
            raise ValueError('linked object provenance escapes fresh build')
        if sha256(source) != item['reference_sha256'] or sha256(normalized) != item['normalized_sha256']:
            raise ValueError('linked reference/normalized object hash differs')
        if item.get('kind', 'reference') == 'source':
            if source_build is None:
                raise ValueError('compiled source object has no source build evidence')
            require_source_input(item, source_build, output / 'source-build')
            source_names.add(item['filename'])
        elif item.get('kind', 'reference') != 'reference' or Path(item['source']) != source:
            raise ValueError('invalid reference object input kind/path')
        expected_paths.append(str(normalized))
    if source_names != set(source_build['objects'] if source_build else ()):
        raise ValueError('actual linked source objects differ from compiled selection')
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
    if source_build:
        link_map = native / 'link.map'
        if (record.get('link_map', {}).get('path') != str(link_map)
                or record['link_map']['sha256'] != sha256(link_map)
                or command[command.index('-Map') + 1] != str(link_map)):
            raise ValueError('actual source link map missing or changed')
    domain = ('compiled C and normalized reference binary objects' if source_build
              else 'normalized reference binary objects; no reconstructed source')
    return dict(record, input_domain=domain)


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
    shutil.copytree(root / 'decomp/arm9', directory, copy_function=shutil.copyfile)
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
    # Keep whole-module references independent from selected reconstructed TUs.
    for delinks in directory.rglob('delinks.txt'):
        base = re.split(r'^\S[^\n]*:\s*$', delinks.read_text(), maxsplit=1, flags=re.M)[0]
        delinks.write_text(base)
    return {'declared_modules': 17, 'config_sha256': sha256(path)}


def prepare_source_config(root, output, manifest):
    directory = output / 'candidate-config'
    if directory.exists():
        raise ValueError('source candidate config already exists')
    shutil.copytree(output / 'config', directory, copy_function=shutil.copyfile)
    path = directory / 'config.yaml'
    text = path.read_text()
    if 'delinks_path: ../delinks' not in text:
        raise ValueError('candidate config lacks original reference output path')
    path.write_text(text.replace('delinks_path: ../delinks', 'delinks_path: ../candidate-delinks'))
    names = set()
    for unit in manifest['translation_units']:
        name = Path(unit['object']).name
        if name in names:
            raise ValueError(f'duplicate source object basename: {name}')
        names.add(name)
        module = unit['module']
        if module not in ('main', 'itcm', 'dtcm') and not re.fullmatch(r'ov00[0-9]|ov01[0-3]', module):
            raise ValueError(f'unsupported source module: {module}')
        relative = Path('delinks.txt') if module == 'main' else Path(module) / 'delinks.txt'
        if module.startswith('ov'):
            relative = Path('overlays') / module / 'delinks.txt'
        source = Path(unit['source'])
        if source.is_absolute() or '..' in source.parts or source.parts[:2] != ('decomp', 'src'):
            raise ValueError('source must be a relative decomp/src file')
        tu = str(source.relative_to('decomp'))
        if source.relative_to('decomp').with_suffix('.o') != Path(unit['object']):
            raise ValueError('source object path differs from dsd TU identity')
        canonical = (root / 'decomp/arm9' / relative).read_text()
        match = re.search(r'^' + re.escape(tu) + r':\s*\n(.*?)(?=^\S|\Z)', canonical, re.M | re.S)
        if not match or not re.search(r'^\s+complete\s*$', match[1], re.M):
            raise ValueError(f'missing complete dsd TU declaration: {tu}')
        target = directory / relative
        target.write_text(target.read_text().rstrip() + '\n' + match[0].rstrip() + '\n')
    if not names:
        raise ValueError('source manifest must declare at least one translation unit')
    return {'config': str(path), 'translation_units': len(names), 'config_sha256': sha256(path)}


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


def verify(rom, output, dsd, lld, clang, root=ROOT, stage_runner=run_command,
           source_manifest=None, source_compiler=None, compiler_runner=None):
    output = output.resolve()
    report = {'schema_version': 1, 'build_id': str(uuid.uuid4()), 'status': 'failed',
              'started_ns': time.time_ns(), 'stages': [],
              'scope': 'native ARM9 main/ITCM/DTCM/14 overlays and exact whole-ROM repack; '
                       'ARM7 and embedded program preserved with zero source credit',
              'source_coverage': {'matched_source_bytes': 0, 'percent': 0}}
    report_path = output / 'report.json'
    try:
        if output.exists():
            report_path = output.parent / f'{output.name}.rejected-{report["build_id"]}.json'
            raise ValueError('output already exists; supply a fresh build directory')
        output.mkdir(parents=True)
        sources = [root / 'tools/scripts' / name for name in
                   ('verify.py', 'baseline_intake.py', 'native_link.py', 'rom_roundtrip.py')]
        sources += [root / 'decomp/toolchain.lock.json', root / 'decomp/rom-manifest.json',
                    root / 'decomp/matching-notes/baseline-t01/executable-regions.json',
                    root / 'decomp/matching-notes/baseline-t01/reference-relocations.json']
        sources += sorted((root / 'decomp/arm9').rglob('*'))
        sources = [p for p in sources if p.is_file()]
        checker_path = root / 'tools/scripts/relocation_check.py'
        if checker_path.is_file():
            sources.append(checker_path)
        manifest = None
        if source_manifest:
            manifest = json.loads(source_manifest.read_text())
            if manifest.get('schema_version') != 1 or not manifest.get('translation_units'):
                raise ValueError('source manifest must declare nonempty schema version 1 translation_units')
            if any(not all(name in unit for name in ('compiler', 'abi', 'headers', 'experimental_overrides'))
                   for unit in manifest['translation_units']):
                raise ValueError('source manifest needs per-TU compiler, ABI, headers, and experiment context')
            sources += [source_manifest, root / 'tools/scripts/source_build.py',
                        root / 'tools/scripts/source_accounting.py',
                        root / 'tools/scripts/header_dependencies.py']
            for unit in manifest['translation_units']:
                sources.extend(source_context_files(root, unit))
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
        rom_manifest = json.loads((root / 'decomp/rom-manifest.json').read_text())
        if intake != rom_manifest:
            raise ValueError('intake metadata differs from pinned ROM manifest')
        report['rom'] = intake['rom']
        snapshot[str(rom)] = sha256(rom)
        if snapshot[str(rom)] != rom_manifest['rom']['sha256']:
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
            if manifest:
                if source_compiler is None or compiler_runner is None:
                    raise ValueError('source build needs explicitly selected compiler and runner')
                for name, path, pin, args in (
                    ('source_compiler', source_compiler, lock['source_compiler'],
                     [compiler_runner, source_compiler, '-version']),
                    ('compiler_runner', compiler_runner, lock['source_compiler_runner'],
                     [compiler_runner, '--version'])):
                    digest = require_tool(path, pin['sha256'])
                    result = command(args)
                    versions[name] = {'sha256': digest, 'version': pin['version'],
                        'command': list(map(str, result.args)), 'stdout': result.stdout,
                        'stderr': result.stderr, 'exit_status': result.returncode}
                    if result.returncode or pin['version'] not in result.stdout:
                        raise ValueError(f'{name}: pinned source tool version mismatch')
                    snapshot[str(path)] = digest
                libraries = lock['source_compiler']['runtime_libraries']
                versions['source_compiler']['runtime_libraries'] = {}
                for name, digest in libraries.items():
                    library = source_compiler.parent / name
                    require_tool(library, digest)
                    snapshot[str(library)] = digest
                    versions['source_compiler']['runtime_libraries'][name] = digest
            report['tools'] = versions
            return versions

        record_stage(report, 'tool_versions', tool_versions)
        regions = json.loads((root / 'decomp/matching-notes/baseline-t01/executable-regions.json').read_text())
        expected = expected_modules(regions)
        record_stage(report, 'prepare_config', lambda: prepare_config(root, output, expected))
        snapshot.update({str(p): sha256(p) for p in (output / 'config').rglob('*') if p.is_file()})
        config = output / 'config/config.yaml'
        record_stage(report, 'extract', lambda: command([dsd, 'rom', 'extract', '-r', rom, '-o', output / 'extract']))
        record_stage(report, 'delink', lambda: command([dsd, 'delink', '-c', config]))
        source_build = None
        objects_directory = output / 'delinks'
        if manifest:
            candidate = record_stage(report, 'source_config',
                                     lambda: prepare_source_config(root, output, manifest))
            config = Path(candidate['config'])
            snapshot.update({str(p): sha256(p) for p in config.parent.rglob('*') if p.is_file()})
            objects_directory = output / 'candidate-delinks'
            record_stage(report, 'source_delink', lambda: command([dsd, 'delink', '-c', config]))
            builder = load_script(root / 'tools/scripts/source_build.py', 'source_build_verify')
            source_build = record_stage(report, 'source_build', lambda: builder.build_sources(
                manifest, root, output / 'source-build', objects_directory, source_compiler, compiler_runner))
            report['source_build'] = source_build
            (output / 'source-objects.json').write_text(json.dumps(source_build['objects'], indent=2) + '\n')
        record_stage(report, 'lcf', lambda: command([dsd, 'lcf', '-c', config]))
        link_command = [
            sys.executable, root / 'tools/scripts/native_link.py', '--lcf', output / 'linked/arm9.lcf',
            '--objects', objects_directory, '--output', output / 'native-link',
            '--lld', lld, '--clang', clang]
        if manifest:
            link_command += ['--source-objects', output / 'source-objects.json']
        record_stage(report, 'native_link', lambda: command(link_command))
        report['link_inputs'] = record_stage(report, 'link_inputs',
                                          lambda: verify_link_record(output, report['tools'], source_build))
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
        accounting = None
        ownership = None
        if manifest:
            accounting = load_script(root / 'tools/scripts/source_accounting.py', 'source_accounting_verify')
            ownership = record_stage(report, 'source_ownership', lambda: accounting.verify_source_ownership(
                source_build, report['link_inputs'], (output / 'linked/arm9.lcf').read_text(),
                output / 'native-link/link.map', output / 'native-link/linked.elf', config.parent))
            report['source_ownership'] = ownership

        def freshness():
            require_unchanged(snapshot)
            directories = ('config', 'delinks', 'linked', 'native-link')
            if manifest:
                directories += ('candidate-config', 'candidate-delinks', 'source-build')
            artifacts = sorted(p for directory in directories
                               for p in (output / directory).rglob('*') if p.is_file())
            for path in artifacts:
                if path.is_symlink() or path.stat().st_mtime_ns < report['started_ns']:
                    raise ValueError(f'stale output artifact: {path.name}')
            report['artifact_hashes'] = {str(p.relative_to(output)): sha256(p) for p in artifacts}
            return {'artifact_count': len(artifacts), 'inputs_unchanged': True}

        record_stage(report, 'freshness', freshness)
        checkpoint = verified_module_checkpoint(report, source_enabled=bool(manifest))
        packer = load_script(root / 'tools/scripts/rom_roundtrip.py', 'rom_roundtrip_verify')
        rebuilt_rom = output / 'rebuilt.nds'
        report['rom_roundtrip'] = record_stage(report, 'rom_roundtrip', lambda: packer.roundtrip_rom(
            rom, output, regions, checkpoint, rebuilt_rom))
        record_stage(report, 'rom_freshness', lambda: require_rom_freshness(
            snapshot, report, output, rebuilt_rom, report['rom']['sha256']))
        require_stages(report['stages'], source_enabled=bool(manifest))
        if manifest:
            report['source_coverage'] = accounting.summarize_coverage(ownership, config.parent,
                                                                     verification_passed=True)
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
    for name in ('source-manifest', 'source-compiler', 'compiler-runner'):
        parser.add_argument('--' + name, type=Path)
    args = parser.parse_args()
    report, path = verify(args.rom.resolve(), args.output, tool_argument(args.dsd),
                          tool_argument(args.lld), tool_argument(args.clang),
                          source_manifest=args.source_manifest.resolve() if args.source_manifest else None,
                          source_compiler=tool_argument(args.source_compiler) if args.source_compiler else None,
                          compiler_runner=tool_argument(args.compiler_runner) if args.compiler_runner else None)
    print(json.dumps({'status': report['status'], 'report': str(path)}))
    return 0 if report['status'] == 'passed' else 1


if __name__ == '__main__':
    sys.exit(main())
