"""Independent ELF object parsing and frozen public-capsule review."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess

OUT=Path(__file__).resolve().parent
PUBLIC_REPO=Path('/private/tmp/jus-arm7-leaf-trial')
BASE=PUBLIC_REPO/'decomp/matching-notes/other-cpus'
PUBLIC=BASE/'arm7-leaf-c-trial-proof'
COMMIT='c072c63e059ab7a04ff806721112e73cb10409c4'
sha=lambda b:hashlib.sha256(b).hexdigest()
u16=lambda b,o:int.from_bytes(b[o:o+2],'little')
u32=lambda b,o:int.from_bytes(b[o:o+4],'little')
def string(b,o):
    end=b.find(b'\x00',o)
    assert 0<=o<=end
    return b[o:end].decode('ascii')

expected_objects={
    'baseline':'182ebed8e905dd0b2b1eb363d0efefa7864e03ded84db7c1804110c1eea52bff',
    'O4p':'03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf',
}
readbacks=[]
original=(OUT/'original-program-0-code.bin').read_bytes()
worker=json.loads((PUBLIC/'trial-proof.json').read_bytes())
fresh=json.loads((OUT/'closed-reproduced/trial-proof.json').read_bytes())
assert fresh['status']==worker['status']=='bounded_plain_C_trial_exact_O4_bytes'
assert fresh['originals']==worker['originals'] and fresh['triage_receipts']==worker['triage_receipts']
assert fresh['hypotheses']==worker['hypotheses']
assert fresh['source_credit_bytes']==worker['source_credit_bytes']==0
assert fresh['canonical_update'] is worker['canonical_update'] is False
for recipe,published,reproduced in zip(('baseline','O4p'),worker['trials'],fresh['trials'],strict=True):
    assert published['recipe']==reproduced['recipe']==recipe
    assert {k:v for k,v in published.items() if k!='argv'}=={k:v for k,v in reproduced.items() if k!='argv'}
    path=OUT/'closed-reproduced'/recipe/'compiled.o'
    b=path.read_bytes()
    assert sha(b)==expected_objects[recipe]
    assert b[:7]==b'\x7fELF\x01\x01\x01'
    assert u16(b,16)==1 and u16(b,18)==40 and u32(b,20)==1
    assert u32(b,36)==0x02100000
    section_offset=u32(b,32);stride=u16(b,46);count=u16(b,48);strings_index=u16(b,50)
    assert stride==40 and section_offset+stride*count<=len(b)
    sections=[{k:u32(b,section_offset+i*stride+j*4) for j,k in enumerate(('name_offset','type','flags','address','offset','size','link','info','align','entry_size'))} for i in range(count)]
    s=sections[strings_index];strings=b[s['offset']:s['offset']+s['size']]
    for section in sections: section['name']=string(strings,section['name_offset'])
    text_matches=[(i,s) for i,s in enumerate(sections) if s['name']=='.text']
    (text_index,text),=text_matches
    assert text['type']==1 and text['flags']==6 and text['align']==4
    assert text['size']==(36 if recipe=='baseline' else 20)
    assert not any(s['type'] in (4,9) for s in sections)
    assert not any(s['type']==1 and s['flags']&2 and s['size']>0 and s['name']!='.text' for s in sections)
    symbols=[]
    for section in sections:
        if section['type']!=2:continue
        assert section['entry_size']==16
        s=sections[section['link']];names=b[s['offset']:s['offset']+s['size']]
        for o in range(section['offset'],section['offset']+section['size'],16):
            name=string(names,u32(b,o));value=u32(b,o+4);size=u32(b,o+8);info=b[o+12];idx=u16(b,o+14)
            symbols.append({'name':name,'value':value,'size':size,'binding':info>>4,'type':info&15,'section':idx})
    funcs=[s for s in symbols if s['type']==2 and s['binding']==1]
    assert funcs==[{'name':'arm7_store_trial','value':0,'size':text['size'],'binding':1,'type':2,'section':text_index}]
    mappings=[s for s in symbols if s['name'] in ('$a','$t','$d')]
    assert len(mappings)==1 and mappings[0]['name']=='$a' and mappings[0]['value']==0 and mappings[0]['section']==text_index and mappings[0]['binding']==0
    code=b[text['offset']:text['offset']+text['size']]
    assert len(code)==text['size']
    assert (code==original)==(recipe=='O4p')
    mismatch=[i for i in range(max(len(code),len(original))) if i>=len(code) or i>=len(original) or code[i]!=original[i]]
    assert mismatch==published['byte_mismatch_offsets']
    assert sha(code)==published['elf']['text_sha256']
    assert all(w>>28==14 for w in struct.unpack('<'+'I'*(len(code)//4),code))
    assert struct.unpack_from('<I',code,len(code)-4)[0]==0xe12fff1e
    cmd=['/opt/homebrew/opt/llvm/bin/llvm-mc','--disassemble','--triple=armv4t-none-eabi']
    llvm=subprocess.run(cmd,input=' '.join('0x%02x'%x for x in code)+'\n',text=True,capture_output=True)
    assert llvm.returncode==0 and not llvm.stderr
    assert llvm.stdout.encode()==(OUT/'closed-reproduced'/recipe/'llvm-disassembly.txt').read_bytes()==(PUBLIC/(recipe+'-llvm-disassembly.txt')).read_bytes()
    def readobj_payload(path):
        return '\n'.join(line for line in path.read_text().splitlines() if not line.startswith('File: '))
    assert readobj_payload(OUT/'closed-reproduced'/recipe/'elf-readback.txt') == readobj_payload(PUBLIC/(recipe+'-elf-readback.txt'))
    (OUT/(recipe+'-independent-llvm.txt')).write_text(llvm.stdout)
    if recipe=='O4p':assert llvm.stdout.encode()==(OUT/'original-program-0-llvm.txt').read_bytes()==(OUT/'original-program-1-llvm.txt').read_bytes()
    argv=reproduced['argv']
    flags=['-proc','arm7tdmi','-nothumb','-interworking','-nostdinc']
    assert argv[2:7]==flags
    assert argv[7:-4]==([] if recipe=='baseline' else ['-O4,p'])
    assert argv[-4]=='-c' and argv[-2]=='-o'
    readbacks.append({'recipe':recipe,'object_sha256':sha(b),'code_sha256':sha(code),'code_bytes':len(code),'elf_flags':u32(b,36),'global_function':funcs[0],'mapping_symbols':mappings,'sections':sections,'relocation_sections':[],'exact_original_bytes_both_programs':code==original,'mismatch_offsets':mismatch,'actual_argv':argv,'compiler_stdout_sha256':sha((OUT/'closed-reproduced'/recipe/'compiler-stdout.log').read_bytes()),'compiler_stderr_sha256':sha((OUT/'closed-reproduced'/recipe/'compiler-stderr.log').read_bytes()),'llvm_sha256':sha(llvm.stdout.encode())})
before=json.loads((OUT/'closure-input-snapshot-before.json').read_bytes())
after={n:sha(Path(n).read_bytes()) for n in before}
assert before==after
(OUT/'closure-input-snapshot-after.json').write_text(json.dumps(after,indent=2)+'\n')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=PUBLIC_REPO,text=True).strip()==COMMIT
changed=subprocess.check_output(['git','diff','--name-only','a9947bd89d8a56fc9c8673e6a0e673fbf2157bdb^',COMMIT],cwd=PUBLIC_REPO,text=True).splitlines()
assert len(changed)==21
assert all(n.startswith('decomp/matching-notes/other-cpus/arm7-leaf-c-trial') for n in changed)
public_hashes={}
for name in changed:
    blob=subprocess.check_output(['git','show',COMMIT+':'+name],cwd=PUBLIC_REPO)
    assert (PUBLIC_REPO/name).read_bytes()==blob
    public_hashes[name]=sha(blob)
assert sha((PUBLIC/'store_trial.c').read_bytes())=='a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb'
assert sha((PUBLIC/'reproduce.py').read_bytes())=='75f757fa025dd177fb9fc9995aa4e2cd52a86ed491cd685dbd187116fca185ea'
assert sha((PUBLIC/'trial-proof.json').read_bytes())=='5066f5da410fc6809eac804ae953d24bf6ac0c12d70404df496cba5fac2919f7'
assert sha((BASE/'arm7-leaf-c-trial.md').read_bytes())=='5beb8c3c908c3bf52391f09010ca30aacb5e6e51eed6ad7bbcd0667af28e9b7a'
triage=json.loads((PUBLIC/'triage.json').read_bytes())
assert sha((PUBLIC/'triage.json').read_bytes())=='bc8ee39a731209b5a6158f6b2099d3c6ee5ff5a50579938dae9d5d272e374f42'
historical=[]
for name,pin in triage['artifacts_sha256'].items():
    path=PUBLIC/'triage'/name
    blob=path.read_bytes();assert sha(blob)==pin
    r=json.loads(blob)
    assert r['producer_sha256']=='28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff'
    assert r['status']=='bounded_arm7_candidate_graphs_verified' and r['inputs_unchanged'] is True
    historical.append({'file':name,'sha256':pin,'request_sha256':r['request_sidecar_sha256'],'status':r['status']})
assert len(historical)==5
replay=json.loads((OUT/'triage-replay-receipts.json').read_bytes())
assert replay['status']=='passed' and len(replay['receipts'])==5
receipt={'status':'accepted','findings':[],'reviewed_commit':COMMIT,'independent_original_read_sha256':sha((OUT/'original-read.json').read_bytes()),'trials':readbacks,'inputs_unchanged':True,'before_input_snapshot_sha256':sha((OUT/'closure-input-snapshot-before.json').read_bytes()),'after_input_snapshot_sha256':sha((OUT/'closure-input-snapshot-after.json').read_bytes()),'public_git_blobs_sha256':public_hashes,'fresh_trial_proof_sha256':sha((OUT/'closed-reproduced/trial-proof.json').read_bytes()),'triage_scope':'All five complete triage reports and exact request sidecars are now committed. Independently replayed each published request with frozen producer and pinned original ROM/layout; every full report reproduced byte for byte. Both C recipes reproduced using only the closed local capsule and the documented pinned external tools/ROM/layout.','rechecked_public_triage_receipts':historical,'triage_replay_receipts_sha256':sha((OUT/'triage-replay-receipts.json').read_bytes()),'resolved_findings':[{'original_commit':'a9947bd89d8a56fc9c8673e6a0e673fbf2157bdb','issue':'Private-only triage reports prevented closed capsule reproduction.','resolution_commit':COMMIT,'resolution':'Committed all five report/request pairs; reproduction script resolves them relative to its own capsule; fresh compilation and all five frozen-probe replays passed.'}],'scope_review':'Plain C trial name/unsigned32/pointer32/void are hypotheses. Actual ARM7TDMI/ARM/interworking flags and ELF ARM mapping confirmed. Exact optimized bytes are a finite candidate match only; external store ownership and original return ABI/function boundaries/source ownership/link contract/compiler/runtime remain unproven. Zero source credit, no canonical update, T10 remains open.','source_credit_bytes':0,'canonical_update':False,'branch_feasibility':'unknown','independent_scripts_sha256':{n:sha((OUT/n).read_bytes()) for n in ('read_leaf.py','check_leaf.py','replay_triage.py')},'independent_llvm_logs_sha256':{p.name:sha(p.read_bytes()) for p in OUT.glob('*llvm.txt')}}
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Accepted, no findings: actual fresh baseline/O4p objects, all five full triage replays, independent ELF/LLVM/original bytes, input pins, and all 21 public Git blobs agree.')
