from pathlib import Path
import copy,hashlib,json,subprocess
P=Path('/private/tmp/jus-arm7-reachable-review-proof');binary=Path('/private/tmp/jus-arm7-reachable-review-cache/target/release/examples/arm7_reachable_probe');layout=Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json');rom=Path('/Users/djdjo/Documents/mine/rom/jus.nds');sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();valid=json.loads((P/'calls-requests.json').read_text()); cases=[]
def changed(label,edit,expected):
 value=copy.deepcopy(valid);edit(value);cases.append((label,value,expected))
changed('empty_requests',lambda x:x.clear(),'no layouts or program requests')
changed('duplicate_program',lambda x:x.append(copy.deepcopy(x[0])),'duplicate requested program')
changed('foreign_program',lambda x:x[0]['program'].update(program_sha256='0'*64),'requested program has no pinned layout')
changed('absent_root_selection',lambda x:x[0]['roots'][0].update(selection=2),'root selection index is absent')
changed('interior_root',lambda x:x[0]['roots'][0].update(address=0x037f846a),'RootNotInstructionStart')
changed('empty_assumption',lambda x:x[0]['roots'][0].update(assumption=' \n '),'EmptyRootAssumption')
changed('duplicate_root',lambda x:x[0]['roots'].append(copy.deepcopy(x[0]['roots'][0])),'DuplicateRoot')
changed('empty_roots',lambda x:x[0].update(roots=[]),'EmptyRoots')
changed('empty_selections',lambda x:x[0].update(selections=[],roots=[]),'EmptyObservations')
changed('same_mode_overlap',lambda x:x[0]['selections'].append(copy.deepcopy(x[0]['selections'][0])),'DuplicateOrOverlappingSameModeSelection')
changed('reversed_span',lambda x:x[0]['selections'][0].update(extent={'start':0x037f8470,'end':0x037f8468}),'EmptyOrReversed')
changed('unknown_request_field',lambda x:x[0].update(untrusted=True),'unknown field')
changed('unknown_selection_field',lambda x:x[0]['selections'][0].update(untrusted=True),'unknown field')
changed('unknown_mode',lambda x:x[0]['selections'][0].update(mode='ArmV5TE'),'unknown variant')
changed('unknown_region',lambda x:x[0]['selections'][0].update(region='table'),'unknown variant')
results=[]
def run(label,data,expected,alter=None):
 req=P/f'negative-{label}.json';req.write_bytes(data);args=[str(binary),str(rom),str(layout),sha(layout),str(req),sha(req),sha(binary)]
 if alter:alter(args)
 r=subprocess.run(args,capture_output=True);assert r.returncode!=0 and not r.stdout,(label,r.returncode,r.stdout);assert expected in r.stderr.decode(),(label,r.stderr.decode());results.append({'case':label,'exit_code':r.returncode,'stderr':r.stderr.decode().strip(),'stdout_bytes':len(r.stdout)})
for label,value,expected in cases:run(label,(json.dumps(value,indent=2)+'\n').encode(),expected)
run('malformed_json',b'[','EOF')
validbytes=(json.dumps(valid,indent=2)+'\n').encode()
for label,index in [('layout_pin',3),('request_pin',5),('producer_pin',6)]:run(label,validbytes,'hash mismatch',lambda args,i=index:args.__setitem__(i,'0'*64))
r=subprocess.run([str(binary)],capture_output=True);assert r.returncode and not r.stdout and b'usage:' in r.stderr;results.append({'case':'wrong_argv','exit_code':r.returncode,'stdout_bytes':len(r.stdout),'stderr':r.stderr.decode().strip()})
(P/'negative-probe-results.json').write_text(json.dumps({'status':'all malformed requests rejected without success output','producer_sha256':sha(binary),'cases':results},indent=2)+'\n');print(len(results),'negative cases pass')
