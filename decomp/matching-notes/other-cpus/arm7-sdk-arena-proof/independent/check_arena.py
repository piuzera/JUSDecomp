"""Independent original selections, graph provenance, and public blob checks."""
import hashlib
import json
from pathlib import Path
import struct
import subprocess

OUT=Path(__file__).resolve().parent
REPO=Path('/private/tmp/jus-arm7-sdk-arena-independent')
BASE=REPO/'decomp/matching-notes/other-cpus'
PUBLIC=BASE/'arm7-sdk-arena-proof'
COMMIT='c957abd3a1ee3191903e344d03a376892fd7da5e'
sha=lambda b:hashlib.sha256(b).hexdigest()
rom=Path('/Users/djdjo/Documents/mine/rom/jus.nds').read_bytes()
assert sha(rom)=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
fnt,fnlen,fat,falen=struct.unpack_from('<4I',rom,0x40)
directories=set();files={};queue=[(0xf000,'')]
while queue:
    directory,path=queue.pop();assert directory not in directories;directories.add(directory)
    pos,next_file,_=struct.unpack_from('<IHH',rom,fnt+(directory-0xf000)*8);pos+=fnt
    while rom[pos]:
        tag=rom[pos];pos+=1;name=rom[pos:pos+(tag&127)].decode('ascii');pos+=tag&127
        if tag&128:
            child,=struct.unpack_from('<H',rom,pos);pos+=2;queue.append((child,path+name+'/'))
        else:files[path+name]=next_file;next_file+=1
assert files['ChildRom/JSS2Child.srl']==79
cs,ce=struct.unpack_from('<II',rom,fat+79*8);assert (cs,ce)==(0x23b800,0x4464c8)
layouts=json.loads((BASE/'arm7-checked-layouts.json').read_bytes())
requests=json.loads((PUBLIC/'requests.json').read_bytes())
prior=json.loads((BASE/'arm7-branch-literal-proof/requests.json').read_bytes())
assert sha((PUBLIC/'requests.json').read_bytes())=='681a5260c40c031a2fcd4161863a45d7ef3d61af36639a293a17176818141f5d'
spans=[(0x037fcf04,0x037fcf2c),(0x037fd064,0x037fd070)]
expected_words=[(0xe1a00100,0xe2800627,0xe2800aff,0xe5801da0,0xe12fff1e,0xe1a00100,0xe2800627,0xe2800aff,0xe5801dc4,0xe12fff1e),(0xe1a01000,0xe3a00001,0xebffffa4)]
span_hashes=['dba77433134717ea7a8f1fc995279825ca62de53ab0adf7bdb7f8c7f020c2d59','aeb809ad5a9f8c3894e005fff8eadce11ca04cde1cb44a11f157d9dc258c70cf']
raw_records=[]
for index,(program,rom_base,layout,req,previous) in enumerate(zip((rom,rom[cs:ce]),(0,cs),layouts,requests,prior,strict=True)):
    assert sha(program)==layout['identity']['program_sha256']
    assert req['program']==previous['program']==layout['identity'] and req['roots']==previous['roots']
    assert req['selections'][:5]==previous['selections'] and len(req['selections'])==7
    assert req['selections'][5:]==[{'region':{'autoload':0},'mode':'Arm','extent':{'start':a,'end':b}} for a,b in spans]
    offset,entry,base,size=struct.unpack_from('<4I',program,0x30)
    assert [offset,entry,base,size]==[layout[k] for k in ('image_offset','entry','base','image_bytes')]
    assert sha(program[:0x4000])==layout['header_sha256']
    image=program[offset:offset+size];assert sha(image)==layout['image_sha256']
    params=image[layout['params_offset']:layout['params_offset']+20];assert sha(params)==layout['params_sha256']
    tb,te,ds,_,_=struct.unpack('<5I',params);table=image[tb-base:te-base];assert sha(table)==layout['table_sha256']
    stored=ds-base;regions=[]
    for j in range(len(table)//12):
        runtime,initialized,bss=struct.unpack_from('<3I',table,j*12);r=layout['regions'][j+1]
        assert r['kind']=={'autoload':j} and (runtime,bss)==(r['runtime_base'],r['bss_bytes'])
        assert r['stored_extent']=={'start':stored,'end':stored+initialized}
        assert sha(image[stored:stored+initialized])==r['sha256']
        regions.append((runtime,initialized,bss,stored));stored+=initialized
    runtime,initialized,bss,stored=regions[0]
    raw=[]
    for j,((a,b),words,pin) in enumerate(zip(spans,expected_words,span_hashes,strict=True)):
        assert runtime<=a<b<=runtime+initialized
        location=stored+a-runtime;selected=image[location:location+b-a]
        assert sha(selected)==pin and struct.unpack('<'+'I'*len(words),selected)==words
        argv=['/opt/homebrew/opt/llvm/bin/llvm-mc','--disassemble','--triple=armv4t-none-eabi']
        llvm=subprocess.run(argv,input=' '.join('0x%02x'%v for v in selected)+'\n',text=True,capture_output=True)
        assert llvm.returncode==0 and not llvm.stderr
        lines=[line for line in llvm.stdout.splitlines() if line.strip()]
        assert len(lines)==len(words)
        assert llvm.stdout.encode()==(PUBLIC/('llvm-setter-pair.txt' if j==0 else 'llvm-caller-tail.txt')).read_bytes()
        (OUT/('program-%d-span-%d-llvm.txt'%(index,j))).write_text(llvm.stdout)
        if j==1:
            branch=words[-1];signed=struct.unpack('<i',struct.pack('<I',(branch&0xffffff)<<8))[0]>>8
            assert branch>>28==14 and branch&0x0f000000==0x0b000000
            assert signed*4==-0x170 and a+8+8+signed*4==0x037fcf04
        raw.append({'start':a,'end':b,'stored_image_offset':location,'original_rom_offset':rom_base+offset+location,'sha256':pin,'words':['0x%08x'%w for w in words],'llvm_stdout_sha256':sha(llvm.stdout.encode())})
    tokens=[b'OS_SetArena',b'OS_InitArena',b'NitroSDK',b'NITRO',b'SDK_VERSION']
    assert all(image.lower().find(t.lower())==-1 for t in tokens)
    raw_records.append({'identity':layout['identity'],'selections':raw,'regions':regions,'token_scan_scope':'Only this exact original stored ARM7 image; case-insensitive named byte tokens','token_hits':{t.decode():[] for t in tokens}})

report_bytes=(OUT/'reproduced/report.json').read_bytes()
assert len(report_bytes)==529577 and sha(report_bytes)=='dd61b9d34b443128375a6cddf4bff87dca6844c331b6ac0d3b740fc1d7d7f288'
full=json.loads(report_bytes);summary=json.loads((PUBLIC/'graph-summary.json').read_bytes())
assert summary['report_sha256']==sha(report_bytes)
for k,v in full.items():
    if k!='programs':assert summary[k]==v
assert full['source_bytes']==0 and full['inputs_unchanged'] is True
assert all(full[k] is False for k in ('arm7_binary_baseline_complete','function_extents_established','executable_coverage_established','original_relocations_established'))
graph_checks=[]
for p,c,req in zip(full['programs'],summary['programs'],requests,strict=True):
    g=p['graph'];edges=g['edges'];root,=g['roots']
    assert p['identity']==g['program']==req['program']==c['identity']
    assert g['scope']=='root_assumed_selected_interpretations'
    assert len(g['nodes'])==34 and len(edges)==41 and len(g['observations'])==7
    assert set(root['visited_nodes'])==set(range(34)) and root['edge_examinations']==41 and len(root['frontiers'])==8
    assert c['nodes']==[{'node':i,'mode':n['mode'],**n['instruction']} for i,n in enumerate(g['nodes'])]
    assert all(not n['mode_conflict'] and n['identity']['program']==req['program'] and n['mode']=='Arm' for n in g['nodes'])
    assert all(o['executability']=='unknown' for o in g['observations'])
    assert c['root']==root
    assert c['counts']=={'observations':7,'nodes':34,'edges':41,'visited_nodes':34,'edge_examinations':41,'selected_edges':33,'frontier_edges':8,'unknown_target_edges':2,'mode_conflicts':0}
    for i,(e,ce) in enumerate(zip(edges,c['edges'],strict=True)):
        o=e['original'];t=o['target']
        if t['kind']=='address':
            assert t['mapping']['identity']['program']==req['program'] and t['mapping']['kind']=='initialized'
            ct={'address':t['address'],'mode':t['mode'],'mapping':'initialized autoload0 in this exact program','observation_boundary':t['boundary']}
        else:assert t=={'kind':'unknown'};ct=t
        assert ce=={'edge':i,'source_node':e['source_node'],'condition':e['source_condition'],'source':o['source'],'kind':o['kind'],'guard':o['guard'],'target':ct,'resolution':e['resolution']}
    assert edges[12]['source_condition']==edges[13]['source_condition']=='ne'
    assert edges[12]['original']['guard']=='condition_passed' and edges[13]['original']['guard']=='condition_failed'
    assert edges[20]['original']['source']==0x037fd058 and edges[20]['resolution']=={'kind':'selected','node':26}
    assert edges[24]['original']['guard']=='call_returned' and edges[24]['resolution']=={'kind':'selected','node':31}
    assert edges[39]['original']['source']==0x037fd06c and edges[39]['resolution']=={'kind':'selected','node':21}
    unknowns=[e for e in edges if e['original']['target']['kind']=='unknown']
    assert sorted(e['original']['source'] for e in unknowns)==[0x037fcf14,0x037fcf28]
    assert all(e['resolution']=={'kind':'frontier','reason':'indirect'} for e in unknowns)
    witness_receipts=[]
    for w,cw in zip(p['witnesses'][0],c['frontier_witnesses'],strict=True):
        assert cw['reason']==w['reason'] and [edges[i]['original'] for i in cw['edges']]==w['transfers']
        path=w['transfers'];assert path[0]['source']==root['address']
        assert all(a['target'].get('address')==b['source'] for a,b in zip(path,path[1:]))
        assert edges[cw['edges'][-1]]['resolution']['kind']=='frontier'
        witness_receipts.append({'edge_sequence':cw['edges'],'reason':cw['reason'],'guards':[t['guard'] for t in path]})
    graph_checks.append({'identity':req['program'],'counts':c['counts'],'frontier_witnesses':witness_receipts,'unknown_exchanges_remain_frontiers':True})
before=json.loads((OUT/'input-snapshot-before.json').read_bytes());after={n:sha(Path(n).read_bytes()) for n in before};assert after==before
(OUT/'input-snapshot-after.json').write_text(json.dumps(after,indent=2)+'\n')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=REPO,text=True).strip()==COMMIT
names=subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r',COMMIT],cwd=REPO,text=True).splitlines();assert len(names)==12
public_hashes={}
for name in names:
    assert name.startswith('decomp/matching-notes/other-cpus/arm7-sdk-arena-')
    blob=subprocess.check_output(['git','show',COMMIT+':'+name],cwd=REPO);assert (REPO/name).read_bytes()==blob;public_hashes[name]=sha(blob)
receipt={'status':'accepted','findings':[],'reviewed_commit':COMMIT,'review_scope':'Original-ROM facts, bounded graph facts, exact public blob bindings and reproduction closure. External SDK citation authority/content is assigned to a separate specialist.','public_git_blobs_sha256':public_hashes,'request_sha256':full['request_sidecar_sha256'],'complete_report_sha256':sha(report_bytes),'complete_report_bytes':len(report_bytes),'raw_original_records':raw_records,'graph_checks':graph_checks,'inputs_unchanged':True,'before_snapshot_sha256':sha((OUT/'input-snapshot-before.json').read_bytes()),'after_snapshot_sha256':sha((OUT/'input-snapshot-after.json').read_bytes()),'packaged_reproduction_exact_output_match':True,'source_credit_bytes':0,'canonical_update':False,'T10_complete':False,'scope_review':'Selected words and register-flow facts support an explicitly tentative arena interpretation; no original JUS names/types/SDK version/ABI/extent/relocations/runtime or external memory ownership are proved. Parent/child identities stay separate, NE/call-return guards remain explicit, BX LR targets remain unknown. Token absence is scoped to the five exact named tokens in stored ARM7 images only.','independent_script_sha256':sha(Path(__file__).read_bytes()),'independent_llvm_logs_sha256':{p.name:sha(p.read_bytes()) for p in OUT.glob('program-*-span-*-llvm.txt')}}
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Accepted original facts/proof closure, no findings: full packaged replay, independent ROM/LLVM/BL/guard/identity checks and all 12 Git blobs agree.')
