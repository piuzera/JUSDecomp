#!/usr/bin/env python3
"""Inspect bounded public C++ probes without accepting or rewriting objects."""
import argparse
import copy
import hashlib
import json
import os
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / 'tools/scripts'))
from relocation_check import _checked_elf
from source_build import _object, build_sources


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def inventory(path):
    elf = _checked_elf(path)
    symbols = elf.symbols()
    sections = []
    for index, section in enumerate(elf.sections):
        if section[2] & 2 and section[5]:
            sections.append({'index': index, 'name': elf.section_name(section),
                             'type': section[1], 'flags': section[2], 'size': section[5],
                             'alignment': section[8],
                             'payload_sha256': hashlib.sha256(elf.content(section)).hexdigest()
                             if section[1] != 8 else None})
    functions = [{'name': elf.symbol_name(symbol), 'section_index': symbol[5],
                  'offset': symbol[1], 'size': symbol[2]}
                 for symbol in symbols if symbol[3] & 15 == 2 and symbol[2] and symbol[5]]
    relocations = []
    for section in elf.sections:
        if section[1] == 4:
            for offset, info, addend in struct.iter_unpack('<IIi', elf.content(section)):
                relocations.append({'target_section_index': section[7], 'offset': offset,
                                    'type': info & 255, 'symbol': elf.symbol_name(symbols[info >> 8]),
                                    'addend': addend})
    try:
        _object(path)
        gate = {'status': 'supported_shape'}
    except ValueError as error:
        gate = {'status': 'rejected', 'reason': str(error)}
    return {'allocated_sections': sections, 'defined_functions': functions,
            'undefined_symbols': [elf.symbol_name(symbol) for symbol in symbols
                                  if not symbol[5] and elf.symbol_name(symbol)],
            'relocations': relocations, 'source_gate_shape': gate}


def run_reference_trials(reference_dir, bound_reference_dir, compiler, runner, output):
    lock = json.loads((ROOT / 'decomp/toolchain.lock.json').read_text())
    unit = {'module': 'main', 'object': 'src/main/common_effect_destroy.o',
            'source': 'decomp/matching-notes/pilot-t06/class/common_effect_destroy.cpp',
            'functions': ['_ZN15CommonEffectAbi7DestroyEv'], 'category': 'game', 'cpu': 'arm946e',
            'flags': ['-Cpp_exceptions', 'off', '-nostdinc', '-O2'], 'include_paths': [], 'headers': {},
            'compiler': {'package': '2.0/base', 'sha256': lock['source_compiler']['sha256'],
                         'runner_sha256': lock['source_compiler_runner']['sha256'],
                         'selection_scope': 'this explicit ABI member only'},
            'abi': {'language': 'C++', 'instruction_mode': 'arm', 'endianness': 'little',
                    'pointer_bits': 32, 'settings': 'pinned compiler defaults'}}
    manifest = {'schema_version': 1, 'translation_units': [unit]}
    references = [Path(directory) / unit['object'] for directory in (reference_dir, bound_reference_dir)]
    before = [digest(path) for path in references]
    original = build_sources(manifest, ROOT, output / 'original-name', reference_dir, compiler, runner)
    default = copy.deepcopy(manifest)
    default['translation_units'][0]['flags'].remove('-O2')
    wrong_extent = build_sources(default, ROOT, output / 'default-context', bound_reference_dir, compiler, runner)
    matched = build_sources(manifest, ROOT, output / 'matched', bound_reference_dir, compiler, runner)
    mutated = copy.deepcopy(manifest)
    mutated['translation_units'][0]['flags'].append('-Dfunc_02015ed8=func_02015ed14')
    changed_call = build_sources(mutated, ROOT, output / 'changed-call', bound_reference_dir, compiler, runner)
    bridge_manifest = copy.deepcopy(manifest)
    bridge_manifest['translation_units'][0].update(
        source='decomp/matching-notes/pilot-t06/class/common_effect_destroy_bridge.cpp',
        functions=['func_0206d010'])
    bridge = build_sources(bridge_manifest, ROOT, output / 'bridge', reference_dir, compiler, runner)
    unchanged = before == [digest(path) for path in references]
    passed = (matched['status'] == 'passed' and matched['accepted_units'] == 1 and unchanged
              and bridge['status'] == 'passed' and bridge['accepted_units'] == 1
              and all(item['status'] == 'failed' and item['accepted_units'] == 0 and item['objects'] == {}
                      for item in (original, wrong_extent, changed_call))
              and 'function identities' in original.get('failure', '')
              and 'function identities' in wrong_extent.get('failure', '')
              and 'relocation identities' in changed_call.get('failure', '')
              and matched['units'][0]['compiled']['sha256'] != changed_call['units'][0]['compiled']['sha256'])
    return {'schema_version': 1, 'status': 'passed' if passed else 'failed', 'source_credit': 0,
            'promotion_status': 'pending_full_pipeline_review', 'reference_inputs_unchanged': unchanged,
            'original_name': original, 'wrong_extent': wrong_extent, 'matched': matched,
            'changed_call': changed_call, 'bridge': bridge}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True, type=Path)
    parser.add_argument('--runner', required=True, type=Path)
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--reference-dir', type=Path)
    parser.add_argument('--bound-reference-dir', type=Path)
    args = parser.parse_args()
    if bool(args.reference_dir) != bool(args.bound_reference_dir):
        parser.error('original and explicitly bound complete reference TUs must be supplied together')
    compiler, runner, output = args.compiler.resolve(), args.runner.resolve(), args.output.resolve()
    lock = json.loads((ROOT / 'decomp/toolchain.lock.json').read_text())
    tools = {compiler: lock['source_compiler']['sha256'], runner: lock['source_compiler_runner']['sha256']}
    tools.update({compiler.parent / name: expected for name, expected
                  in lock['source_compiler']['runtime_libraries'].items()})
    for path, expected in tools.items():
        if digest(path) != expected:
            raise ValueError('tool/runtime library differs from the public pin')
    output.mkdir(parents=True, exist_ok=False)
    environment = {key: value for key, value in os.environ.items()
                   if not key.upper().startswith(('MWC', 'MWARM'))}
    directory = Path(__file__).resolve().parent
    cases = [('shape-default', 'shape.cpp', []),
             ('shape-O2-noRTTI-inlineoff', 'shape.cpp', ['-O2', '-RTTI', 'off', '-inline', 'off']),
             ('single-member-default', 'single_member.cpp', []),
             ('single-member-O2', 'single_member.cpp', ['-O2'])]
    report = {'schema_version': 1, 'status': 'passed', 'source_credit': 0,
              'scope': 'public synthetic compiler probes; no reference or link acceptance',
              'tool_hashes': {path.name: expected for path, expected in tools.items()}, 'cases': []}
    for name, filename, flags in cases:
        source, destination = directory / filename, output / (name + '.o')
        source_hash = digest(source)
        command = [str(runner), str(compiler), '-c', '-proc', 'arm946e',
                   '-Cpp_exceptions', 'off', '-nostdinc', *flags,
                   '-o', str(destination), str(source)]
        completed = subprocess.run(command, cwd=ROOT, env=environment, capture_output=True, text=True)
        record = {'name': name, 'source': str(source.relative_to(ROOT)), 'source_sha256': source_hash,
                  'flags': flags, 'command': command, 'exit_status': completed.returncode,
                  'stdout': completed.stdout, 'stderr': completed.stderr}
        if completed.returncode or not destination.is_file() or digest(source) != source_hash:
            report['status'] = 'failed'
        else:
            record.update(object_sha256=digest(destination), inventory=inventory(destination))
        report['cases'].append(record)
    if args.reference_dir:
        report['reference_trials'] = run_reference_trials(args.reference_dir.resolve(),
                                  args.bound_reference_dir.resolve(), compiler, runner, output / 'reference-trials')
        if report['reference_trials']['status'] != 'passed':
            report['status'] = 'failed'
    for path, expected in tools.items():
        if digest(path) != expected:
            report['status'] = 'failed'
    (output / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'status': report['status'], 'cases': len(cases), 'source_credit': 0}))
    return 0 if report['status'] == 'passed' else 1


if __name__ == '__main__':
    raise SystemExit(main())
