#!/usr/bin/env python3
"""Bounded donor search. Every result is a lead, never a rename or promotion.

The three stages preserve mapping-derived literal pools and relocation identities.
Native JUS has no emitted relocations: original whole-module RELA records remain
mandatory, with final linked relocation validation before function extraction.
"""
import argparse
import bisect
from collections import defaultdict
import hashlib
import importlib.util
import json
import os
import re
import struct
import subprocess
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from relocation_check import _checked_elf, _module, _decode_branch, validate_relocations


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def verified_file(path, expected):
    path = Path(path)
    if not isinstance(expected, str) or not re.fullmatch('[0-9a-f]{64}', expected) or digest(path) != expected:
        raise ValueError('input pin mismatch: ' + str(path))
    return path


def license_allowed(record):
    return (record.get('spdx') in ('MIT', 'Zlib') and record.get('import_allowed') is True
            and isinstance(record.get('sha256'), str)
            and re.fullmatch('[0-9a-f]{64}', record['sha256']) is not None
            and bool(record.get('review')))


def normalized_bytes(record):
    value = bytearray(record['bytes'])
    for reloc in record['relocations']:
        offset, kind = reloc['offset'], reloc['type']
        if offset < 0 or offset + 4 > len(value):
            raise ValueError('relocation extent')
        if kind == 2:
            value[offset:offset + 4] = bytes(4)
        elif kind == 1:
            word = struct.unpack_from('<I', value, offset)[0]
            if word >> 24 in (0xEA, 0xEB):
                opcode = word & 0xFF000000
            elif word & 0xFE000000 == 0xFA000000:
                opcode = 0xFA000000
            else:
                raise ValueError('unsupported branch instruction')
            struct.pack_into('<I', value, offset, opcode)
        elif kind == 10:
            high, low = struct.unpack_from('<HH', value, offset)
            if high & 0xF800 != 0xF000 or low & 0xF800 not in (0xF800, 0xE800):
                raise ValueError('unsupported Thumb branch instruction')
            if low & 0xF800 == 0xE800 and low & 1:
                raise ValueError('invalid Thumb BLX alignment encoding')
            struct.pack_into('<HH', value, offset, 0xF000, low & 0xF800)
        else:
            raise ValueError('unsupported relocation type')
    return bytes(value)


def literal_bytes(record):
    content = normalized_bytes(record)
    return b''.join(content[start:end] for start, end in record['data_ranges'])


def compare_functions(donor, target, correspondence):
    result = {'status': 'rejected', 'stage': None, 'confidence': 'none', 'reasons': []}
    def reject(reason):
        result['reasons'].append(reason); return result
    if donor['mode'] != target['mode']:
        return reject('instruction mode')
    if not donor['code_ranges'] or not target['code_ranges']:
        return reject('data is not instructions')
    if donor.get('issues') or target.get('issues'):
        result.update(status='unresolved', reasons=['unsupported extraction metadata']); return result
    try:
        left, right = normalized_bytes(donor), normalized_bytes(target)
        if literal_bytes(donor) != literal_bytes(target):
            return reject('literal pool')
    except ValueError as error:
        result.update(status='unresolved', reasons=[str(error)]); return result
    a, b = donor['relocations'], target['relocations']
    bound = len(a) == len(b)
    for source, destination in zip(a, b):
        if (source['offset'], source['type'], source['addend']) != (destination['offset'], destination['type'], destination['addend']):
            bound = False; continue
        identity = correspondence.get(source['symbol'])
        if identity is None:
            bound = False
        elif identity != destination['destination']:
            return reject('relocation destination')
    raw = (donor['bytes'] == target['bytes'] and donor['code_ranges'] == target['code_ranges']
           and donor['data_ranges'] == target['data_ranges'])
    normalized = (left == right and donor['code_ranges'] == target['code_ranges']
                  and donor['data_ranges'] == target['data_ranges'])
    if raw or normalized:
        result.update(status='candidate' if bound else 'unresolved',
                      stage='raw' if raw else ('relocation_bound' if bound else 'unbound_collision'),
                      confidence='high' if bound else 'low')
        if not bound: result['reasons'].append('unbound destination')
    elif donor['structure'] and donor['structure'] == target['structure']:
        result.update(status='unresolved', stage='structural', confidence='low', reasons=['structure alone'])
    else:
        return reject('instruction bytes and structure differ')
    if sum(end-start for start,end in donor['code_ranges']) < 16:
        result.update(status='unresolved', confidence='low'); result['reasons'].append('tiny')
    return result


def search_functions(donors, targets, correspondence):
    # The index narrows work without removing tiny collisions or overlay identity.
    raw, normalized, structural = defaultdict(list), defaultdict(list), defaultdict(list)
    for index, target in enumerate(targets):
        raw[(target['mode'], target['bytes'])].append(index)
        try: normalized[(target['mode'], normalized_bytes(target))].append(index)
        except ValueError: pass
        structural[(target['mode'], tuple(target['structure']))].append(index)
    result = {'counts': {'candidate': 0, 'unresolved': 0, 'rejected': 0},
              'stages': {'raw': 0, 'relocation_bound': 0, 'unbound_collision': 0, 'structural': 0}, 'candidates': [],
              'donor_functions': len(donors), 'target_functions': len(targets)}
    for donor in donors:
        indices = set(raw.get((donor['mode'], donor['bytes']), []))
        try: indices.update(normalized.get((donor['mode'], normalized_bytes(donor)), []))
        except ValueError: pass
        if donor['structure']:
            indices.update(structural.get((donor['mode'], tuple(donor['structure'])), []))
        matches = []
        for index in sorted(indices):
            target = targets[index]; match = compare_functions(donor, target, correspondence)
            result['counts'][match['status']] += 1
            if match['stage']: result['stages'][match['stage']] += 1
            if match['status'] != 'rejected':
                match.update(donor=donor['identity'], target=target['identity'])
                matches.append(match)
        if len(matches) > 1:
            for match in matches:
                if match['status'] == 'candidate':
                    result['counts']['candidate'] -= 1; result['counts']['unresolved'] += 1
                match.update(status='unresolved', confidence='low'); match['reasons'].append('ambiguous')
        result['candidates'].extend(matches)
    return result


def disassembly(path, objdump, output):
    command = [str(objdump), '-d', '--mcpu=arm946e-s', '--no-show-raw-insn', str(path)]
    result = subprocess.run(command, capture_output=True, text=True); result.check_returncode()
    output.write_text(result.stdout + result.stderr)
    elf = _checked_elf(path)
    queues = defaultdict(list)
    for index, section in enumerate(elf.sections):
        if section[2] & 4 and section[5]:
            queues[elf.section_name(section)].append(index)
    sections = defaultdict(dict); name = None
    for line in result.stdout.splitlines():
        match = re.match(r'Disassembly of section (.+):', line)
        if match:
            queue = queues[match[1]]
            if not queue: raise ValueError('disassembly section identity unavailable')
            name = queue.pop(0); continue
        match = re.match(r'\s*([0-9a-f]+):\s+([a-z][a-z0-9.]*)\b', line)
        if name is not None and match:
            sections[name][int(match[1],16)] = match[2]
    return sections, {'command': command, 'returncode': result.returncode, 'output_sha256': digest(output)}


def mapping_ranges(mappings, start, size, mode):
    end = start + size; entries = mappings
    index = bisect.bisect_right(entries, (start, 'z')) - 1
    current = entries[index][1] if index >= 0 else None
    after = bisect.bisect_right(entries, (start, 'z'))
    before = bisect.bisect_left(entries, (end, ''))
    stops = list(entries[after:before]) + [(end,None)]
    code, data, issues = [], [], []
    left = start
    for right, next_state in stops:
        if right > left:
            if current == 'd': data.append((left-start,right-start))
            elif current == ('a' if mode=='arm' else 't'): code.append((left-start,right-start))
            else: issues.append('unknown or conflicting instruction mapping')
        left, current = right, next_state
    return code, data, issues


def extract_donors(path, identity, objdump, output):
    elf = _checked_elf(path); symbols = elf.symbols(); mappings = defaultdict(list)
    for s in symbols:
        name = elf.symbol_name(s)
        if re.fullmatch(r'\$[atd](\..*)?',name): mappings[s[5]].append((s[1]&~1,name[1]))
    relocs = defaultdict(list)
    for section in elf.sections:
        if section[1] == 9: raise ValueError('implicit REL is unsupported')
        if section[1] != 4: continue
        if section[9] != 12 or section[5] % 12: raise ValueError('invalid RELA extent')
        if not 0 < section[7] < len(elf.sections): raise ValueError('invalid relocation sh_info')
        for offset, info, addend in struct.iter_unpack('<IIi',elf.content(section)):
            if info >> 8 >= len(symbols) or offset + 4 > elf.sections[section[7]][5]:
                raise ValueError('invalid relocation slot or symbol')
            relocs[section[7]].append({'offset':offset,'type':info&255,'addend':addend,
                                       'symbol':elf.symbol_name(symbols[info>>8]),'destination':None})
    instructions, command = disassembly(path,objdump,output)
    records=[]
    for symbol in symbols:
        if symbol[3]&15 != 2 or not 0<symbol[5]<len(elf.sections) or not symbol[2]: continue
        section=elf.sections[symbol[5]]; name=elf.section_name(section);start=symbol[1]&~1;size=symbol[2]
        states=sorted(mappings[symbol[5]]); at=bisect.bisect_right(states,(start,'z'))-1
        state=states[at][1] if at>=0 else None
        mode='thumb' if symbol[1]&1 or state=='t' else 'arm'
        code,data,issues=mapping_ranges(states,start,size,mode)
        if start+size>section[5] or section[1]!=1: issues.append('unsupported function extent')
        selected=[dict(r,offset=r['offset']-start) for r in relocs[symbol[5]] if start<=r['offset']<start+size]
        structure=[instructions[symbol[5]][address] for address in sorted(instructions[symbol[5]]) if start<=address<start+size and any(a<=address-start<b for a,b in code)]
        records.append({'identity':dict(identity,symbol=elf.symbol_name(symbol),mode=mode), 'mode':mode,
                        'bytes':elf.content(section)[start:start+size],'code_ranges':code,'data_ranges':data,
                        'relocations':selected,'structure':structure,'issues':issues})
    return records, command


def extract_targets(reference_objects, linked_path, rom_sha256, objdump, output):
    validation=validate_relocations(reference_objects,linked_path)
    if validation['status']!='passed': raise ValueError('original linked relocation gate did not pass')
    linked=_checked_elf(linked_path); lsymbols=defaultdict(list)
    for s in linked.symbols():
        if s[5]: lsymbols[linked.symbol_name(s)].append(s)
    names={i:linked.section_name(s) for i,s in enumerate(linked.sections)}
    def region(section): return {'.arm9':'ARM9','.itcm':'ITCM','.dtcm':'DTCM'}.get(section,section[1:].upper())
    lregions={region(n):i for i,n in names.items() if n in ('.arm9','.itcm','.dtcm') or re.fullmatch(r'\.ov\d{3}',n)}
    def marker(mod,name):
        candidates=[s[1] for s in lsymbols[mod+'_'+name[1:].upper()+'_START'] if s[5]==lregions[mod]]
        if len(candidates)!=1: raise ValueError('ambiguous input section placement')
        return candidates[0]
    references=[];definitions=defaultdict(list)
    for path in reference_objects:
        elf=_checked_elf(path);mod=_module(path);symbols=elf.symbols();maps=defaultdict(list)
        item={'elf':elf,'module':mod,'symbols':symbols,'maps':maps};references.append(item)
        for s in symbols:
            name=elf.symbol_name(s)
            if re.fullmatch(r'\$[atd](\..*)?',name): maps[s[5]].append((s[1],name[1]))
            if s[5] and s[3]>>4: definitions[name].append((item,s))
    for item in references:
        for entries in item['maps'].values(): entries.sort()
    def destination(item,s,kind):
        if not s[5]:
            possible=definitions[item['elf'].symbol_name(s)]
            if len(possible)!=1: return None
            item,s=possible[0]
        if not 0<s[5]<len(item['elf'].sections): return None
        sec=item['elf'].sections[s[5]];secname=item['elf'].section_name(sec)
        address=marker(item['module'],secname)+s[1]
        states=item['maps'][s[5]];at=bisect.bisect_right(states,(s[1],'z'))-1
        state=states[at][1] if at>=0 else None
        if kind in (1,10) or s[3]&15==2:
            final=[value for value in lsymbols[item['elf'].symbol_name(s)]
                   if value[5]==lregions[item['module']] and value[1]&~1==address]
            if len(final)!=1: return None
            mode='thumb' if final[0][1]&1 else 'arm'
        else: mode='data'
        return {'rom_sha256':rom_sha256,'cpu':'arm9','module':'main' if item['module']=='ARM9' else item['module'].lower(),
                'section':secname,'address':address,'mode':mode}
    instructions,command=disassembly(linked_path,objdump,output)
    instruction_addresses={index:sorted(values) for index,values in instructions.items()}
    records=[]
    for item in references:
        elf,mod,symbols=item['elf'],item['module'],item['symbols'];relocs=defaultdict(list)
        for section in elf.sections:
            if section[1]!=4: continue
            for offset,info,addend in struct.iter_unpack('<IIi',elf.content(section)):
                ident,kind=info>>8,info&255
                relocs[section[7]].append({'offset':offset,'type':kind,'addend':addend,
                                          'symbol':elf.symbol_name(symbols[ident]),'destination':destination(item,symbols[ident],kind)})
        for symbol in symbols:
            if symbol[3]&15!=2 or not symbol[2] or not 0<symbol[5]<len(elf.sections): continue
            source_section=elf.sections[symbol[5]];source_name=elf.section_name(source_section)
            if not source_section[2]&4: continue
            address=marker(mod,source_name)+symbol[1];size=symbol[2]
            final=[s for s in lsymbols[elf.symbol_name(symbol)] if s[5]==lregions[mod] and s[1]&~1==address]
            if len(final)!=1: raise ValueError('missing or ambiguous final function identity')
            mode='thumb' if final[0][1]&1 else 'arm'; section=linked.sections[lregions[mod]]
            start=address-section[3];content=linked.content(section)[start:start+size]
            code,data,issues=mapping_ranges(item['maps'][symbol[5]],symbol[1],size,mode)
            selected=[]
            for r in relocs[symbol[5]]:
                if not symbol[1]<=r['offset']<symbol[1]+size: continue
                r=dict(r,offset=r['offset']-symbol[1]);raw=content[r['offset']:r['offset']+4]
                if r['destination'] is None: issues.append('unresolved authoritative relocation destination')
                if r['type'] in (1,10):
                    actual,state,call=_decode_branch(r['type'],raw,address+r['offset'])
                    r['observed']={'address':actual,'mode':'thumb' if state=='t' else 'arm','call':call}
                else: r['observed']={'pointer':struct.unpack('<I',raw)[0]}
                selected.append(r)
            section_index=lregions[mod]
            addresses=instruction_addresses[section_index]
            lo,hi=bisect.bisect_left(addresses,address),bisect.bisect_left(addresses,address+size)
            structure=[instructions[section_index][a] for a in addresses[lo:hi] if any(x<=a-address<y for x,y in code)]
            records.append({'identity':{'rom_sha256':rom_sha256,'cpu':'arm9','module':'main' if mod=='ARM9' else mod.lower(),
                                        'section':source_name,'address':address,'mode':mode,'symbol':elf.symbol_name(symbol)},
                            'mode':mode,'bytes':content,'code_ranges':code,'data_ranges':data,
                            'relocations':selected,'structure':structure,'issues':issues})
    return records,validation,command


def function_metadata(record):
    """Public metadata omits game and donor instruction payloads."""
    result = {key: value for key, value in record.items() if key not in ('bytes', 'structure')}
    result.update(size_bytes=len(record['bytes']), payload_sha256=hashlib.sha256(record['bytes']).hexdigest(),
                  structure_sha256=hashlib.sha256(json.dumps(record['structure']).encode()).hexdigest())
    try: result['normalized_sha256'] = hashlib.sha256(normalized_bytes(record)).hexdigest()
    except ValueError: result['normalized_sha256'] = None
    return result


def run_corpus(args):
    """Rebuild the declared corpus, validate original slots, and save leads only."""
    started = time.monotonic(); root = args.root.resolve(); manifest = json.loads(args.manifest.read_text())
    output = args.output.resolve()
    if output.exists(): raise ValueError('corpus output must be fresh')
    output.mkdir(parents=True)
    tools = args.tools_root.resolve()
    compiler = tools / 'mwccarm' / manifest['compiler']['package'] / 'mwccarm.exe'
    runner = tools / 'wibo/wibo-macos'; dsd = tools / 'dsd/dsd-macos-arm64'
    for path, pin in ((compiler, manifest['compiler']), (runner, manifest['runner']),
                      (dsd, manifest['dsd']), (args.objdump, manifest['objdump']),
                      (args.header_helper, manifest['header_helper'])):
        verified_file(path, pin['sha256'])
    for name, pin in manifest['compiler']['binaries'].items(): verified_file(compiler.parent / name, pin)
    spec = importlib.util.spec_from_file_location('donor_header_dependencies', args.header_helper)
    helper = importlib.util.module_from_spec(spec); spec.loader.exec_module(helper)
    environment = {k:v for k,v in os.environ.items() if not k.upper().startswith(('MWC','MWARM'))}
    report = {'schema_version':1, 'status':'unresolved', 'manifest_sha256':digest(args.manifest),
              'implementation_sha256':{'matcher':digest(Path(__file__)),
                                       'relocation_check':digest(Path(__file__).with_name('relocation_check.py'))},
              'source_credit':0, 'source_imports':0, 'renames':0, 'builds':[], 'excluded':[],
              'tool_pins':{key:manifest[key] for key in ('compiler','runner','objdump','dsd','header_helper')},
              'signatures':[], 'measurement':{'kind':'agent experiment wall time; not measured human analyst effort'}}
    donors = []; objects = []; corpus_pins = {}
    for family in manifest['families']:
        checkout = root / family['checkout']
        revision = subprocess.check_output(['git','rev-parse','HEAD'], cwd=checkout, text=True).strip()
        if revision != family['revision']: raise ValueError('donor revision mismatch')
        for name, pin in family['headers'].items():
            corpus_pins[verified_file(checkout / name, pin)] = pin
        for name, pin in family['context_headers'].items():
            corpus_pins[verified_file(root / name, pin)] = pin
        for source in family['sources']:
            if not license_allowed(source.get('license',{})):
                report['excluded'].append({'family':family['id'],'source':source['path'],'reason':'missing reviewed permission'}); continue
            source_path = verified_file(checkout / source['path'], source['sha256'])
            corpus_pins[source_path] = source['sha256']
            corpus_pins[verified_file(checkout / source['license']['path'], source['license']['sha256'])] = source['license']['sha256']
            for context in manifest['contexts']:
                destination = output / 'objects' / family['id'] / context['id'] / (source_path.stem + '.o')
                unit = {'cpu':context['cpu'], 'flags':[*context['flags'], *family['compile_defines']],
                        'include_paths':['decomp/matching-notes/donor-t05/context',family['checkout']],
                        'headers':source['consumed_headers'][context['id']]}
                proof = helper.capture_and_compile(unit,root,source_path,destination,compiler,runner,environment)
                identity = {'family':family['id'],'revision':revision,'source':source['path'],'context':context['id']}
                report['builds'].append(dict(identity, abi=context['abi'], license=source['license'], dependency_proof=proof))
                if proof['status'] != 'passed':
                    (output/'report.json').write_text(json.dumps(report,indent=2)+'\n')
                    raise ValueError('donor dependency/build failed: '+str(proof.get('failure')))
                records, command = extract_donors(destination,identity,args.objdump,destination.with_suffix('.disassembly.txt'))
                donors.extend(records); objects.append((destination,records))
                report['builds'][-1].update(disassembly=command, functions=[function_metadata(r) for r in records])
    report['measurement']['build_seconds'] = round(time.monotonic()-started,3)
    target_dir = args.target_dir.resolve(); canonical = json.loads((target_dir/'report.json').read_text())
    if canonical['status'] != 'passed' or canonical['rom']['sha256'] != manifest['rom_sha256']:
        raise ValueError('target is not the declared passed canonical build')
    for name,pin in canonical['artifact_hashes'].items(): verified_file(target_dir/name,pin)
    references = sorted((target_dir/'delinks').glob('*.o')); linked = target_dir/'native-link/linked.elf'
    targets,validation,command = extract_targets(references,linked,manifest['rom_sha256'],args.objdump,output/'target.disassembly.txt')
    report['target'] = {'report_sha256':digest(target_dir/'report.json'),'linked_sha256':digest(linked),
                        'references':{path.name:digest(path) for path in references},'relocations':validation,
                        'disassembly':command,'extraction_issues':[function_metadata(t) for t in targets if t['issues']]}
    report['search'] = search_functions(donors,targets,manifest['reviewed_destination_correspondence'])
    report['search']['tiny_leads'] = sum('tiny' in c['reasons'] for c in report['search']['candidates'])
    report['measurement']['search_and_validation_seconds'] = round(time.monotonic()-started-report['measurement']['build_seconds'],3)

    def sig_run(name, command):
        result = subprocess.run([str(dsd),*command],capture_output=True,text=True)
        log = output / (name+'.txt'); log.write_text(result.stdout+result.stderr)
        record = {'name':name,'command':[str(dsd),*command],'returncode':result.returncode,
                  'output_sha256':digest(log),'no_matching_messages':(result.stdout+result.stderr).count('No matching function found')}
        report['signatures'].append(record)
        return result

    config = str(target_dir/'config/config.yaml')
    sig_run('builtin-list',['sig','list'])
    sig_run('builtin-apply',['sig','apply','-c',config,'--all','--dry'])
    lead = manifest['crc_lead']['symbol']
    control = sig_run('game-self-control-new',['sig','new','-c',config,'-f',lead])
    if control.returncode == 0:
        signature = output/'game-self-control.yaml'; signature.write_text(control.stdout)
        report['signatures'][-1]['signature_sha256'] = digest(signature)
        sig_run('game-self-control-apply',['sig','apply','-c',config,'-s',str(signature),'--dry'])
    for path,records in objects:
        if 'arm-O2p' not in str(path): continue
        for record in records:
            name = record['identity']['symbol']
            if name not in ('memcmp','strcmp','strncmp','adler32','crc32'): continue
            prefix = 'donor-'+name
            result = sig_run(prefix+'-new',['sig','new-elf','-i',str(path),'-f',name])
            if result.returncode == 0:
                signature = output/(prefix+'.yaml'); signature.write_text(result.stdout)
                report['signatures'][-1]['signature_sha256'] = digest(signature)
                sig_run(prefix+'-apply',['sig','apply','-c',config,'-s',str(signature),'--dry'])
    report['measurement']['total_seconds'] = round(time.monotonic()-started,3)
    report['benefit'] = {'accepted_source_matches':0,'promotions':0,'verified_manual_names':0,
                         'candidate_triage_remaining':len(report['search']['candidates'])}
    for path, pin in ((compiler, manifest['compiler']), (runner, manifest['runner']),
                      (dsd, manifest['dsd']), (args.objdump, manifest['objdump']),
                      (args.header_helper, manifest['header_helper'])):
        verified_file(path,pin['sha256'])
    for name,pin in manifest['compiler']['binaries'].items(): verified_file(compiler.parent/name,pin)
    for path,pin in corpus_pins.items(): verified_file(path,pin)
    verified_file(args.manifest,report['manifest_sha256'])
    report['corpus_after_sha256'] = {str(path.relative_to(root)):digest(path) for path in corpus_pins}
    (output/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root',type=Path,default=Path(__file__).resolve().parents[2])
    parser.add_argument('--manifest',type=Path,default=Path('decomp/donors.json'))
    parser.add_argument('--target-dir',type=Path,required=True)
    parser.add_argument('--tools-root',type=Path,required=True)
    parser.add_argument('--objdump',type=Path,required=True)
    parser.add_argument('--header-helper',type=Path,default=Path(__file__).with_name('header_dependencies.py'))
    parser.add_argument('--output',type=Path,required=True)
    args = parser.parse_args()
    report = run_corpus(args)
    print(json.dumps({'output':str(args.output),'counts':report['search']['counts'],
                      'stages':report['search']['stages'],'source_credit':0}))


if __name__ == '__main__': main()
