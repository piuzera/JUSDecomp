"""Bind actual Git blobs and compact public evidence to independent readback."""
from pathlib import Path
import hashlib
import json
import subprocess

OUT=Path(__file__).resolve().parent
REPO=Path('/private/tmp/jus-arm7-branch-grounding')
BASE=REPO/'decomp/matching-notes/other-cpus'
PUBLIC=BASE/'arm7-branch-literal-proof'
COMMIT='d509e30f334f92f3fccb51d428c6c9c79b0e2c36'
sha=lambda b:hashlib.sha256(b).hexdigest()
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=REPO,text=True).strip()==COMMIT
names=subprocess.check_output(['git','diff-tree','--no-commit-id','--name-only','-r',COMMIT],cwd=REPO,text=True).splitlines()
assert len(names)==10
assert all(n.startswith('decomp/matching-notes/other-cpus/arm7-branch-literal-') for n in names)
public_hashes={}
for name in names:
    blob=subprocess.check_output(['git','show',COMMIT+':'+name],cwd=REPO)
    assert (REPO/name).read_bytes()==blob
    public_hashes[name]=sha(blob)
assert (PUBLIC/'requests.json').read_bytes()==(OUT/'requests.json').read_bytes()
full=json.loads((OUT/'report.json').read_bytes())
summary=json.loads((PUBLIC/'graph-summary.json').read_bytes())
assert summary['report_sha256']==sha((OUT/'report.json').read_bytes())
assert len((OUT/'report.json').read_bytes())==370581
for k,v in full.items():
    if k!='programs': assert summary[k]==v
for p,c in zip(full['programs'],summary['programs'],strict=True):
    g=p['graph'];edges=g['edges']
    assert p['identity']==c['identity'] and g['scope']==c['scope']
    assert c['nodes']==[{'node':i,'mode':n['mode'],'mode_conflict':n['mode_conflict'],**n['instruction']} for i,n in enumerate(g['nodes'])]
    assert c['root']==g['roots'][0]
    assert c['observations']==[{'selection':o['selection'],'executability':o['executability'],'instruction_count':len(o['instructions']),'transfer_count':len(o['transfers'])} for o in g['observations']]
    assert c['counts']=={'observations':5,'nodes':21,'edges':27,'visited_nodes':21,'edge_examinations':27,'selected_edges':20,'frontier_edges':7,'unknown_target_edges':0,'mode_conflicts':0}
    for i,(edge,compact) in enumerate(zip(edges,c['edges'],strict=True)):
        original=edge['original'];target=original['target']
        assert compact=={'edge':i,'source_node':edge['source_node'],'source_condition':edge['source_condition'],'source':original['source'],'kind':original['kind'],'guard':original['guard'],'target':target['address'],'target_mode':target['mode'],'observation_boundary':target['boundary'],'mapping':'initialized autoload0 in this exact program','resolution':edge['resolution']}
    for w,cw in zip(p['witnesses'][0],c['frontier_witnesses'],strict=True):
        assert cw['reason']==w['reason']
        assert [edges[i]['original'] for i in cw['edges']]==w['transfers']
raw=json.loads((OUT/'independent-receipt.json').read_bytes())
original=json.loads((PUBLIC/'original-read.json').read_bytes())
assert original['status']=='passed' and original['inputs_unchanged'] is True
assert original['child_file_id']==79 and original['child_rom_extent']=={'start':0x23b800,'end':0x4464c8}
for public, independent in zip(original['programs'],raw['programs'],strict=True):
    assert public['identity']==independent['identity']
    assert public['header']['image_offset']==independent['arm7_image_offset']
    for mapping,(runtime,initialized,bss,stored) in zip(public['autoload_mappings'],independent['autoloads'],strict=True):
        assert mapping['stored_start']==stored
        assert mapping['initialized']=={'start':runtime,'end':runtime+initialized}
        assert mapping['bss']=={'start':runtime+initialized,'end':runtime+initialized+bss}
    for s,ours in zip(public['selections'],independent['spans'],strict=True):
        assert all(s[k]==ours[k] for k in ('start','end','sha256','words','original_rom_offset'))
        assert s['stored_image_offset']==ours['stored_offset']
        assert [(x['source'],x['target'],x['continuation']) for x in s['raw_calls']]==[(x['source'],x['target'],x['return_continuation']) for x in ours['calls']]
    literal=public['literal'];ours=independent['literal']
    assert all(literal[k]==ours[k] for k in ('address','word','sha256'))
    assert literal['pointed_word_mapping']=='bss' and literal['pointed_region']=={'autoload':0}
    assert literal['pointed_bss_offset']==0x1e8
    assert literal['pointed_original_stored_bytes'] is False and literal['pointed_memory_read'] is False
assert (PUBLIC/'llvm-condition-failed.txt').read_bytes()==(OUT/'llvm-program-0-span-0.txt').read_bytes()==(OUT/'llvm-program-1-span-0.txt').read_bytes()
assert (PUBLIC/'llvm-condition-passed.txt').read_bytes()==(OUT/'llvm-program-0-span-1.txt').read_bytes()==(OUT/'llvm-program-1-span-1.txt').read_bytes()
commands=json.loads((PUBLIC/'commands.json').read_bytes())
assert len(commands)==1 and len(commands[0])==7
assert commands[0][0]==raw['probe_argv'][0] and commands[0][1]==raw['probe_argv'][1]
assert commands[0][3]==raw['layout_sha256'] and commands[0][5]==raw['request_sha256'] and commands[0][6]==raw['producer_sha256']
replay=OUT/'public-script-replay'
replay.mkdir(exist_ok=True)
(replay/'requests.json').write_bytes((OUT/'requests.json').read_bytes())
(replay/'report.json').write_bytes((OUT/'report.json').read_bytes())
replay_logs=[]
for name in ('read_original.py','summarize_report.py'):
    argv=['python3',str(PUBLIC/name),str(replay)]
    run=subprocess.run(argv,capture_output=True)
    assert run.returncode==0 and not run.stderr
    (OUT/(name+'.stdout.txt')).write_bytes(run.stdout)
    replay_logs.append({'argv':argv,'exit_code':0,'stdout_sha256':sha(run.stdout),'stderr':''})
for name in ('original-read.json','graph-summary.json','llvm-condition-failed.txt','llvm-condition-passed.txt'):
    assert (replay/name).read_bytes()==(PUBLIC/name).read_bytes(),name
raw['status']='accepted'
raw['findings']=[]
raw['reviewed_commit']=COMMIT
raw['public_git_blobs_sha256']=public_hashes
raw['public_compact_summary_matches_independent_full_report']=True
raw['public_scripts_reproduce_exact_committed_outputs']=True
raw['public_script_replay']=replay_logs
raw['guard_witnesses_sha256']=sha((OUT/'witness-checks.json').read_bytes())
raw['independent_scripts_sha256']={n:sha((OUT/n).read_bytes()) for n in ('verify_branch.py','check_witnesses.py','check_public.py')}
raw['independent_llvm_stdout_sha256']={p.name:sha(p.read_bytes()) for p in OUT.glob('llvm-program-*-span-*.txt')}
raw['scope_review']='Only two explicit ARM selections and one raw initialized literal were added. Literal points into original autoload0 BSS with no original stored contents. All call/condition witnesses remain assumptions; d0c8 remains undecoded frontier. No runtime value, branch feasibility, function extent, executability, relocation, source credit, or T10 completion established.'
(OUT/'independent-receipt.json').write_text(json.dumps(raw,indent=2)+'\n')
print('Accepted, no findings: all ten actual Git blobs, public evidence, and reproduction scripts agree with independent original-ROM and frozen-probe checks.')
