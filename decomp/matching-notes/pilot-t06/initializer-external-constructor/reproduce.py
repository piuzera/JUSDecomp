#!/usr/bin/env python3
"""Compile saved initializer candidates against a complete private reference TU."""
import argparse
import hashlib
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / 'tools/scripts'))
from source_build import build_sources, sha256
from compiler_experiments import summarize_object, mismatch_offsets
from native_link import Elf32


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('compiler', 'runner', 'reference-dir', 'output'):
        parser.add_argument('--' + name, required=True, type=Path)
    parser.add_argument('--contexts', type=Path, help='saved bounded context manifest')
    args = parser.parse_args()
    directory = Path(__file__).resolve().parent
    parser_context = args.contexts if args.contexts else directory / 'contexts.json'
    saved = json.loads(parser_context.read_text())
    lock = json.loads((ROOT / 'decomp/toolchain.lock.json').read_text())
    pins = {args.compiler: lock['source_compiler']['sha256'],
            args.runner: lock['source_compiler_runner']['sha256']}
    pins.update({args.compiler.parent / name: digest for name, digest
                 in lock['source_compiler']['runtime_libraries'].items()})
    for path, digest in pins.items():
        if sha256(path) != digest:
            raise ValueError('compiler/runner/runtime pin differs')
    for source in saved['sources']:
        if sha256(ROOT / source['path']) != source['sha256']:
            raise ValueError('saved source pin differs')
    reference = args.reference_dir / 'src/main/common_effect_init.o'
    if sha256(reference) != saved['reference_sha256']:
        raise ValueError('complete original reference TU pin differs')
    if args.output.exists():
        raise ValueError('fresh output directory required')
    args.output.mkdir(parents=True)
    report = {'schema_version': 1, 'scope': 'bounded ordinary C++ ABI candidates',
              'source_credit': 0, 'promotion_status': 'not_activated',
              'reference': summarize_object(reference), 'saved_contexts': saved,
              'tool_hashes': {str(p): v for p, v in pins.items()}, 'trials': []}
    for source in saved['sources']:
        for context in saved['contexts']:
            unit = {'module': 'main', 'object': 'src/main/common_effect_init.o',
                    'source': source['path'], 'functions': ['func_0206c244'],
                    'category': 'game', 'cpu': 'arm946e', 'flags': context['flags'],
                    'include_paths': [], 'headers': {},
                    'compiler': {'package': '2.0/base', 'sha256': lock['source_compiler']['sha256'],
                                 'runner_sha256': lock['source_compiler_runner']['sha256'],
                                 'selection_scope': 'bounded initializer experiment only'},
                    'abi': {'language': 'C++', 'instruction_mode': 'arm', 'endianness': 'little',
                            'pointer_bits': 32, 'settings': 'pinned compiler defaults'}}
            result = build_sources({'schema_version': 1, 'translation_units': [unit]}, ROOT,
                                   args.output / source['id'] / context['id'],
                                   args.reference_dir, args.compiler, args.runner)
            record = {'source': source['id'], 'context': context['id'], 'result': result}
            if result['units'] and result['units'][0].get('compiled'):
                compiled = Path(result['units'][0]['compiled']['path'])
                try:
                    record['object'] = summarize_object(compiled)
                    record['masked_mismatches'] = mismatch_offsets(reference, compiled)
                except ValueError as error:
                    # Preserve the complete rejected object inventory, including duplicate sections.
                    elf = Elf32(compiled.read_bytes())
                    record['object'] = {'sha256': sha256(compiled),
                        'summary_error': str(error),
                        'allocated_sections': [{'index': i, 'name': elf.section_name(section),
                            'size': section[5], 'sha256': hashlib.sha256(elf.content(section)).hexdigest()}
                            for i, section in enumerate(elf.sections) if section[2] & 2],
                        'defined_functions': [{'name': elf.symbol_name(symbol), 'size': symbol[2],
                            'section': symbol[5]} for symbol in elf.symbols()
                            if symbol[3] & 15 == 2 and symbol[5] != 0 and symbol[2]
                            and not elf.symbol_name(symbol).startswith('$')]}

            report['trials'].append(record)
    for path, digest in pins.items():
        if sha256(path) != digest:
            raise ValueError('tool/runtime changed during trials')
    for source in saved['sources']:
        if sha256(ROOT / source['path']) != source['sha256']:
            raise ValueError('source changed during trials')
    if sha256(reference) != saved['reference_sha256']:
        raise ValueError('reference changed during trials')
    report['exact_object_trials'] = [dict(source=t['source'], context=t['context']) for t in report['trials']
                                     if t['result']['status'] == 'passed']
    report['status'] = 'completed'
    report['implementation_sha256'] = {name: sha256(ROOT / 'tools/scripts' / name)
                                      for name in ['source_build.py', 'compiler_experiments.py',
                                                   'native_link.py', 'header_dependencies.py']}
    (args.output / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'trials': len(report['trials']), 'exact_object_trials': report['exact_object_trials'],
                      'source_credit': 0}))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
