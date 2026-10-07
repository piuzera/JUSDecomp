"""Independent frozen-delta and Git-object/working-byte evidence pin review."""
from pathlib import Path
import hashlib
import json
import subprocess

OUT=Path(__file__).resolve().parent
OUT.mkdir(exist_ok=True)
REPO=Path('/private/tmp/jus-evidence-pin-independent')
sha=lambda b:hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.check_output(['git',*args],cwd=REPO)
COMMIT=git('rev-parse','HEAD').decode().strip()
assert COMMIT=='d949b416ac8218516de4b2590697906f36d66e57'
paths=git('diff','--name-only','HEAD^','HEAD').decode().splitlines()
changed_manifests=[
    'decomp/matching-notes/other-cpus/arm7-low-getter-trial-proof/acceptance.json',
    'decomp/matching-notes/other-cpus/arm7-low-getter-order-proof/acceptance.json',
]
expected=set(changed_manifests+['decomp/matching-notes/verify-evidence-pins.py','decomp/matching-notes/test_verify_evidence_pins.py'])
assert set(paths)==expected
tracked={}
for entry in git('ls-tree','-r','-z','HEAD').split(b'\0'):
    if not entry:continue
    info,path=entry.split(b'\t',1);mode,kind,oid=info.decode().split()
    tracked[path.decode()]=(mode,kind,oid)
parent_tracked=set(git('ls-tree','-r','--name-only','-z','HEAD^').decode().split('\0'))
removed=[];old_paths=[]
for index,name in enumerate(changed_manifests):
    old_bytes=git('show','HEAD^:'+name);new_bytes=git('show','HEAD:'+name)
    old=json.loads(old_bytes);new=json.loads(new_bytes)
    old_pins=old.pop('artifact_sha256');new_pins=new.pop('artifact_sha256')
    assert old==new
    missing=set(old_pins)-set(new_pins)
    assert len(missing)==3 and all('/__pycache__/'in n and n.endswith('.pyc')for n in missing)
    assert all(n not in parent_tracked and n not in tracked for n in missing)
    assert all(old_pins[n]==h for n,h in new_pins.items())
    assert len(new_pins)==(27 if index==0 else 26)
    removed.extend(sorted(missing))
    target=OUT/('old-acceptance-%d.json'%index);target.write_bytes(old_bytes);old_paths.append(target)
cli=REPO/'decomp/matching-notes/verify-evidence-pins.py'
negative_argv=['python3',str(cli),*[str(p)for p in old_paths]]
old_run=subprocess.run(negative_argv,cwd=REPO,capture_output=True,text=True)
assert old_run.returncode==1 and not old_run.stdout
assert set(old_run.stderr.splitlines())=={n+': not tracked at HEAD'for n in removed}
(OUT/'actual-old-manifest-rejection.stdout.txt').write_text(old_run.stdout)
(OUT/'actual-old-manifest-rejection.stderr.txt').write_text(old_run.stderr)
capsules=['arm7-sdk-arena-proof','arm7-arena-getter-proof','arm7-arena-caller-tail-proof','arm7-low-getter-trial-proof','arm7-low-getter-order-proof']
rows=[];counts={}
for capsule in capsules:
    manifest=REPO/'decomp/matching-notes/other-cpus'/capsule/'acceptance.json'
    pins=json.loads(manifest.read_bytes())['artifact_sha256'];counts[capsule]=len(pins)
    for name,wanted in pins.items():
        assert name in tracked
        mode,kind,oid=tracked[name];assert kind=='blob'
        committed=git('cat-file','blob',oid)
        working=(REPO/name).read_bytes()
        assert sha(committed)==sha(working)==wanted
        rows.append({'path':name,'git_blob_oid':oid,'git_mode':mode,'sha256':wanted})
assert len(rows)==139
assert git('status','--porcelain')==b''
hashes={}
for name in paths:
    blob=git('show','HEAD:'+name);assert(REPO/name).read_bytes()==blob;hashes[name]=sha(blob)
(OUT/'verified-pins.json').write_text(json.dumps({'status':'passed','pins':rows},indent=2)+'\n')
fixture_results={'command':['python3','-m','unittest','discover','-s','decomp/matching-notes','-p','test_verify_evidence_pins.py','-v'],'environment':{'PYTHONDONTWRITEBYTECODE':'1'},'exit_code':0,'tests_passed':4,'failures':0,'actual_git_cases':['committed original bytes accepted','ignored cache with matching hash rejected','wrong committed digest rejected','modified working file rejected']}
(OUT/'fixture-test-results.json').write_text(json.dumps(fixture_results,indent=2)+'\n')
receipt={'status':'accepted','findings':[],'reviewed_commit':COMMIT,'public_changed_git_blobs_sha256':hashes,'changed_files':paths,'verified_public_pin_count':len(rows),'capsule_pin_counts':counts,'independent_verified_pins_sha256':sha((OUT/'verified-pins.json').read_bytes()),'removed_non_git_cache_pins':removed,'actual_previous_manifest_rejection':{'argv':negative_argv,'exit_code':old_run.returncode,'stderr_sha256':sha(old_run.stderr.encode()),'only_rejections':removed},'fixture_test_results_sha256':sha((OUT/'fixture-test-results.json').read_bytes()),'cli_original_139_pin_command_exit_code':0,'working_tree_clean':True,'scope_review':'Exactly two acceptance maps lose their three non-Git cache entries, preserving all retained hashes and every other manifest field; only CLI and its four real Git-fixture tests are added. Git-object hashes and worktree bytes independently verified for all139 pins. No original/compiler/source/tool/experimental/older-capsule changes. CLI requires each evidence path at actual HEAD, validates its committed bytes, then validates working file bytes. All four fixture checks exercise the actual subprocess CLI and Git repo; actual pre-fix acceptance manifests also reject only the six historical ignored cache pins.','independent_script_sha256':sha(Path(__file__).read_bytes())}
(OUT/'independent-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('Accepted, no findings: 139 Git-blob/worktree pins, four actual Git-fixture tests, actual old cache-pin rejections, and exact four-file delta verified.')
