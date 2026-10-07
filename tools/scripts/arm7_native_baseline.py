"""Consume only a fresh pinned opaque ARM7 producer; grant no source credit."""
import hashlib
import json
import os
import re
import struct
import subprocess
from pathlib import Path

from other_executables import _nitrofs, _region


class _LiveOperation:
    __slots__ = ('__capture',)

    def __init__(self, record):
        object.__setattr__(self, '_LiveOperation__capture', json.dumps(record, sort_keys=True))

    def __setattr__(self, name, value):
        raise AttributeError('fresh ARM7 operation is immutable')

    @property
    def report(self):
        return json.loads(self.__capture)

    def recheck(self, record, build_dir, original, build_id, started_ns):
        captured = self.report
        if record != captured:
            raise ValueError('ARM7 audit report differs from actual live operation')
        return _recheck_baselines(captured, build_dir, original, build_id, started_ns)


def _sha(data):
    return hashlib.sha256(data).hexdigest()


def _read(path, within=None, started=None, allow_symlink=False):
    path = Path(path)
    if within is not None:
        base = Path(within).resolve()
        if not path.absolute().is_relative_to(base) or not path.resolve().is_relative_to(base):
            raise ValueError('ARM7 artifact path escapes fresh build')
        current = path.absolute()
        while current != base:
            if current.is_symlink():
                raise ValueError('ARM7 artifact path is symlinked')
            current = current.parent
    if (path.is_symlink() and not allow_symlink) or not path.is_file():
        raise ValueError(f'ARM7 file missing or symlinked: {path.name}')
    with path.open('rb') as stream:
        if started is not None and os.fstat(stream.fileno()).st_mtime_ns < started:
            raise ValueError(f'ARM7 artifact is stale: {path.name}')
        return stream.read()


def _relative(root, name):
    name = Path(name)
    if name.is_absolute() or '..' in name.parts or name == Path('.'):
        raise ValueError('ARM7 approved path must be repository relative')
    result = Path(root) / name
    _read(result, root)
    return result


def _pinned(path, digest, snapshot, allow_symlink=False):
    if not isinstance(digest, str) or not re.fullmatch('[0-9a-f]{64}', digest):
        raise ValueError('ARM7 pending or malformed SHA256 pin')
    data = _read(path, allow_symlink=allow_symlink)
    if _sha(data) != digest:
        raise ValueError(f'ARM7 input/tool hash differs: {Path(path).name}')
    snapshot[str(path)] = digest
    return data


def _programs(original, layouts):
    selectors = [row['identity']['program'] for row in layouts]
    if selectors != [{'kind': 'parent'}, {'kind': 'nitro_fs', 'path': 'ChildRom/JSS2Child.srl'}]:
        raise ValueError('ARM7 requires exact parent and child program set/order')
    files = _nitrofs(original)
    child = files.get('ChildRom/JSS2Child.srl')
    if child is None:
        raise ValueError('ARM7 exact child is absent from original NitroFS')
    result = []
    for i, row in enumerate(layouts):
        start, end = (0, len(original)) if i == 0 else child[1:]
        program = _region(original, start, end-start)
        identity = row['identity']
        if (_sha(original) != identity['parent_rom_sha256']
                or _sha(program) != identity['program_sha256']):
            raise ValueError('ARM7 original program identity differs')
        if row['target'] != {'cpu': 'arm7', 'isa': 'armv4t', 'processor': 'arm7tdmi'}:
            raise ValueError('ARM7 CPU/ISA identity differs')
        header = struct.unpack('<4I', _region(program, 0x30, 16))
        if header != tuple(row[k] for k in ('image_offset', 'entry', 'base', 'image_bytes')):
            raise ValueError('ARM7 original header layout differs')
        image = _region(program, row['image_offset'], row['image_bytes'])
        if _sha(image) != row['image_sha256']:
            raise ValueError('ARM7 original image differs')
        result.append((start + row['image_offset'], image, start, end))
    return result


def _segments(row):
    expected = {}
    for i, region in enumerate(row['regions']):
        name = 'startup' if i == 0 else f'autoload{i-1}'
        size = region['stored_extent']['end'] - region['stored_extent']['start']
        vma = region['runtime_base']
        expected[f'.arm7.{name}'] = (vma, row['base']+region['stored_extent']['start'], size, size, 4)
        if region['bss_bytes']:
            expected[f'.arm7.bss.{name}'] = (vma+size, vma+size, 0, region['bss_bytes'], 6)
    table = row['table_extent']
    address = row['base'] + table['start']
    size = table['end'] - table['start']
    expected['.arm7.table'] = (address, address, size, size, 4)
    return expected


def _receipt(record, original, layouts, native, build_dir):
    receipt = record['receipt']
    for key, expected in {'status': 'opaque_physical_baselines_verified',
            'parent_rom_sha256': _sha(original), 'layout_sidecar_sha256': record['layout_sha256'],
            'native_pins_sidecar_sha256': record['native_pins_sha256'],
            'producer_binary_sha256': record['producer_sha256'],
            'inputs_unchanged': True, 'source_bytes': 0, 't10_complete': False}.items():
        if receipt.get(key) != expected:
            raise ValueError(f'ARM7 producer receipt differs: {key}')
    if len(receipt['programs']) != len(layouts):
        raise ValueError('ARM7 producer program set differs')
    originals = _programs(original, layouts)
    payloads = []
    declared_files = set()
    for i, (program, row, location) in enumerate(zip(receipt['programs'], layouts, originals)):
        for key in ('identity', 'entry', 'image_offset', 'image_bytes', 'image_sha256',
                    'header_sha256', 'params_offset', 'params_sha256', 'table_extent', 'table_sha256', 'regions'):
            if program.get(key) != row[key]:
                raise ValueError(f'ARM7 producer program context differs: {key}')
        semantics = {'status': 'opaque_physical_baseline_verified', 'source_bytes': 0,
            'functions': 'unknown', 'executability': 'unknown', 'original_relocations': 'unknown',
            'arm7_source_complete': False, 't10_complete': False, 'bootable_elf': False,
            'generated_cpu_arch': 'ARMv4T', 'generated_elf_abi_flags': 0x05000200,
            'layout_sidecar_sha256': record['layout_sha256'],
            'native_pins_sidecar_sha256': record['native_pins_sha256']}
        if any(program.get(key) != value for key, value in semantics.items()):
            raise ValueError('ARM7 opaque receipt scope or sidecar differs')
        for name in ('clang', 'lld'):
            if program.get(name+'_sha256') != native[name]['sha256']:
                raise ValueError('ARM7 native tool receipt differs')
        segments = program['segments']
        expected = _segments(row)
        if len(segments) != len(expected) or {s['section'] for s in segments} != set(expected):
            raise ValueError('ARM7 physical segment inventory differs')
        for segment in segments:
            fields = ('vma', 'lma', 'file_bytes', 'memory_bytes', 'flags')
            if tuple(segment[k] for k in fields) != expected[segment['section']]:
                raise ValueError('ARM7 physical segment metadata differs')
            align = segment['alignment']
            if align < 1 or align & (align-1) or segment['vma'] % align != segment['file_offset'] % align:
                raise ValueError('ARM7 physical segment alignment differs')
        directory = Path(record['output'])/'artifacts'/f'program-{i}'
        artifacts = program['artifacts']
        names = [a['name'] for a in artifacts]
        if len(set(names)) != len(names) or not {'linked.elf','arm7.bin','physical.ld','physical.map'} <= set(names):
            raise ValueError('ARM7 required artifact inventory differs')
        buffers = {}
        for artifact in artifacts:
            name = Path(artifact['name'])
            if name.is_absolute() or '..' in name.parts or len(name.parts) != 1:
                raise ValueError('ARM7 artifact name escapes program directory')
            path = directory/name
            data = _read(path, build_dir, record['started_ns'])
            if len(data) != artifact['bytes'] or _sha(data) != artifact['sha256']:
                raise ValueError('ARM7 actual artifact digest differs')
            declared_files.add(str(path))
            buffers[str(name)] = data
        selected = program['selected_inputs']
        if not selected or any(a not in artifacts for a in selected):
            raise ValueError('ARM7 selected link input evidence differs')
        commands = program['commands']
        if not commands or any(c['return_code'] != 0 for c in commands):
            raise ValueError('ARM7 native operation missing or failed')
        link = commands[-1]
        argv = link['arguments']
        if (link['tool_sha256'] != native['lld']['sha256'] or not {'-o','-T','-Map'} <= set(argv)
                or argv[argv.index('-o')+1] != 'linked.elf' or argv[argv.index('-T')+1] != 'physical.ld'
                or argv[argv.index('-Map')+1] != 'physical.map'):
            raise ValueError('ARM7 actual native linker command differs')
        object_names = {a['name'] for a in selected if a['name'].endswith('.o')}
        if not object_names or {a for a in argv if a.endswith('.o')} != object_names:
            raise ValueError('ARM7 actual linked object inventory differs')
        if any(c['tool_sha256'] != native['clang']['sha256'] for c in commands[:-1]) or len(commands)<2:
            raise ValueError('ARM7 actual compiler command inventory differs')
        compiled = []
        for command in commands[:-1]:
            args = command['arguments']
            if not {'--target=arm-none-eabi','-mcpu=arm7tdmi','-c','-o'} <= set(args):
                raise ValueError('ARM7 actual compiler target differs')
            source, obj = args[args.index('-c')+1], args[args.index('-o')+1]
            if source not in names or obj not in object_names:
                raise ValueError('ARM7 compiler input/output inventory differs')
            compiled.append(obj)
        if len(compiled) != len(object_names) or set(compiled) != object_names:
            raise ValueError('ARM7 compiled object inventory differs')
        image = buffers['arm7.bin']
        if image != location[1] or _sha(image) != row['image_sha256']:
            raise ValueError('ARM7 consumed image bytes differ')
        payloads.append({'identity': row['identity'], 'rom_offset': location[0],
            'program_start': location[2], 'program_end': location[3], 'data': image,
            'image_path': str(directory/'arm7.bin'), 'elf_path': str(directory/'linked.elf'),
            'sha256': _sha(image), 'source_bytes': 0})
    actual_files = {str(p) for p in (Path(record['output'])/'artifacts').rglob('*') if p.is_file() or p.is_symlink()}
    if actual_files != declared_files:
        raise ValueError('ARM7 unrecorded or missing actual artifacts')
    return payloads


def build_baselines(rom, output, approval_path, producer, root, build_id, started_ns):
    root, output, producer = Path(root).resolve(), Path(output).absolute(), Path(producer).absolute()
    approval_path = Path(approval_path).absolute()
    approval_bytes = _read(approval_path, root)
    approval = json.loads(approval_bytes)
    if (approval.get('schema_version') != 1 or approval.get('status') != 'approved'
            or not all(re.fullmatch('[0-9a-f]{40}', approval.get(k,'')) for k in ('source_commit','source_tree'))
            or not approval.get('source_artifacts')):
        raise ValueError('ARM7 producer approval pending or incomplete')
    snapshot = {str(approval_path): _sha(approval_bytes)}
    producer_bytes = _pinned(producer, approval['producer']['sha256'], snapshot, allow_symlink=True)
    for name, pin in approval['source_artifacts'].items():
        _pinned(_relative(root, name), pin, snapshot)
    layout = _relative(root, approval['layout']['path'])
    pins = _relative(root, approval['native_pins']['path'])
    layout_bytes = _pinned(layout, approval['layout']['sha256'], snapshot)
    native_bytes = _pinned(pins, approval['native_pins']['sha256'], snapshot)
    native = json.loads(native_bytes)
    tool_paths = [str(producer)]
    for name in ('clang','lld'):
        path = Path(native[name]['executable'])
        if not path.is_absolute():
            raise ValueError('ARM7 native executable pin must be absolute')
        _pinned(path, native[name]['sha256'], snapshot, allow_symlink=True)
        tool_paths.append(str(path))
        if not native[name]['version']:
            raise ValueError('ARM7 native version pin missing')
    rom = Path(rom).absolute()
    original = _read(rom)
    snapshot[str(rom)] = _sha(original)
    _programs(original, json.loads(layout_bytes))
    if output.exists() or output.is_symlink():
        raise ValueError('ARM7 requires a fresh producer output')
    output.mkdir()
    command = [str(producer), str(rom), str(layout), _sha(layout_bytes), str(pins), _sha(native_bytes), str(output/'artifacts')]
    process = subprocess.run(command, cwd=root, capture_output=True, text=True)
    execution = {'command': command, 'cwd': str(root), 'stdout': process.stdout,
                 'stderr': process.stderr, 'exit_status': process.returncode}
    (output/'execution.json').write_text(json.dumps(execution, indent=2)+'\n')
    if process.returncode:
        raise ValueError(f'ARM7 producer exited {process.returncode}: {process.stderr}')
    receipt = json.loads(process.stdout)
    (output/'receipt.json').write_text(json.dumps(receipt, indent=2)+'\n')
    record = {'status': 'passed', 'build_id': build_id, 'started_ns': started_ns,
        'output': str(output), 'snapshot': snapshot, 'receipt': receipt, 'execution': execution,
        'layout_path': str(layout), 'native_pins_path': str(pins),
        'layout_sha256': _sha(layout_bytes), 'native_pins_sha256': _sha(native_bytes),
        'producer_sha256': _sha(producer_bytes), 'approval_path': str(approval_path),
        'approval': approval, 'tool_paths': tool_paths, 'root': str(root)}
    _recheck_baselines(record, output.parent, original, build_id, started_ns)
    return _LiveOperation(record)


def recheck_baselines(record, build_dir, original, build_id, started_ns, operation=None):
    if operation is None:
        raise ValueError('ARM7 needs live fresh producer operation; rerun canonical verifier')
    return operation.recheck(record, build_dir, original, build_id, started_ns)


def _recheck_baselines(record, build_dir, original, build_id, started_ns):
    if (record.get('status') != 'passed' or record['build_id'] != build_id or record['started_ns'] != started_ns
            or record['execution']['exit_status'] != 0):
        raise ValueError('ARM7 current build/execution provenance differs')
    if _sha(original) != record['receipt']['parent_rom_sha256']:
        raise ValueError('ARM7 original program identity differs from actual producer input')
    for name, pin in record['snapshot'].items():
        if _sha(_read(name, allow_symlink=name in record['tool_paths'])) != pin:
            raise ValueError('ARM7 live input/tool changed')
    output = Path(record['output'])
    if output != Path(build_dir)/'arm7-native':
        raise ValueError('ARM7 current output path differs')
    receipt = json.loads(_read(output/'receipt.json', build_dir, started_ns))
    execution = json.loads(_read(output/'execution.json', build_dir, started_ns))
    if receipt != record['receipt'] or execution != record['execution']:
        raise ValueError('ARM7 captured execution/receipt changed')
    if json.loads(execution['stdout']) != receipt:
        raise ValueError('ARM7 receipt differs from actual producer stdout')
    if json.loads(_read(record['approval_path'], record['root'])) != record['approval']:
        raise ValueError('ARM7 approved source context changed')
    command = execution['command']
    expected = [record['tool_paths'][0], command[1], record['layout_path'], record['layout_sha256'],
                record['native_pins_path'], record['native_pins_sha256'], str(output/'artifacts')]
    if (command != expected or command[1] not in record['snapshot']
            or record['snapshot'][command[1]] != _sha(original) or execution['cwd'] != record['root']):
        raise ValueError('ARM7 actual producer command/cwd differs')
    layouts = json.loads(_read(record['layout_path']))
    native = json.loads(_read(record['native_pins_path']))
    approval = json.loads(_read(record['approval_path'], record['root']))
    expected_pins = {record['approval_path']: _sha(_read(record['approval_path'])),
        command[0]: approval['producer']['sha256'], command[1]: layouts[0]['identity']['parent_rom_sha256']}
    for name, digest in approval['source_artifacts'].items():
        expected_pins[str(_relative(record['root'], name))] = digest
    for name in ('layout','native_pins'):
        path = _relative(record['root'], approval[name]['path'])
        expected_pins[str(path)] = approval[name]['sha256']
        if str(path) != record[name+'_path']:
            raise ValueError('ARM7 approved sidecar path differs')
    for name in ('clang','lld'):
        expected_pins[str(Path(native[name]['executable']).absolute())] = native[name]['sha256']
    if record['snapshot'] != expected_pins:
        raise ValueError('ARM7 input inventory differs from actual approved pins')
    return _receipt(record, original, layouts, native, build_dir)
