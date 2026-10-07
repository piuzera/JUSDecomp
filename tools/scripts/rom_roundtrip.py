"""Repack verified ARM9 modules into the original, unmodified NDS layout."""
import argparse
import hashlib
import json
import struct
import sys
import time
from pathlib import Path

from baseline_intake import region
from source_accounting import verify_source_ownership
from source_build import compare_objects
import verify as build_verifier
from verify import direct_comparison, expected_modules, verify_link_record


def _hashes(data):
    return {'sha1': hashlib.sha1(data).hexdigest(), 'sha256': hashlib.sha256(data).hexdigest()}


def _hash(path):
    return _hashes(Path(path).read_bytes())['sha256']


def _number(value):
    return int(value, 0) if isinstance(value, str) else value


def _u32(data, offset):
    return struct.unpack('<I', region(data, offset, 4))[0]


def _targets(regions):
    arm9 = regions['regions']['arm9']
    main = dict(arm9['main'], rom_offset=arm9['main'].get('rom_offset', arm9['rom_offset']))
    targets = [dict(main, module='ARM9', filename='arm9.bin')]
    autos = arm9['autoloads']
    if [item['kind'] for item in autos] != ['ITCM', 'DTCM']:
        raise ValueError('ARM9 inventory must contain ITCM and DTCM autoloads')
    targets += [dict(item, module=item['kind'], filename=item['kind'].lower() + '.bin') for item in autos]
    overlays = regions['regions']['arm9_overlays']
    if [item['id'] for item in overlays] != list(range(14)):
        raise ValueError('ARM9 inventory must contain all 14 overlays including stubs')
    targets += [dict(item, module=f'OV{item["id"]:03}', filename=f'arm9_ov{item["id"]:03}.bin') for item in overlays]
    for target in targets:
        target['rom_offset'] = _number(target['rom_offset'])
    return targets


def _identity(original, regions):
    expected = regions['rom']
    if len(original) != expected['bytes'] or _hashes(original) != {k: expected['hashes'][k] for k in ('sha1', 'sha256')}:
        raise ValueError('original ROM identity differs from pinned executable inventory')


def _layout(original, regions):
    """Validate all payload positions against original NDS tables, not filenames."""
    _identity(original, regions)
    targets = _targets(regions)
    header_size = _u32(original, 0x84)
    if header_size < 0x160:
        raise ValueError('invalid original ROM header extent')
    region(original, 0, header_size)
    arm9_offset, _, arm9_base, arm9_size = struct.unpack('<4I', region(original, 0x20, 16))
    params = _number(regions['regions']['arm9']['module_params']['offset'])
    record = struct.unpack('<9I', region(original, arm9_offset + params, 36))
    list_start, list_end, payload_start, _, _, compressed_end, _, magic1, magic2 = record
    if (magic1, magic2) != (0xdec00621, 0x2106c0de):
        raise ValueError('ARM9 autoload module-parameter signature differs')
    if compressed_end:
        raise ValueError('unsupported parent ARM9 compression encoding; matching encoder required')
    if targets[0]['rom_offset'] != arm9_offset or targets[0]['bytes'] != payload_start - arm9_base:
        raise ValueError('ARM9 main layout differs from header/module parameters')
    table_offset = arm9_offset + list_start - arm9_base
    table_size = list_end - list_start
    if table_size != 24 or table_offset + table_size != arm9_offset + arm9_size:
        raise ValueError('unsupported ARM9 autoload table/footer layout')
    cursor = arm9_offset + targets[0]['bytes']
    for index, auto in enumerate(targets[1:3]):
        base, size, bss = struct.unpack('<3I', region(original, table_offset + index * 12, 12))
        if (auto['rom_offset'], _number(auto['base']), auto['bytes'], auto['bss_bytes']) != (cursor, base, size, bss):
            raise ValueError('ARM9 autoload payload layout differs from original table')
        cursor += size
    if cursor != table_offset:
        raise ValueError('ARM9 executable coverage has a gap before its autoload table')
    fat_offset, fat_size = struct.unpack('<2I', region(original, 0x48, 8))
    if fat_size % 8:
        raise ValueError('invalid filesystem FAT ordering metadata')
    files = list(struct.iter_unpack('<2I', region(original, fat_offset, fat_size)))
    overlay_offset, overlay_size = struct.unpack('<2I', region(original, 0x50, 8))
    if overlay_size != 14 * 32:
        raise ValueError('original ARM9 overlay table must contain 14 entries')
    for index, target in enumerate(targets[3:]):
        ident, base, size, bss, _, _, file_id, flags = struct.unpack('<8I', region(original, overlay_offset + index * 32, 32))
        if flags & 0x01000000 or target.get('compressed'):
            raise ValueError('unsupported parent overlay compression encoding; matching encoder required')
        if file_id >= len(files):
            raise ValueError('overlay table references missing FAT file')
        start, end = files[file_id]
        if (ident, base, size, bss, file_id, flags, start, end - start) != (
                target['id'], _number(target['base']), target['bytes'], target['bss_bytes'],
                target['file_id'], _number(target['flags']), target['rom_offset'], target['bytes']):
            raise ValueError('ARM9 overlay table/FAT layout differs from pinned inventory')
    previous_end = header_size
    for target in sorted(targets, key=lambda item: item['rom_offset']):
        if target['rom_offset'] < previous_end or target['bytes'] <= 0:
            raise ValueError('overlapping or empty ARM9 executable extent')
        payload = region(original, target['rom_offset'], target['bytes'])
        if _hashes(payload)['sha256'] != target['hashes']['sha256']:
            raise ValueError('original ARM9 executable differs from inventory')
        previous_end = target['rom_offset'] + target['bytes']
    return targets, {'header_size': header_size, 'params_offset': arm9_offset + params,
                     'autoload_table_offset': table_offset, 'autoload_table_size': table_size,
                     'files': files}


def rebuild_rom(original, module_dir, regions):
    """Read every linked module and write every declared ARM9 payload extent."""
    targets, _ = _layout(original, regions)
    rebuilt = bytearray(original)
    writes = []
    for target in targets:
        path = Path(module_dir) / target['filename']
        if not path.is_file() or path.is_symlink():
            raise ValueError(f'missing actual linked module {target["module"]}')
        payload = path.read_bytes()
        digest = _hashes(payload)['sha256']
        if len(payload) != target['bytes'] or digest != target['hashes']['sha256']:
            raise ValueError(f'linked ARM9 executable {target["module"]} size/hash differs')
        start = target['rom_offset']
        rebuilt[start:start + len(payload)] = payload
        writes.append({'module': target['module'], 'input_file': target['filename'],
                       'rom_offset': start, 'size_bytes': len(payload), 'sha256': digest})
    return bytes(rebuilt), writes


def verify_repacked_rom(original, rebuilt, regions):
    """Reject independent layout, encoding, executable and preserved-byte changes."""
    targets, layout = _layout(original, regions)
    if len(rebuilt) != len(original):
        raise ValueError('raw ROM size/padding differs')
    params = layout['params_offset']
    if region(original, params + 20, 4) != region(rebuilt, params + 20, 4):
        raise ValueError('ARM9 compression encoding differs')
    ov_offset, ov_size = struct.unpack('<2I', region(original, 0x50, 8))
    for offset in range(ov_offset + 28, ov_offset + ov_size, 32):
        if region(original, offset, 4) != region(rebuilt, offset, 4):
            raise ValueError('overlay compression encoding/flags differ')
    if region(original, 0, layout['header_size']) != region(rebuilt, 0, layout['header_size']):
        raise ValueError('ROM header differs')
    checks = [{'name': 'header', 'status': 'passed', 'sha256': _hashes(original[:layout['header_size']])['sha256']}]
    for cpu, field in (('ARM9', 0x50), ('ARM7', 0x58)):
        offset, size = struct.unpack('<2I', region(original, field, 8))
        if region(original, offset, size) != region(rebuilt, offset, size):
            raise ValueError(f'{cpu} overlay table differs')
        checks.append({'name': cpu.lower() + '_overlay_table', 'status': 'passed',
                       'offset': offset, 'size_bytes': size, 'sha256': _hashes(region(original, offset, size))['sha256']})
    for name, field in (('FNT', 0x40), ('FAT', 0x48)):
        offset, size = struct.unpack('<2I', region(original, field, 8))
        if region(original, offset, size) != region(rebuilt, offset, size):
            raise ValueError(f'NitroFS filesystem ordering/{name} differs')
        checks.append({'name': name.lower(), 'status': 'passed', 'offset': offset,
                       'size_bytes': size, 'sha256': _hashes(region(original, offset, size))['sha256']})
    for target in targets:
        offset, size = target['rom_offset'], target['bytes']
        if region(original, offset, size) != region(rebuilt, offset, size):
            raise ValueError(f'ARM9 executable {target["module"]} differs')
    offset, size = layout['autoload_table_offset'], layout['autoload_table_size']
    if region(original, offset, size) != region(rebuilt, offset, size):
        raise ValueError('ARM9 original autoload table/footer differs')
    arm7_offset, _, _, arm7_size = struct.unpack('<4I', region(original, 0x30, 16))
    if region(original, arm7_offset, arm7_size) != region(rebuilt, arm7_offset, arm7_size):
        raise ValueError('preserved ARM7 bytes differ')
    overlay_file_ids = {target['file_id'] for target in targets[3:]}
    assets = [(start, end) for file_id, (start, end) in enumerate(layout['files']) if file_id not in overlay_file_ids]
    for start, end in assets:
        if region(original, start, end - start) != region(rebuilt, start, end - start):
            raise ValueError('preserved raw NitroFS asset/embedded executable bytes differ')
    if original != rebuilt:
        raise ValueError('preserved padding/footer/other ROM bytes differ')
    checks.extend({'name': name, 'status': 'passed'} for name in
                  ('compression_encoding', 'arm9_payloads', 'autoload_table', 'arm7', 'raw_assets', 'padding', 'whole_rom_hash'))
    return {'status': 'passed', 'rom': dict(_hashes(rebuilt), size_bytes=len(rebuilt)),
            'checks': checks, 'arm9_modules_checked': len(targets), 'preserved_source_bytes': 0,
            'preserved_arm7': {'size_bytes': arm7_size, 'sha256': _hashes(region(original, arm7_offset, arm7_size))['sha256'], 'source_bytes': 0},
            'preserved_raw_assets': {'file_count': len(assets), 'size_bytes': sum(end - start for start, end in assets), 'source_bytes': 0},
            'smoke_checks': 'queued for T07; not performed'}


def _verify_build(original_rom, original, build_dir, regions, report):
    if report.get('status') != 'passed' or not report.get('artifact_hashes'):
        raise ValueError('passed verification with actual build artifact hashes is required')
    source = report.get('source_build')
    source_stages = any(stage['name'] in ('source_build', 'source_ownership') for stage in report['stages'])
    if source_stages and (not source or source.get('status') != 'passed' or not source.get('accepted_units')):
        raise ValueError('passed nonempty source build is required')
    if bool(source) != source_stages:
        raise ValueError('source build report/stage provenance differs')
    if hasattr(build_verifier, 'verified_module_checkpoint'):
        build_verifier.verified_module_checkpoint(report, source_enabled=source_stages)
    else:
        build_verifier.require_stages(report['stages'], source_enabled=source_stages)
    started = report['started_ns']
    if not isinstance(started, int) or started <= 0:
        raise ValueError('actual producer build start is required for freshness')
    for name, expected_hash in report['artifact_hashes'].items():
        path = build_dir / name
        if Path(name).is_absolute() or not path.resolve().is_relative_to(build_dir) or path.is_symlink():
            raise ValueError('actual build artifact path escapes build directory')
        if not path.is_file() or path.stat().st_mtime_ns < started or _hash(path) != expected_hash:
            raise ValueError(f'actual build artifact missing/stale/changed: {name}')
    if report['rom']['sha256'] != _hashes(original)['sha256'] or report['rom']['size_bytes'] != len(original):
        raise ValueError('actual build ROM provenance differs from original template')
    link = verify_link_record(build_dir, report['tools'], source)
    if link != report['link_inputs']:
        raise ValueError('actual link input provenance differs from passed build report')
    expected = expected_modules(regions)
    current = direct_comparison(original_rom, build_dir, expected)
    recorded = next(stage['result'] for stage in report['stages'] if stage['name'] == 'direct_comparison')
    if current != recorded:
        raise ValueError('actual linked module/ELF layout differs from passed build report')
    required = {'native-link/linked.elf', 'native-link/modules.json', 'native-link/link-inputs.json', 'native-link/native.ld'}
    required.update('native-link/' + module['filename'] for module in expected)
    required.update(str(Path(item['path']).relative_to(build_dir)) for item in link['inputs'])
    if not required <= report['artifact_hashes'].keys():
        raise ValueError('actual linked module/input artifacts are absent from freshness provenance')
    if source:
        if not source.get('input_hashes') or not source.get('units'):
            raise ValueError('actual source input hashes/units are required')
        for name, expected_hash in source['input_hashes'].items():
            if _hash(Path(name)) != expected_hash:
                raise ValueError('actual source/compiler/reference input changed after verification')
        for unit in source['units']:
            for field in ('compiled', 'reference'):
                path = Path(unit[field]['path'])
                if not path.resolve().is_relative_to(build_dir) or path.is_symlink() or _hash(path) != unit[field]['sha256']:
                    raise ValueError('actual source/reference artifact provenance differs')
            if compare_objects(Path(unit['reference']['path']), Path(unit['compiled']['path']), unit['functions']) != unit['checks']:
                raise ValueError('actual source object checks differ from passed report')
        ownership = verify_source_ownership(source, link, (build_dir / 'linked/arm9.lcf').read_text(),
                                            build_dir / 'native-link/link.map', build_dir / 'native-link/linked.elf',
                                            build_dir / 'candidate-config')
        if ownership != report['source_ownership']:
            raise ValueError('actual source ownership differs from passed build report')
    return {'producer_build_id': report['build_id'], 'source_enabled': source_stages,
            'linked_elf_sha256': _hash(build_dir / 'native-link/linked.elf'),
            'link_inputs_sha256': _hash(build_dir / 'native-link/link-inputs.json'),
            'artifact_count': len(report['artifact_hashes'])}


def roundtrip_rom(original_rom, build_dir, regions, verified_build, output_rom):
    """Recheck passed build artifacts, pack all ARM9 modules, reread exact ROM."""
    build_dir = Path(build_dir).resolve()
    output_rom = Path(output_rom)
    original_rom = Path(original_rom)
    if output_rom.exists() or output_rom.resolve() == original_rom.resolve():
        raise ValueError('output ROM must be a new file distinct from the private original')
    started = time.time_ns()
    original = original_rom.read_bytes()
    _identity(original, regions)
    provenance = _verify_build(original_rom, original, build_dir, regions, verified_build)
    rebuilt, writes = rebuild_rom(original, build_dir / 'native-link', regions)
    result = verify_repacked_rom(original, rebuilt, regions)
    # Check current artifacts again before publishing the private output file.
    _verify_build(original_rom, original, build_dir, regions, verified_build)
    if original_rom.read_bytes() != original:
        raise ValueError('private original ROM changed during repacking')
    output_rom.parent.mkdir(parents=True, exist_ok=True)
    with output_rom.open('xb') as stream:
        stream.write(rebuilt)
    if output_rom.stat().st_mtime_ns < started:
        raise ValueError('repacked ROM output is stale')
    verify_repacked_rom(original, output_rom.read_bytes(), regions)
    return dict(result, provenance=provenance, writes=writes,
                repacker_source_sha256=_hash(Path(__file__)),
                started_ns=started, finished_ns=time.time_ns())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('rom', 'build-dir', 'regions', 'build-report', 'output', 'report'):
        parser.add_argument('--' + name, type=Path, required=True)
    args = parser.parse_args()
    try:
        result = roundtrip_rom(args.rom, args.build_dir, json.loads(args.regions.read_text()),
                               json.loads(args.build_report.read_text()), args.output)
    except (OSError, ValueError, KeyError, struct.error) as error:
        result = {'status': 'failed', 'failure': str(error)}
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({'status': result['status'], 'report': str(args.report)}))
    return 0 if result['status'] == 'passed' else 1


if __name__ == '__main__':
    sys.exit(main())
