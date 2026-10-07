"""Read the actual bounded MW ELF object and explain its two pool relocations."""
import hashlib
import struct
from pathlib import Path


def inspect_object(path: Path) -> dict:
    data = path.read_bytes()
    header = struct.unpack_from('<16sHHIIIIIHHHHHH', data)
    assert header[0][:7] == b'\x7fELF\x01\x01\x01' and header[1] == 1 and header[2] == 40
    assert header[3] == 1 and header[11] == 40
    raw = [struct.unpack_from('<IIIIIIIIII', data, header[6] + i*40) for i in range(header[12])]
    names_section = raw[header[13]]
    names = data[names_section[4]:names_section[4]+names_section[5]]
    sections = [{'index': i, 'name': names[s[0]:names.index(0,s[0])].decode(),
                 'type': s[1], 'flags': s[2], 'offset': s[4], 'size': s[5],
                 'link': s[6], 'info': s[7], 'alignment': s[8], 'entry_size': s[9]}
                for i,s in enumerate(raw)]
    tables = {}
    for section in sections:
        if section['type'] != 2:
            continue
        strings = sections[section['link']]
        strings = data[strings['offset']:strings['offset']+strings['size']]
        assert section['entry_size'] == 16
        symbols = []
        for offset in range(section['offset'],section['offset']+section['size'],16):
            name,value,size,info,other,index = struct.unpack_from('<IIIBBH',data,offset)
            symbols.append({'name': strings[name:strings.index(0,name)].decode(),
                'value': value, 'size': size, 'binding': info>>4, 'type': info&15,
                'other': other, 'section_index': index})
        tables[section['index']] = symbols
    symbols = [s for table in tables.values() for s in table]
    trial, = [s for s in symbols if s['name'] == 'arm7_low_getter_trial']
    section = sections[trial['section_index']]
    assert trial['binding'] == 1 and trial['type'] == 2 and trial['value'] == 0
    assert section['name'] == '.text' and section['flags'] == 6 and section['alignment'] == 4
    assert trial['size'] == section['size']
    modes = [s for s in symbols if s['name'] in ('$a','$d','$t')]
    assert [(s['name'],s['value']) for s in modes] == [('$a',0),('$d',80)]
    text = data[section['offset']:section['offset']+section['size']]
    relocations = []
    for rel in sections:
        if rel['type'] not in (4,9):
            continue
        assert rel['type'] == 4 and rel['entry_size'] == 12 and rel['info'] == section['index']
        for offset in range(rel['offset'],rel['offset']+rel['size'],12):
            target,info,addend = struct.unpack_from('<IIi',data,offset)
            symbol = tables[rel['link']][info>>8]
            assert symbol['section_index'] == 0 and 80 <= target <= len(text)-4
            relocations.append({'section': rel['name'], 'offset': target,
                'type': info&255, 'symbol': symbol['name'], 'symbol_index': info>>8,
                'addend': addend})
    return {'format': 'elf32-littlearm', 'elf_type': header[1], 'machine': header[2],
        'flags': header[7], 'object_sha256': hashlib.sha256(data).hexdigest(),
        'sections': sections, 'symbols': symbols, 'trial_symbol': trial, 'mode': 'Arm',
        'mode_evidence': modes, 'relocations': relocations, 'text_hex': text.hex(),
        'instruction_bytes': 80, 'pool_bytes': len(text)-80,
        'text_sha256': hashlib.sha256(text).hexdigest()}


def resolve_literals(row: dict, bindings: dict) -> bytes:
    text = bytearray.fromhex(row['text_hex'])
    for relocation in row['relocations']:
        if relocation['type'] != 2:
            raise ValueError('only observed R_ARM_ABS32 pool relocations are explained')
        value = bindings[relocation['symbol']] + relocation['addend']
        if not 0 <= value <= 0xffffffff:
            raise ValueError('bound word is outside unsigned 32-bit range')
        struct.pack_into('<I', text, relocation['offset'], value)
    return bytes(text)


def check_pool(row: dict, bindings: dict, expected: bytes) -> None:
    actual = resolve_literals(row, bindings)[row['instruction_bytes']:]
    if actual != expected:
        raise ValueError('literal pool mismatch after actual ABS32 relocation explanation')
