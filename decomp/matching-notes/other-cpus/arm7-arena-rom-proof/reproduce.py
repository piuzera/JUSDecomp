"""One public research replay(fresh_output) -> receipt Path."""
import copy
import importlib.util
import json
from pathlib import Path
import sys
import time

if not __debug__: raise ValueError('optimized Python cannot run assertion-based reference readers')
sys.dont_write_bytecode=True
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[3]
sys.path.insert(0,str(ROOT/'tools/scripts'))
OLD=ROOT/'decomp/matching-notes/other-cpus/arm7-indexed-loads-proof'
sys.path.insert(0,str(OLD))
import verify
import arm7_native_baseline
import child_native_baseline
import rom as research_rom

spec=importlib.util.spec_from_file_location('accepted_indexed_loads_replay',OLD/'reproduce.py')
accepted=importlib.util.module_from_spec(spec); spec.loader.exec_module(accepted)


def _prepare(output, parent_dsd=None):
    output=Path(output)
    if output.exists() or output.is_symlink(): raise ValueError('replay requires absent fresh output')
    output=output.resolve(); output.mkdir(parents=True)
    started=time.time_ns()
    catalog=json.loads((HERE/'dependency-catalog.json').read_text())
    profile=json.loads((HERE/'profile.json').read_text())
    snapshot={str(ROOT/name):pin for name,pin in catalog['repository_sha256'].items()}
    for tool in catalog['external_tools'].values(): verify.merge_snapshot(snapshot,{tool['path']:tool['sha256']})
    verify.merge_snapshot(snapshot,{catalog['rom']['path']:catalog['rom']['sha256']})
    pins_path=HERE/'evidence-pins.json'
    for name,pin in json.loads(pins_path.read_text())['input_sha256'].items(): verify.merge_snapshot(snapshot,{str(HERE/name):pin})
    verify.merge_snapshot(snapshot,{str(pins_path):verify.sha256(pins_path)})
    dsd=Path(profile['parent_dsd']) if parent_dsd is None else Path(parent_dsd)
    if verify.sha256(dsd)!=verify.sha256(Path(profile['parent_dsd'])): raise ValueError('private consumed DSD copy differs')
    verify.merge_snapshot(snapshot,{str(dsd):verify.sha256(dsd)})
    verify.require_unchanged(snapshot)
    report={'status':'running','started_ns':started,'stages':[],'scope':'finite research whole-ROM integration; canonical approval unchanged'}
    build=output/'parent'; rom=Path(catalog['rom']['path'])
    def parent_action():
        parent,path=verify.verify(rom,build,Path(profile['parent_dsd']) if parent_dsd is None else dsd,Path(profile['lld']),Path(profile['clang']),root=ROOT,
                    source_manifest=ROOT/profile['parent_source_manifest'],source_compiler=Path(profile['parent_compiler']),compiler_runner=Path(profile['runner']))
        if parent['status']!='passed' or len(parent['stages'])!=19 or parent['source_coverage']['matched_source_bytes']!=304:
            raise ValueError('fresh source-enabled parent verification failed')
        return parent
    parent=verify.record_stage(report,'parent_verification',parent_action)
    context=research_rom._Context(ROOT,output,build,rom,started,snapshot,parent,
             {name:verify.sha256(build/name) for name in ('report.json','rebuilt.nds')},report,
             json.loads((ROOT/'decomp/matching-notes/baseline-t01/executable-regions.json').read_text()),
             json.loads((OLD/'checked-layouts.json').read_text()),output/'trial')
    def arm7_action():
        context.arm7_operation=arm7_native_baseline.build_baselines(rom,build/'arm7-native',ROOT/profile['arm7_approval'],Path(profile['arm7_producer']),ROOT,parent['build_id'],parent['started_ns'])
        return context.arm7_operation.report
    verify.record_stage(report,'arm7_native_baselines',arm7_action)
    def child_action():
        context.child_operation=child_native_baseline.build_child(original=rom,output=build/'child-arm9',root=ROOT,build_id=parent['build_id'],started_ns=parent['started_ns'],native_tools=parent['tools'],
                 analyzer=Path(profile['child_analyzer']),analyzer_approval=ROOT/profile['child_analyzer_approval'],encoder=Path(profile['child_encoder']),codec_approval=ROOT/profile['child_codec_approval'])
        return context.child_operation.report
    verify.record_stage(report,'child_arm9_native_roundtrip',child_action)
    verify.merge_snapshot(snapshot,parent['source_build']['input_hashes'])
    verify.merge_snapshot(snapshot,context.arm7_operation.report['snapshot']); verify.merge_snapshot(snapshot,context.child_operation.report['snapshot'])
    verify.record_stage(report,'research_trial',lambda:research_rom._start_trial(context,accepted.replay))
    def gate_action():
        context.checkpoint=research_rom._checkpoint(context)
        return research_rom._gate(context)[0]
    verify.record_stage(report,'integrated_input_gate',gate_action)
    (output/'module-checkpoint.json').write_text(json.dumps(context.checkpoint,indent=2)+'\n')
    return context


def replay(fresh_output: Path) -> Path:
    context=_prepare(fresh_output)
    result=verify.record_stage(context.report,'research_pack',lambda:research_rom._pack(context,context.output/'research.nds'))
    context.report['research_pack']=result
    def freshness():
        research_rom._gate(context)
        files=research_rom._inventory(context.output,context.started)
        context.report['artifact_hashes']=files
        return verify.require_rom_freshness(context.snapshot,context.report,context.output,context.output/'research.nds',context.parent['rom']['sha256'])
    verify.record_stage(context.report,'final_freshness',freshness)
    verify.require_stage_sequence(context.report['stages'],list(research_rom.STAGES))
    context.report.update(status='passed',finished_ns=time.time_ns(),rom=result['rom'],source_credit={'canonical':304,'arm7':0,'global_percent':None},
                          parent_outputs=context.parent_outputs,canonical_approvals_unchanged=True,t06_complete=False,t10_complete=False,
                          input_sha256=context.snapshot,trial_artifact_sha256=context.trial_operation.inventory)
    path=context.output/'trial-proof.json'
    published=(json.dumps(context.report,indent=2)+'\n').encode()
    with path.open('xb') as stream: stream.write(published)
    research_rom._gate(context)
    verify.require_rom_freshness(context.snapshot,context.report,context.output,context.output/'research.nds',context.parent['rom']['sha256'])
    if path.is_symlink() or not path.is_file() or not path.resolve().is_relative_to(context.output.resolve()) or path.stat().st_mtime_ns<context.started or path.read_bytes()!=published:
        raise ValueError('published research receipt changed or escaped fresh output')
    return path


if __name__=='__main__': print(replay(Path(sys.argv[1])))
