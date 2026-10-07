"""Fresh child ARM9 reference link and exact encoding, with zero source credit."""
import json
import re
import shutil
import struct
import subprocess
import sys
from pathlib import Path

from arm7_native_baseline import _read, _relative, _pinned, _sha
from other_executables import verify_other_executables, verify_extracted_arm9_modules, _nitrofs
from native_link import Elf32
from relocation_check import validate_relocations
from child_rom_roundtrip import repack_child_arm9
from verify import verify_link_record

_ANALYZER = '3f18db59e173ca17e14d29755ac51ce36682896d4df5ca500abcd619f4fd52c1'
_CHILD = 'ChildRom/JSS2Child.srl'
_MODULES = (('ARM9', 'main', 'arm9.bin', 0x02000000, 2624320, 105760),
            ('ITCM', 'ITCM', 'itcm.bin', 0x01ff8000, 3968, 0),
            ('DTCM', 'DTCM', 'dtcm.bin', 0x027c0000, 96, 32))
_SEAL = object()


class _LiveOperation:
    __slots__ = ('__capture',)

    def __init__(self, record, seal):
        if seal is not _SEAL:
            raise TypeError('child operation requires fresh execution')
        object.__setattr__(self, '_LiveOperation__capture', json.dumps(record, sort_keys=True))

    def __setattr__(self, name, value):
        raise AttributeError('fresh child operation is immutable')

    def __reduce__(self):
        raise TypeError('child operation cannot be serialized')

    @property
    def report(self):
        return json.loads(self.__capture)

    def recheck(self, record, build_dir, original, build_id, started_ns):
        captured = self.report
        if record != captured:
            raise ValueError('child audit report differs from live operation')
        if (captured['build_id'] != build_id or captured['started_ns'] != started_ns
                or Path(captured['output']) != Path(build_dir)/'child-arm9'):
            raise ValueError('child current build provenance differs')
        return _recheck(captured, original)


def recheck_child(record, build_dir, original, build_id, started_ns, operation=None):
    if type(operation) is not _LiveOperation:
        raise ValueError('child needs live fresh operation; rerun canonical verifier')
    return operation.recheck(record, build_dir, original, build_id, started_ns)


def _approval(root, path, binary, role, snapshot):
    raw = _read(path, root)
    approval = json.loads(raw)
    if (approval.get('schema_version') != 1 or approval.get('status') != 'approved'
            or not approval.get('source_artifacts')
            or not all(re.fullmatch('[0-9a-f]{40}', approval.get(k, ''))
                       for k in ('source_commit', 'source_tree'))):
        raise ValueError(f'child {role} approval pending or incomplete')
    snapshot[str(path)] = _sha(raw)
    for name, digest in approval['source_artifacts'].items():
        _pinned(_relative(root, name), digest, snapshot)
    if role == 'analyzer':
        verification = root/'decomp/matching-notes/other-cpus/arm7-physical-baseline/verification.json'
        if str(verification) not in snapshot:
            raise ValueError('analyzer source capsule lacks actual binary evidence')
        digest = approval['analyzer']['sha256']
        if json.loads(_read(verification))['native']['cli_sha256'] != digest:
            raise ValueError('analyzer role approval differs from source capsule')
        if digest != _ANALYZER:
            raise ValueError('child analyzer approval differs from reviewed CLI')
    else:
        digest = approval['encoder']['sha256']
    _pinned(binary, digest, snapshot, allow_symlink=True)
    return digest


def _program(original, inventory):
    ledger = verify_other_executables(original, inventory)
    rows = [r for r in ledger['executables'] if r['identity']['program'] == _CHILD and r['cpu'] == 'arm9']
    if len(rows) != 1 or _nitrofs(original).get(_CHILD) != (79, 0x23b800, 0x4464c8):
        raise ValueError('child exact program/CPU/FAT identity differs')
    row = rows[0]
    if (row['rom_offset_in_program'], row['stored_bytes'], row['entry']) != (0x4000, 1955956, 0x02000850):
        raise ValueError('child original header extent differs')
    return row, original[0x23b800:0x4464c8]


def _inventory(output, started):
    files = {}
    for path in sorted(output.rglob('*')):
        if path.is_symlink():
            raise ValueError('child artifact is symlinked')
        if path.is_file():
            files[str(path.relative_to(output))] = _sha(_read(path, output, started))
    return files


def _native_proof(output, row, tools, reference):
    link = verify_link_record(output, tools)
    native = output/'native-link'
    link_map = native/'link.map'
    command = link['command']
    if (link.get('link_map') != {'path': str(link_map), 'sha256': _sha(_read(link_map))}
            or command[command.index('-Map') + 1] != str(link_map)):
        raise ValueError('child actual link map differs')
    expected = {name: digest for name, digest in reference['artifact_hashes'].items()
                if name.startswith('delinks/') and name.endswith('.o')}
    actual = {str(p.relative_to(output)): _sha(_read(p)) for p in (output/'delinks').glob('*.o')}
    if len(expected) != 3 or actual != expected:
        raise ValueError('child original gap object inventory/digest differs')
    elf = Elf32(_read(native/'linked.elf'))
    if struct.unpack_from('<I', elf.data, 24)[0] != 0x02000000:
        raise ValueError('child canonical ELF entry differs')
    sections = {elf.section_name(s): s for s in elf.sections}
    symbols = {elf.symbol_name(s): s[1] for s in elf.symbols()}
    metadata = json.loads(_read(native/'modules.json'))
    if [m['region'] for m in metadata] != ['ARM9', 'ITCM', 'DTCM']:
        raise ValueError('child native module inventory differs')
    modules = {}
    for (name, module, filename, base, size, bss), emitted in zip(_MODULES, metadata):
        data = _read(native/filename)
        section = sections['.'+name.lower()]
        if (len(data) != size or section[1] != 1 or section[3] != base or section[5] != size+bss
                or symbols[name+'_BSS_START'] != base+size or symbols[name+'_BSS_END'] != base+size+bss
                or elf.content(section)[:size] != data
                or emitted['address'] != base or emitted['size_bytes'] != size
                or emitted['sha256'] != _sha(data)):
            raise ValueError('child initialized image/BSS/ELF geometry differs')
        if _read(output/'linked/build'/filename) != data:
            raise ValueError('child DSD checked image differs from linked image')
        modules[module] = data
    compared = verify_extracted_arm9_modules(row, modules)
    relocations = validate_relocations(sorted((output/'delinks').glob('*.o')), native/'linked.elf')
    expected_counts = {'total':35092,'validated':35092,'failed':0,'unresolved':0}
    if (relocations['status'] != 'passed' or relocations['counts'] != expected_counts
            or relocations['relocation_types'] != {'1':10755,'2':20440,'10':3897}
            or relocations['source_mode_fallbacks']['count'] != 0
            or {k: v['total'] for k,v in relocations['modules'].items()} != {'ARM9':34992,'ITCM':78,'DTCM':22}):
        raise ValueError('child original relocation proof differs')
    return {'link_inputs': link, 'modules': compared, 'relocations': relocations}


def _recheck(record, original):
    output = Path(record['output'])
    for name, digest in record['snapshot'].items():
        if _sha(_read(name, allow_symlink=name in record['tool_paths'])) != digest:
            raise ValueError('child input/tool/source changed')
    artifacts = _inventory(output, record['started_ns'])
    if artifacts != record['artifact_hashes']:
        raise ValueError('child artifacts changed, missing or unrecorded')
    row, child = _program(original, json.loads(_read(record['inventory_path'])))
    if row != record['executable'] or _read(output/'original.srl') != child:
        raise ValueError('child current original identity differs')
    reference = json.loads(_read(record['reference_path']))
    proof = _native_proof(output, row, record['tools'], reference)
    if proof != record['native']:
        raise ValueError('child actual native proof changed')
    for index, execution in enumerate(record['commands']):
        if (execution['exit_status'] != 0 or execution['cwd'] != str(output)
                or json.loads(_read(output/f'command-{index}.json')) != execution):
            raise ValueError('child actual command evidence differs')
    rebuilt = _read(output/'rebuilt.srl', output, record['started_ns'])
    codec = record['codec']
    if (codec['status'] != 'binary_roundtrip_verified' or len(rebuilt) != codec['output']['bytes']
            or _sha(rebuilt) != codec['output']['sha256'] or rebuilt != child):
        raise ValueError('child encoded whole output differs')
    start = row['rom_offset_in_program']
    data = rebuilt[start:start+row['stored_bytes']]
    if len(data) != 1955956 or _sha(data) != row['stored_sha256']:
        raise ValueError('child encoded slice differs')
    return {'identity': {'parent_rom_sha256':row['identity']['rom_sha256'],
                        'program':{'kind':'nitro_fs','path':_CHILD},
                        'program_sha256':row['identity']['program_sha256'], 'cpu':'arm9',
                        'processor':row['processor'], 'isa':row['isa']},
            'rom_offset':0x23f800, 'program_start':0x23b800, 'program_end':0x4464c8,
            'data':data, 'image_path':str(output/'rebuilt.srl'), 'image_sha256':_sha(child),
            'image_slice_offset':start, 'elf_path':str(output/'native-link/linked.elf'),
            'elf_sha256':artifacts['native-link/linked.elf'], 'sha256':row['stored_sha256'], 'source_bytes':0}


def build_child(*, original, output, root, build_id, started_ns, native_tools,
                analyzer, analyzer_approval, encoder, codec_approval):
    root = Path(root).resolve()
    original, output, analyzer, encoder = [Path(p).absolute() for p in (original,output,analyzer,encoder)]
    if output.exists() or output.is_symlink() or output.name != 'child-arm9':
        raise ValueError('child requires fresh child-arm9 output directory')
    snapshot = {}
    analyzer_hash = _approval(root, Path(analyzer_approval).absolute(), analyzer, 'analyzer', snapshot)
    encoder_hash = _approval(root, Path(codec_approval).absolute(), encoder, 'codec', snapshot)
    lock = json.loads(_read(root/'decomp/toolchain.lock.json'))
    tools = {}
    for name, pin in (('lld','native_linker'), ('clang','native_attributes_compiler')):
        tool = native_tools[name]
        path = Path(tool['command'][0])
        _pinned(path, lock[pin]['sha256'], snapshot, allow_symlink=True)
        if tool['sha256'] != lock[pin]['sha256']:
            raise ValueError('child native tool role differs from canonical pin')
        tools[name] = tool
    inventory_path = root/'decomp/matching-notes/baseline-t01/executable-regions.json'
    reference_path = root/'decomp/matching-notes/other-cpus/child-arm9-native-baseline.json'
    sources = [inventory_path,reference_path,root/'decomp/toolchain.lock.json',original]
    sources += [root/'tools/scripts'/name for name in (
        'child_native_baseline.py','arm7_native_baseline.py','other_executables.py',
        'child_rom_roundtrip.py','native_link.py','relocation_check.py','verify.py',
        'rom_roundtrip.py','baseline_intake.py','source_build.py','source_accounting.py','header_dependencies.py')]
    for path in sources:
        snapshot[str(path)] = _sha(_read(path))
    python = Path(sys.executable).absolute()
    snapshot[str(python)] = _sha(_read(python, allow_symlink=True))
    row, child = _program(_read(original), json.loads(_read(inventory_path)))
    output.mkdir()
    (output/'original.srl').write_bytes(child)
    commands = []
    def run(argv):
        args = list(map(str,argv))
        result = subprocess.run(args,cwd=output,capture_output=True,text=True)
        record = {'command':args,'cwd':str(output),'exit_status':result.returncode,
                  'stdout':result.stdout,'stderr':result.stderr}
        (output/f'command-{len(commands)}.json').write_text(json.dumps(record,indent=2)+'\n')
        commands.append(record)
        if result.returncode:
            raise ValueError(f'child command failed: {args}: {result.stderr}')
    run([analyzer,'rom','extract','-r',output/'original.srl','-o',output/'extract'])
    run([analyzer,'init','--rom-config',output/'extract/config.yaml',
         '--output-path',output/'config','--build-path',output/'linked'])
    config = output/'config/arm9/config.yaml'
    before = _read(config)
    old, new = b'delinks_path: ../../linked/delinks', b'delinks_path: ../../delinks'
    if before.count(old) != 1:
        raise ValueError('child generated delinks_path field differs')
    (output/'config-before.yaml').write_bytes(before)
    config.write_bytes(before.replace(old,new))
    run([analyzer,'delink','-c',config])
    run([analyzer,'lcf','-c',config])
    run([python,root/'tools/scripts/native_link.py','--lcf',output/'linked/arm9.lcf',
         '--objects',output/'delinks','--output',output/'native-link',
         '--lld',tools['lld']['command'][0],'--clang',tools['clang']['command'][0]])
    (output/'linked/build').mkdir(parents=True,exist_ok=True)
    for _,_,filename,_,_,_ in _MODULES:
        shutil.copyfile(output/'native-link'/filename,output/'linked/build'/filename)
    run([analyzer,'check','modules','-c',config,'--fail'])
    run([analyzer,'check','symbols','-c',config,'-e',output/'native-link/dsd-check.elf','--fail'])
    artifacts = _inventory(output, started_ns)
    native = _native_proof(output,row,tools,json.loads(_read(reference_path)))
    codec = repack_child_arm9(output/'original.srl',row,
        {module:output/'native-link'/filename for _,module,filename,_,_,_ in _MODULES},
        encoder,encoder_hash,output/'rebuilt.srl')
    rebuilt = _read(output/'rebuilt.srl',output,started_ns)
    if rebuilt != child or _sha(rebuilt) != codec['output']['sha256'] or len(rebuilt) != codec['output']['bytes']:
        raise ValueError('child validated encoded output changed before capture')
    artifacts['rebuilt.srl'] = row['identity']['program_sha256']
    record = {'status':'passed','build_id':build_id,'started_ns':started_ns,'output':str(output),
              'snapshot':snapshot,'artifact_hashes':artifacts,'commands':commands,'tools':tools,
              'tool_paths':[str(analyzer),str(encoder),str(python),tools['lld']['command'][0],tools['clang']['command'][0]],
              'inventory_path':str(inventory_path),'reference_path':str(reference_path),
              'analyzer_sha256':analyzer_hash,'executable':row,'native':native,'codec':codec,
              'source_bytes':0,'source_functions':0,'global_percent':None,'t10_complete':False}
    _recheck(record,_read(original))
    return _LiveOperation(record,_SEAL)
