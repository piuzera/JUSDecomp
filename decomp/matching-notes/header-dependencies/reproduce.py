#!/usr/bin/env python3
"""Run the public synthetic header gate with private pinned tools."""
import argparse
import copy
import hashlib
import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0,str(ROOT/'tools/scripts'))
from header_dependencies import capture_and_compile
from source_build import build_sources


def digest(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler',required=True,type=Path)
    parser.add_argument('--runner',required=True,type=Path)
    parser.add_argument('--output',required=True,type=Path)
    args=parser.parse_args()
    output=args.output.resolve();output.mkdir(parents=True,exist_ok=False)
    compiler,runner=args.compiler.resolve(),args.runner.resolve()
    lock=json.loads((ROOT/'decomp/toolchain.lock.json').read_text())
    tools={compiler:lock['source_compiler']['sha256'],runner:lock['source_compiler_runner']['sha256']}
    tools.update({compiler.parent/name:value for name,value in lock['source_compiler']['runtime_libraries'].items()})
    for path,expected in tools.items():
        if digest(path)!=expected:raise ValueError('tool/runtime-library differs from lock')
    fixture=Path(__file__).resolve().parent/'fixture'
    unit={'module':'public_fixture','object':'public.o','source':str((fixture/'public.c').relative_to(ROOT)),
          'functions':['public_header_probe'],'category':'unknown','cpu':'arm946e',
          'flags':['-Cpp_exceptions','off','-nostdinc','-cwd','source','-DPUBLIC_CONSTANT_HEADER="constants.h"'],
          'include_paths':[str((fixture/'include').relative_to(ROOT))],
          'forced_headers':[str((fixture/'forced.h').relative_to(ROOT))],
          'headers':{str(path.relative_to(ROOT)):digest(path) for path in [fixture/'record.h',fixture/'include/constants.h',fixture/'forced.h']},
          'compiler':{'package':lock['source_compiler']['package'],'sha256':digest(compiler),'runner_sha256':digest(runner)},
          'abi':{'language':'C','instruction_mode':'arm','endianness':'little','pointer_bits':32,'settings':'pinned compiler defaults'}}
    environment={k:v for k,v in os.environ.items() if not k.upper().startswith(('MWC','MWARM'))}
    reference=output/'reference/public.o'
    pre=capture_and_compile(unit,ROOT,fixture/'public.c',reference,compiler,runner,environment)
    (output/'reference-dependencies.json').write_text(json.dumps(pre,indent=2)+'\n')
    if pre['status']!='passed':raise ValueError(pre.get('failure'))
    reference_hash=digest(reference)
    manifest={'schema_version':1,'translation_units':[unit]}
    good=build_sources(manifest,ROOT,output/'accepted',output/'reference',compiler,runner)
    mutated=copy.deepcopy(manifest)
    mutated['translation_units'][0]['flags']=[flag.replace('constants.h','missing.h') for flag in unit['flags']]
    bad=build_sources(mutated,ROOT,output/'rejected',output/'reference',compiler,runner)
    (output/'good.json').write_text(json.dumps(good,indent=2)+'\n')
    (output/'changed-context.json').write_text(json.dumps(bad,indent=2)+'\n')
    summary={'schema_version':1,'status':'passed' if good['status']=='passed' and bad['status']=='failed' and bad['accepted_units']==0 and bad['objects']=={} and digest(reference)==reference_hash else 'failed',
             'synthetic_reference_only':True,'jus_source_credit':0,'good_status':good['status'],
             'changed_context_status':bad['status'],'changed_context_accepted_units':bad['accepted_units'],
             'reference_unchanged':digest(reference)==reference_hash,
             'ordered_dependencies':good['units'][0].get('dependencies',{}).get('ordered_dependencies',[]),
             'before_sha256':good['units'][0].get('dependencies',{}).get('before_sha256',{}),
             'after_sha256':good['units'][0].get('dependencies',{}).get('after_sha256',{}),
             'tool_hashes':{path.name:value for path,value in tools.items()}}
    (output/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    print(json.dumps(summary))
    return 0 if summary['status']=='passed' else 1


if __name__=='__main__':raise SystemExit(main())
