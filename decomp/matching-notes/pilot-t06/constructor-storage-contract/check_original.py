#!/usr/bin/env python3
"""Fresh original-ROM readback for this bounded constructor contract."""
if not __debug__:
    raise SystemExit('Optimized Python disables verification assertions; run without -O or -OO.')

import argparse
import hashlib
import json
import struct
import subprocess
import sys
from pathlib import Path

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[4]
CAPSULE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'tools/scripts'))
from native_link import Elf32
from verify import expected_modules, prepare_config


def sha(data):
    return hashlib.sha256(data).hexdigest()


def number(value):
    return int(value, 16)


def branch_target(data, address, kind):
    if kind == 1:
        word, = struct.unpack('<I', data)
        assert word >> 24 == 0xeb, 'expected ARM BL'
        displacement = word & 0xffffff
        if displacement & 0x800000:
            displacement -= 0x1000000
        return address + 8 + (displacement << 2)
    assert kind == 10
    high, low = struct.unpack('<HH', data)
    assert high & 0xf800 == 0xf000 and low & 0xf800 == 0xe800, 'expected Thumb BLX'
    displacement = high & 0x7ff
    if displacement & 0x400:
        displacement -= 0x800
    return (address + 4 + (displacement << 12) + ((low & 0x7ff) << 1)) & ~3


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rom', required=True, type=Path)
    parser.add_argument('--dsd', required=True, type=Path)
    parser.add_argument('--output', required=True, type=Path)
    args = parser.parse_args()
    record = json.loads((CAPSULE / 'contract.json').read_text())
    for relative, digest in record['source_pins'].items():
        assert sha((ROOT / relative).read_bytes()) == digest, f'changed source input: {relative}'
    assert sha(args.dsd.read_bytes()) == record['tools']['dsd']['sha256']
    version = subprocess.run([str(args.dsd.resolve()), '--version'], check=True, capture_output=True, text=True)
    assert version.stdout.strip() == record['tools']['dsd']['verified_version_output']
    rom = args.rom.read_bytes()
    assert len(rom) == record['rom']['bytes'] and sha(rom) == record['rom']['sha256']
    arm9_offset, entry, main_base, stored_size = struct.unpack_from('<4I', rom, 0x20)
    assert (arm9_offset, entry, main_base, stored_size) == (0x4000, 0x02000800, 0x02000000, 692568)
    table_offset, table_size = struct.unpack_from('<II', rom, 0x50)
    assert table_size == 14 * 32
    overlay = struct.unpack_from('<8I', rom, table_offset + 12 * 32)
    assert (overlay[0], overlay[1], overlay[2], overlay[6], overlay[7]) == (12, 0x021ac1c0, 167776, 12, 0)
    fat_offset, fat_size = struct.unpack_from('<II', rom, 0x48)
    assert 12 * 8 + 8 <= fat_size
    start, end = struct.unpack_from('<II', rom, fat_offset + overlay[6] * 8)
    assert (start, end) == (0x1e6e00, 0x20fd60)
    images = {'main': (main_base, rom[arm9_offset:arm9_offset + 656832]),
              'ov012': (overlay[1], rom[start:end])}
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    regions = json.loads((ROOT / 'decomp/matching-notes/baseline-t01/executable-regions.json').read_text())
    prepare_config(ROOT, output, expected_modules(regions))
    commands = [[str(args.dsd.resolve()), 'rom', 'extract', '-r', str(args.rom.resolve()), '-o', str(output / 'extract')],
                [str(args.dsd.resolve()), 'delink', '-c', str(output / 'config/config.yaml')]]
    for index, command in enumerate(commands):
        result = subprocess.run(command, capture_output=True, text=True)
        (output / f'dsd-{index}.log').write_text(result.stdout + result.stderr)
        assert result.returncode == 0, f'DSD failed: {command}'
    assert (output / 'extract/arm9/arm9.bin').read_bytes() == images['main'][1]
    assert (output / 'extract/arm9_overlays/ov012.bin').read_bytes() == images['ov012'][1]
    objects = sorted((output / 'delinks').glob('*.o'))
    assert len(objects) == 15
    inventory = ''.join(f'{p.name}\t{sha(p.read_bytes())}\n' for p in objects)
    assert sha(inventory.encode()) == 'd7cc571d4b53dacca5657d9a0c6180464d81d744ea87c7076382f1db077473ee'
    inbound, outgoing = [], []
    elves = {p.name: Elf32(p.read_bytes()) for p in objects}
    for item in record['function_records']:
        elf = elves[f'_dsd_gap@{item["module"]}_5.o']
        symbol = next(s for s in elf.symbols() if elf.symbol_name(s) == item['symbol'])
        assert symbol[2] == item['full_extent_bytes']
        raw = elf.content(elf.sections[symbol[5]])[symbol[1]:symbol[1] + symbol[2]]
        base, image = images[item['module']]
        offset = number(item['address']) - base
        assert sha(raw) == item['raw_object_payload_sha256']
        assert sha(image[offset:offset + symbol[2]]) == item['rom_payload_sha256']
    for filename, elf in elves.items():
        symbols = elf.symbols()
        for section in elf.sections:
            if section[1] != 4:
                continue
            ctor = next((s for s in symbols if elf.symbol_name(s) == 'func_0202c4ac' and s[5] == section[7]), None)
            for offset, info, addend in struct.iter_unpack('<IIi', elf.content(section)):
                target = elf.symbol_name(symbols[info >> 8])
                if ctor and ctor[1] <= offset < ctor[1] + ctor[2]:
                    outgoing.append(dict(address=f'0x{0x0202c4ac + offset - ctor[1]:08x}', type=info & 255, symbol=target, addend=addend))
                if target != 'func_0202c4ac':
                    continue
                owners = [s for s in symbols if s[3] & 15 == 2 and s[5] == section[7] and s[1] <= offset < s[1] + s[2]]
                assert len(owners) == 1
                caller = elf.symbol_name(owners[0])
                address = number(caller[-8:]) + offset - owners[0][1]
                inbound.append(dict(object=filename, section=elf.section_name(elf.sections[section[7]]), caller_symbol=caller, address=f'0x{address:08x}', type=info & 255, addend=addend))
                base, image = images['ov012' if filename.endswith('@ov012_5.o') else 'main']
                assert branch_target(image[address - base:address - base + 4], address, info & 255) == 0x0202c4ac
    inbound.sort(key=lambda item: (item['object'], item['address']))
    assert inbound == record['inbound_relocations'] and len(inbound) == 13
    assert outgoing == record['target']['outgoing_relocations']
    payload = images['main'][1][0x2c4ac:0x2c508]
    assert [f'{word:08x}' for word in struct.unpack('<21I', payload[:84])] == record['target']['instruction_words']
    assert struct.unpack('<2I', payload[84:]) == (0x02098708, 0x020a0c34)
    for call in (0x0202c4d4, 0x0202c4e0):
        assert branch_target(payload[call - 0x0202c4ac:call - 0x0202c4ac + 4], call, 1) == 0x020326b0
    result = dict(status='passed',scope='original machine contract; no source trial',
                  original_objects=15,caller_functions=len({r['caller_symbol'] for r in inbound}),
                  main_call_sites=9,ov012_call_sites=4,instruction_bytes=84,literal_bytes=8,
                  rom_payload_sha256=sha(payload),object_inventory_sha256=sha(inventory.encode()),
                  source_pin_count=len(record['source_pins']),commands=commands)
    (output / 'readback.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({k: v for k, v in result.items() if k != 'commands'}, indent=2))


if __name__ == '__main__':
    main()
