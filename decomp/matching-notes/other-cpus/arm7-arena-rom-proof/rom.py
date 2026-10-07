"""Fixed live research owner and twenty-write pack, using unchanged gates."""
from dataclasses import dataclass
import copy
import hashlib
import json
from pathlib import Path
import time
import arm7_native_baseline as approved_arm7
import child_native_baseline as approved_child
import rom_roundtrip as canonical_rom
import verify
import loads

HERE = Path(__file__).resolve().parent
_SEAL = object()
STAGES = ('parent_verification','arm7_native_baselines','child_arm9_native_roundtrip','research_trial','integrated_input_gate','research_pack','final_freshness')


def _sha(data): return hashlib.sha256(data).hexdigest()


def _inventory(directory, started):
    result = {}
    for path in sorted(directory.rglob('*')):
        if path.is_symlink() or not path.resolve().is_relative_to(directory.resolve()):
            raise ValueError('artifact is a symlink or escapes fresh output')
        if path.is_file():
            if path.stat().st_mtime_ns < started: raise ValueError('stale artifact: '+str(path))
            result[str(path.relative_to(directory))] = _sha(path.read_bytes())
    return result


@dataclass
class _Context:
    root: Path
    output: Path
    build: Path
    rom: Path
    started: int
    snapshot: dict
    parent: dict
    parent_outputs: dict
    report: dict
    regions: dict
    layouts: list
    trial_dir: Path
    checkpoint: dict = None
    arm7_operation: object = None
    child_operation: object = None
    trial_operation: object = None


class _ResearchOperation:
    def __init__(self, seal, context, receipt):
        if seal is not _SEAL: raise ValueError('research owner requires actual fresh replay')
        self.directory = context.trial_dir
        self.expected_directory = context.trial_dir.resolve()
        self.receipt = copy.deepcopy(receipt)
        self.inventory = _inventory(self.directory,context.started)
        self.inputs = dict(context.snapshot)

    def recheck(self, context):
        if self.directory.resolve() != self.expected_directory or self.expected_directory != context.trial_dir.resolve():
            raise ValueError('research directory identity changed')
        verify.require_unchanged(self.inputs)
        if _inventory(self.directory,context.started) != self.inventory: raise ValueError('actual trial inventory changed')
        current = json.loads((self.directory/'trial-proof.json').read_text())
        if current != self.receipt: raise ValueError('actual trial receipt changed')
        if current['status'] != 'actual_seven_MW_indexed_loads_exact_original_images' or current['source_credit_bytes'] != 0:
            raise ValueError('actual research trial did not pass finite contract')
        contract = loads._load_contract(); recipe = json.loads((loads.HERE/'recipes.json').read_text())
        candidates = []
        for row,record in zip(contract['candidates'],current['candidates'],strict=True):
            path = self.directory/(row['role']+'.o')
            selected = recipe['recipes'][row['recipe']]
            argv = [recipe['runner'],selected['compiler'],*selected['flags'],str(self.directory/Path(row['source']).name),'-o',str(path)]
            command = json.loads((self.directory/(row['role']+'-compile.json')).read_text())
            if command != record['compile_command'] or command['argv'] != argv or command['returncode'] != 0 or command['stdout'] or command['stderr']:
                raise ValueError('actual compile-command provenance differs')
            if _sha((self.directory/Path(row['source']).name).read_bytes()) != row['source_sha256']:
                raise ValueError('actual compiled C input differs')
            actual = loads._inspect_object(path,row,contract)
            if actual != record['elf']: raise ValueError('actual MW object readback differs')
            candidates.append(loads.VerifiedCandidate(row,path,actual,command))
        self.candidates = tuple(candidates)
        buffers = tuple(_read_trial_elf(context,i,self.directory/f'native/program-{i}/positive.elf') for i in range(2))
        return buffers


def _read_trial_elf(context, index, elf_path):
    if not __debug__: raise ValueError('optimized Python cannot run assertion-based reference readers')
    contract = loads._load_contract()
    owner = context.trial_operation
    if type(owner) is not _ResearchOperation: raise ValueError('live research owner required')
    candidates = getattr(owner,'candidates',None)
    if candidates is None: raise ValueError('actual objects have not been rechecked')
    originals = approved_arm7._programs(context.rom.read_bytes(),context.layouts)
    _,image,_,_ = originals[index]
    original = {'layout':context.layouts[index],'image':image}
    bindings = loads.FiveBindings(**{field:spec['value'] for field,spec in contract['bindings'].items()})
    header,sections,segments,_ = loads._parse_elf(elf_path)
    if header['flags'] != 0x05000200: raise ValueError('actual ARMv4T native ELF flags differ')
    readback = loads._read_native(elf_path,owner.directory/f'native/program-{index}/positive.map',candidates,original,contract,bindings)
    captured = owner.receipt['programs'][index]['positive']
    for name,value in readback.items():
        if captured.get(name) != value: raise ValueError('actual native readback differs: '+name)
    allocated = [s for s in sections if s['flags']&2 and s['size']]
    data = elf_path.read_bytes()
    parts = {s['name']:data[p['offset']:p['offset']+p['file_bytes']] for s,p in zip(allocated,segments,strict=True) if p['file_bytes']}
    buffer = b''.join(parts['.arm7.'+name] for name in ('startup','autoload0','autoload1','table'))
    if len(buffer) != 165552 or buffer != image: raise ValueError('actual native ARM7 buffer differs from original')
    return buffer


def _start_trial(context, accepted_replay):
    path = accepted_replay(context.trial_dir)
    if path.resolve() != (context.trial_dir/'trial-proof.json').resolve(): raise ValueError('unexpected actual trial receipt path')
    owner = _ResearchOperation(_SEAL,context,json.loads(path.read_text()))
    context.trial_operation = owner
    owner.recheck(context)
    return {'status':'passed','receipt':str(path.relative_to(context.output)),'receipt_sha256':_sha(path.read_bytes()),'objects':7,'distinct_candidate_bytes':460,'paired_candidate_bytes':920,'source_credit_bytes':0}


def _canonical_inventory(context):
    names = ('config','delinks','linked','native-link','candidate-config','candidate-delinks','source-build','arm7-native','child-arm9')
    files = {}
    for name in names:
        files.update({name+'/'+p:pin for p,pin in _inventory(context.build/name,context.parent['started_ns']).items()})
    for name,pin in context.parent_outputs.items():
        path=context.build/name
        if path.is_symlink() or path.stat().st_mtime_ns<context.parent['started_ns'] or _sha(path.read_bytes())!=pin:
            raise ValueError('original parent verification output changed')
        files[name] = pin
    return files


def _checkpoint(context):
    report = copy.deepcopy(context.parent)
    if [s['name'] for s in report['stages'][-3:]] != ['freshness','rom_roundtrip','rom_freshness']:
        raise ValueError('source-enabled parent stages differ')
    report['stages'] = report['stages'][:-3]
    report.pop('rom_roundtrip',None); report.pop('finished_ns',None)
    report['arm7_baselines'] = context.arm7_operation.report
    report['child_arm9'] = context.child_operation.report
    report['stages'].extend(copy.deepcopy(context.report['stages'][1:3]))
    def fresh():
        verify.require_unchanged(context.snapshot)
        report['artifact_hashes'] = _canonical_inventory(context)
        return {'inputs_unchanged':True,'artifact_count':len(report['artifact_hashes'])}
    verify.record_stage(report,'freshness',fresh)
    return verify.verified_module_checkpoint(report,source_enabled=True,arm7_enabled=True,child_enabled=True)


def _gate(context):
    verify.require_unchanged(context.snapshot)
    names = [s['name'] for s in context.report['stages']]
    if names[:4] != list(STAGES[:4]) or any(s['status']!='passed' for s in context.report['stages'][:4]):
        raise ValueError('actual mandatory research stage absent or failed')
    if type(context.trial_operation) is not _ResearchOperation: raise ValueError('live research owner required; saved JSON cannot pack')
    if _canonical_inventory(context) != context.checkpoint['artifact_hashes']:
        raise ValueError('canonical artifact inventory changed')
    buffers = context.trial_operation.recheck(context)
    proof = canonical_rom._verify_build(context.rom,context.rom.read_bytes(),context.build,context.regions,context.checkpoint,context.arm7_operation,context.child_operation)
    approved = approved_arm7.recheck_baselines(context.arm7_operation.report,context.build,context.rom.read_bytes(),context.parent['build_id'],context.parent['started_ns'],context.arm7_operation)
    programs = approved_arm7._programs(context.rom.read_bytes(),context.layouts)
    for index,(payload,buffer,(offset,image,lo,hi)) in enumerate(zip(approved,buffers,programs,strict=True)):
        if payload['data'] != buffer or payload['rom_offset'] != offset or payload['program_start'] != lo or payload['program_end'] != hi or payload['identity'] != context.layouts[index]['identity']:
            raise ValueError('research and approved original program contexts differ')
    return {'status':'passed','canonical':proof,'trial':_trial_summary(context)},buffers


def _trial_summary(context):
    return {'objects':7,'distinct_candidate_bytes':460,'paired_candidate_bytes':920,'source_credit_bytes':0,
            'programs':[{'identity':layout['identity'],'image_offset':offset,'image_bytes':len(image),'bss_bytes':sum(r['bss_bytes'] for r in layout['regions']),
                         'elf_sha256':_sha((context.trial_dir/f'native/program-{i}/positive.elf').read_bytes()),'map_sha256':_sha((context.trial_dir/f'native/program-{i}/positive.map').read_bytes()),
                         'actual_readback':context.trial_operation.receipt['programs'][i]['positive']}
                        for i,(layout,(offset,image,_,_)) in enumerate(zip(context.layouts,approved_arm7._programs(context.rom.read_bytes(),context.layouts),strict=True))],
            'candidates':context.trial_operation.receipt['candidates']}


def _pending(context):
    _,buffers = _gate(context)
    original = context.rom.read_bytes()
    targets,_ = canonical_rom._layout(original,context.regions)
    pending=[]
    for target in targets:
        path=context.build/'native-link'/target['filename']; data=path.read_bytes(); digest=_sha(data)
        if path.is_symlink() or len(data)!=target['bytes'] or digest!=target['hashes']['sha256']:
            raise ValueError('actual parent ARM9 buffer differs')
        record={'module':target['module'],'input_file':str(path.relative_to(context.output)),'rom_offset':target['rom_offset'],'size_bytes':len(data),'sha256':digest}
        pending.append((target['rom_offset'],data,0,len(original),record))
    child=approved_child.recheck_child(context.child_operation.report,context.build,original,context.parent['build_id'],context.parent['started_ns'],context.child_operation)
    record={'module':'ARM9','identity':child['identity'],'input_file':child['image_path'],'rom_offset':child['rom_offset'],'size_bytes':len(child['data']),'sha256':child['sha256'],'source_bytes':0}
    for key in ('image_slice_offset','image_sha256','elf_sha256'): record[key]=child[key]
    pending.append((child['rom_offset'],child['data'],child['program_start'],child['program_end'],record))
    for i,(buffer,(offset,_,lo,hi)) in enumerate(zip(buffers,approved_arm7._programs(original,context.layouts),strict=True)):
        record={'module':'ARM7','identity':context.layouts[i]['identity'],'input_file':str((context.trial_dir/f'native/program-{i}/positive.elf').relative_to(context.output)),
                'rom_offset':offset,'size_bytes':len(buffer),'sha256':_sha(buffer),'source_bytes':0,'research_candidate_bytes':460,
                'elf_sha256':_sha((context.trial_dir/f'native/program-{i}/positive.elf').read_bytes()),'native_program_index':i,
                'native_readback':f'/research_pack/trial/programs/{i}/actual_readback'}
        pending.append((offset,buffer,lo,hi,record))
    if len(pending)!=20: raise ValueError('finite pack requires seventeen parent, one child ARM9 and two research ARM7 writes')
    return pending


def _pack(context, output_rom):
    output_rom=Path(output_rom)
    if output_rom.exists() or output_rom.is_symlink() or not output_rom.resolve().is_relative_to(context.output.resolve()):
        raise ValueError('research output must be a new contained file')
    start=time.time_ns(); original=context.rom.read_bytes()
    pending=_pending(context)
    rebuilt=bytes(canonical_rom._apply_writes(original,pending))
    for _,_,lo,hi,record in pending:
        if record.get('identity',{}).get('program',{}).get('kind')=='nitro_fs' and _sha(rebuilt[lo:hi])!=record['identity']['program_sha256']:
            raise ValueError('research writes change whole child identity')
    result=canonical_rom.verify_repacked_rom(original,rebuilt,context.regions)
    _gate(context)
    if context.rom.read_bytes()!=original: raise ValueError('original ROM changed during research packing')
    with output_rom.open('xb') as stream: stream.write(rebuilt)
    _gate(context)
    if output_rom.is_symlink() or output_rom.stat().st_mtime_ns<start: raise ValueError('research output stale or symlink')
    canonical_rom.verify_repacked_rom(original,output_rom.read_bytes(),context.regions)
    return dict(result,writes=[row[-1] for row in pending],trial=_trial_summary(context),started_ns=start,finished_ns=time.time_ns())
