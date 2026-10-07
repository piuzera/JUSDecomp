"""Independent original caller words, guarded graph, and frozen capsule checks."""
from pathlib import Path
import hashlib
import json
import struct
import subprocess

OUT=Path(__file__).resolve().parent
REPO=Path('/private/tmp/jus-arm7-caller-tail-independent')
BASE=REPO/'decomp/matching-notes/other-cpus'
PUBLIC=BASE/'arm7-arena-caller-tail-proof'
COMMIT='f130c5630ffa42a9ee435144939d526ea32ae05a'
sha=lambda b:hashlib.sha256(b).hexdigest()
rom=Path('/Users/djdjo/Documents/mine/rom/jus.nds').read_bytes()
assert sha(rom)=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
fnt,fnlen,fat,falen=struct.unpack_from('<4I',rom,0x40)
todo=[(0xf000,'')];files={};dirs=set()
while todo:
    d,path=todo.pop();assert d not in dirs;dirs.add(d)
    pos,next_file,_=struct.unpack_from('<IHH',rom,fnt+(d-0xf000)*8);pos+=fnt
    while rom[pos]:
        tag=rom[pos];pos+=1;name=rom[pos:pos+(tag&127)].decode('ascii');pos+=tag&127
        if tag&128:
            child,=struct.unpack_from('<H',rom,pos);pos+=2;todo.append((child,path+name+'/'))
        else:files[path+name]=next_file;next_file+=1
assert files['ChildRom/JSS2Child.srl']==79
cs,ce=struct.unpack_from('<II',rom,fat+79*8);assert(cs,ce)==(0x23b800,0x4464c8)
layouts=json.loads((BASE/'arm7-checked-layouts.json').read_bytes())
expected_calls=[(0x037fd074,0x037fcf84),(0x037fd080,0x037fcf18),(0x037fd088,0x037fcf2c),(0x037fd094,0x037fcf04),(0x037fd09c,0x037fcf84),(0x037fd0a8,0x037fcf18),(0x037fd0b0,0x037fcf2c),(0x037fd0bc,0x037fcf04)]
raw=[]
for index,(program,rom_base,layout) in enumerate(zip((rom,rom[cs:ce]),(0,cs),layouts,strict=True)):
    assert sha(program)==layout['identity']['program_sha256']
    offset,entry,base,size=struct.unpack_from('<4I',program,0x30)
    assert[offset,entry,base,size]==[layout[k] for k in ('image_offset','entry','base','image_bytes')]
    assert sha(program[:0x4000])==layout['header_sha256']
    image=program[offset:offset+size];assert sha(image)==layout['image_sha256']
    params=image[layout['params_offset']:layout['params_offset']+20];assert sha(params)==layout['params_sha256']
    tb,te,ds,_,_=struct.unpack('<5I',params);table=image[tb-base:te-base];assert sha(table)==layout['table_sha256']
    cursor=ds-base;regions=[]
    for j in range(len(table)//12):
        runtime,initialized,bss=struct.unpack_from('<3I',table,j*12);r=layout['regions'][j+1]
        assert(runtime,bss)==(r['runtime_base'],r['bss_bytes']) and r['kind']=={'autoload':j}
        assert r['stored_extent']=={'start':cursor,'end':cursor+initialized}
        assert sha(image[cursor:cursor+initialized])==r['sha256']
        regions.append((runtime,initialized,bss,cursor));cursor+=initialized
    runtime,initialized,bss,stored=regions[0]
    def read(address,length):
        assert runtime<=address<address+length<=runtime+initialized
        location=stored+address-runtime
        return image[location:location+length],location
    selections=[];all_words={};raw_calls=[]
    for j,(a,b,pin,public_name) in enumerate([(0x037fd070,0x037fd0c0,'2682fcfd18c0bdc36ed6547ad546bef1d300ab2a3eea24c1e3c1a2ca7dde3f33','llvm-continuation.txt'),(0x037fd0c0,0x037fd0cc,'97e49fab5b2490c4b4977ff23d65446f267880f107a387035c5cf63b97d1d2ad','llvm-epilogue.txt')]):
        selected,location=read(a,b-a);assert sha(selected)==pin
        words=struct.unpack('<'+'I'*((b-a)//4),selected)
        assert all(w>>28==14 for w in words)
        all_words.update({a+4*k:w for k,w in enumerate(words)})
        for k,w in enumerate(words):
            if w&0x0f000000==0x0b000000:
                site=a+4*k;imm=struct.unpack('<i',struct.pack('<I',(w&0xffffff)<<8))[0]>>8
                raw_calls.append({'source':site,'signed_displacement':4*imm,'pc_bias':8,'target':site+8+4*imm,'return_continuation':site+4})
        argv=['/opt/homebrew/opt/llvm/bin/llvm-mc','--disassemble','--triple=armv4t-none-eabi']
        llvm=subprocess.run(argv,input=' '.join('0x%02x'%v for v in selected)+'\n',text=True,capture_output=True)
        assert llvm.returncode==0 and not llvm.stderr
        assert len([s for s in llvm.stdout.splitlines() if s.strip() and s.strip()!='.text'])==len(words)
        assert llvm.stdout.encode()==(PUBLIC/public_name).read_bytes()
        (OUT/('program-%d-span-%d-llvm.txt'%(index,j))).write_text(llvm.stdout)
        selections.append({'start':a,'end':b,'stored_image_offset':location,'original_rom_offset':rom_base+offset+location,'sha256':pin,'words':['0x%08x'%w for w in words],'llvm_stdout_sha256':sha(llvm.stdout.encode())})
    assert len(all_words)==23 and [(c['source'],c['target']) for c in raw_calls]==expected_calls
    for group_start,identifier in [(0x037fd070,7),(0x037fd098,8)]:
        assert [all_words[group_start+delta] for delta in(0,12,20,32)]==[0xe3a00000|identifier]*4
        assert all_words[group_start+8]==all_words[group_start+28]==0xe1a01000
    assert[all_words[a] for a in(0x037fd0c0,0x037fd0c4,0x037fd0c8)]==[0xe28dd004,0xe8bd4000,0xe12fff1e]
    literal,location=read(0x037fd0cc,4);assert struct.unpack('<I',literal)[0]==0x03808430
    assert runtime+initialized<=0x03808430<0x03808434<=runtime+initialized+bss
    raw.append({'identity':layout['identity'],'selections':selections,'raw_calls':raw_calls,'immediate_groups':[7,8],'excluded_literal':{'address':0x037fd0cc,'word':0x03808430,'sha256':sha(literal),'storage':'initialized autoload0 data','pointed_word':'autoload0 BSS only; contents not read'}})
(OUT/'independent-original-read.json').write_text(json.dumps({'status':'passed','fnt_directories':len(dirs),'fnt_files':len(files),'child_file_id':79,'child_rom_extent':[cs,ce],'programs':raw,'source_credit_bytes':0},indent=2)+'\n')
blob=(OUT/'reproduced/report.json').read_bytes()
assert len(blob)==924613 and sha(blob)=='06933defa677dcbc353c10face1c13e18afce46dfad3715c302bce233c1498ba'
full=json.loads(blob);summary=json.loads((PUBLIC/'graph-summary.json').read_bytes())
assert summary['report_sha256']==sha(blob)
for k,v in full.items():
    if k!='programs':assert summary[k]==v
assert full['source_bytes']==0 and full['inputs_unchanged'] is True
assert all(full[k] is False for k in('arm7_binary_baseline_complete','function_extents_established','executable_coverage_established','original_relocations_established'))
requests=json.loads((PUBLIC/'requests.json').read_bytes());previous=json.loads((BASE/'arm7-sdk-arena-proof/requests.json').read_bytes())
assert len((PUBLIC/'requests.json').read_bytes())==3897 and sha((PUBLIC/'requests.json').read_bytes())=='53ace3a3795712f684b2292c14a614ac946a29a7a38274cc38e5f7f26da56e5a'
graph_checks=[]
for p,c,req,prior in zip(full['programs'],summary['programs'],requests,previous,strict=True):
    assert req['program']==prior['program'] and req['roots']==prior['roots']
    assert req['selections'][:4]==prior['selections'][:4] and req['selections'][5:7]==prior['selections'][5:7]
    assert req['selections'][4]=={'region':{'autoload':0},'mode':'Arm','extent':{'start':0x037fd0c0,'end':0x037fd0cc}}
    assert req['selections'][7:]==[{'region':{'autoload':0},'mode':'Arm','extent':{'start':0x037fd070,'end':0x037fd0c0}}]
    extents=sorted((s['extent']['start'],s['extent']['end']) for s in req['selections']);assert all(b<=a for(_,b),(a,_)in zip(extents,extents[1:]))
    g=p['graph'];edges=g['edges'];root,=g['roots']
    assert p['identity']==g['program']==req['program']==c['identity']
    assert len(g['nodes'])==55 and len(edges)==70 and len(g['observations'])==8
    assert c['nodes']==[{'node':i,'mode':n['mode'],**n['instruction']} for i,n in enumerate(g['nodes'])]
    assert all(n['instruction']['address']!=0x037fd0cc and not n['mode_conflict'] and n['identity']['program']==req['program'] for n in g['nodes'])
    assert c['root']==root and set(root['visited_nodes'])==set(range(55)) and root['edge_examinations']==70 and len(root['frontiers'])==11
    assert c['counts']=={'observations':8,'nodes':55,'edges':70,'visited_nodes':55,'edge_examinations':70,'selected_edges':59,'frontier_edges':11,'unknown_target_edges':3,'mode_conflicts':0}
    for i,(e,ce) in enumerate(zip(edges,c['edges'],strict=True)):
        o=e['original'];t=o['target']
        if t['kind']=='address':
            assert t['mapping']['identity']['program']==req['program'] and t['mapping']['kind']=='initialized' and t['mode']=='Arm'
            ct={'address':t['address'],'mode':t['mode'],'mapping':'initialized autoload0 in this exact program','observation_boundary':t['boundary']}
        else:assert t=={'kind':'unknown'};ct=t
        assert ce=={'edge':i,'source_node':e['source_node'],'condition':e['source_condition'],'source':o['source'],'kind':o['kind'],'guard':o['guard'],'target':ct,'resolution':e['resolution']}
    for source,target in expected_calls:
        call,=[e for e in edges if e['original']['source']==source and e['original']['kind']=='call']
        continuation,=[e for e in edges if e['original']['source']==source and e['original']['kind']=='call_continuation']
        assert call['original']['target']['address']==target and call['original']['guard']=='always'
        assert call['resolution']['kind']==('frontier' if target in(0x037fcf84,0x037fcf2c) else'selected')
        assert continuation['original']['target']['address']==source+4 and continuation['original']['guard']=='call_returned' and continuation['resolution']['kind']=='selected'
    unknown=[e for e in edges if e['original']['target']['kind']=='unknown']
    assert sorted(e['original']['source'] for e in unknown)==[0x037fcf14,0x037fcf28,0x037fd0c8]
    assert all(e['resolution']=={'kind':'frontier','reason':'indirect'} for e in unknown)
    ne=[e for e in edges if e['original']['source']==0x037fd040]
    assert len(ne)==2 and all(e['source_condition']=='ne' for e in ne)
    assert{e['original']['guard']:e['original']['target']['address'] for e in ne}=={'condition_passed':0x037fd0c0,'condition_failed':0x037fd044}
    witnesses=[]
    for w,cw in zip(p['witnesses'][0],c['frontier_witnesses'],strict=True):
        assert cw['reason']==w['reason'] and[edges[i]['original']for i in cw['edges']]==w['transfers']
        path=w['transfers'];assert path[0]['source']==root['address'] and all(a['target'].get('address')==b['source'] for a,b in zip(path,path[1:]))
        assert edges[cw['edges'][-1]]['resolution']['kind']=='frontier'
        witnesses.append({'edges':cw['edges'],'reason':cw['reason'],'guards':[t['guard'] for t in path]})
    graph_checks.append({'identity':req['program'],'counts':c['counts'],'frontier_witnesses':witnesses,'unknown_exchanges_unresolved':True,'excluded_literal_is_not_a_node':True})
before=json.loads((OUT/'input-snapshot-before.json').read_bytes());after={n:sha(Path(n).read_bytes())for n in before};assert after==before
(OUT/'input-snapshot-after.json').write_text(json.dumps(after,indent=2)+'\n')
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=REPO,text=True).strip()==COMMIT
names=subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r',COMMIT],cwd=REPO,text=True).splitlines();assert len(names)==12
hashes={}
for name in names:
    assert name.startswith('decomp/matching-notes/other-cpus/arm7-arena-caller-tail')
    committed=subprocess.check_output(['git','show',COMMIT+':'+name],cwd=REPO);assert(REPO/name).read_bytes()==committed;hashes[name]=sha(committed)
receipt={'status':'accepted','findings':[],'reviewed_commit':COMMIT,'public_git_blobs_sha256':hashes,'independent_original_read_sha256':sha((OUT/'independent-original-read.json').read_bytes()),'full_report_sha256':sha(blob),'full_report_bytes':len(blob),'request_sha256':full['request_sidecar_sha256'],'graphs':graph_checks,'inputs_unchanged':True,'before_snapshot_sha256':sha((OUT/'input-snapshot-before.json').read_bytes()),'after_snapshot_sha256':sha((OUT/'input-snapshot-after.json').read_bytes()),'executable_sha256':{n:h for n,h in before.items()if n.endswith('arm7_reachable_probe')or n.endswith('llvm-mc')},'packaged_replay_exact_outputs':True,'source_credit_bytes':0,'canonical_update':False,'T10_complete':False,'scope_review':'Only explicit80-byte continuation and12-byte replacement epilogue. Eight raw BLs and explicit immediate7/8 grouping corroborate previously reviewed donor ordering; no getter bodies selected. Calls retain guarded return continuations; epilogue/setter BX remain indirect unknown frontiers. Literal d0cc remains separately read initialized data. No names/types/ABI/extent/SDK identity/runtime/relocation/source promotion; canonical304/T10 unchanged.','independent_script_sha256':sha(Path(__file__).read_bytes()),'independent_llvm_logs_sha256':{p.name:sha(p.read_bytes())for p in OUT.glob('program-*-span-*-llvm.txt')}}
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Accepted, no findings: independent original23words/eightBLs/IDs7-8, guarded55-node70-edge graph, full packaged replay and12 frozen Git blobs agree.')
