import copy
import hashlib
import importlib.util
import json
import pathlib
import subprocess

ROOT=pathlib.Path('/private/tmp/jus-arm7-low-store-independent')
SCRATCH=pathlib.Path('/private/tmp/jus-arm7-low-store-independent-proof')
PROOF=ROOT/'decomp/matching-notes/other-cpus/arm7-low-store-trial-proof'
PUB=json.loads((PROOF/'trial-proof.json').read_text())
FRESH=json.loads((SCRATCH/'public-replay/trial-proof.json').read_text())
OWN=json.loads((SCRATCH/'native-01/result.json').read_text())
sha=lambda b:hashlib.sha256(b).hexdigest()
run=lambda *args:subprocess.run(args,cwd=ROOT,check=True,capture_output=True,text=True).stdout.strip()
assert run('git','rev-parse','HEAD')=='dbdcfa9a4e6c046342ee1d66537e1fe407daeaea'
assert run('git','status','--porcelain')==''
added=run('git','diff','--name-only','6813a227bd7bcebbaee2388776cad698deb74fab','HEAD').splitlines()
assert len(added)==20 and all(p.startswith('decomp/matching-notes/other-cpus/arm7-low-store-trial') for p in added)
assert run('git','diff','--diff-filter=A','--name-only','6813a227bd7bcebbaee2388776cad698deb74fab','HEAD').splitlines()==added
for path in added:
    assert sha((ROOT/path).read_bytes())==sha(subprocess.run(['git','show','HEAD:'+path],cwd=ROOT,check=True,capture_output=True).stdout)
assert sha((PROOF/'low_store_trial.c').read_bytes())=='1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362'
assert sha((PROOF/'checked-layouts.json').read_bytes())=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
assert PUB['status']==FRESH['status']=='actual_lower_store_native_exact_original_images'
p=copy.deepcopy(PUB); f=copy.deepcopy(FRESH)
for x in (p,f):
    argv=x['compile_command']['argv']
    argv[9]=pathlib.Path(argv[9]).name
    argv[11]=pathlib.Path(argv[11]).name
assert p==f
assert FRESH['elf']['object_sha256']=='b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7'
assert FRESH['elf']['text_sha256']=='b1f95073bcc84916809b86a81bc8d2b6246515a3c4646a1f9ac171214a389488'
assert FRESH['elf']['instruction_bytes']==20 and FRESH['elf']['pool_bytes']==0 and FRESH['elf']['relocations']==[]
assert len(FRESH['programs'])==len(OWN['programs'])==2
spec=importlib.util.spec_from_file_location('own_native',SCRATCH/'native.py')
mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
metadata=[]
for i,(public,own) in enumerate(zip(FRESH['programs'],OWN['programs'])):
    assert public['identity']==own['identity']
    pos=public['positive'];ownpos=own['positive']
    assert pos['linked_elf_sha256']=='2f67289e8e24014bfd32a0e06fa91d5334553cd1124b21b269756eaf42e13bb9'
    assert ownpos['elf_sha256']=='6d056704dd5ae9cda37c630a936d1c467bfc85dfca1df59c649960c7819d222d'
    assert pos['image_sha256']==ownpos['image_sha256']=='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
    assert pos['image_bytes']==ownpos['image_bytes']==165552 and pos['BSS_bytes']==ownpos['BSS_bytes']==21424
    assert pos['map_vma']==0x037fcf04 and pos['map_bytes']==20 and pos['noncandidate_bytes_unchanged']
    assert public['omitted_object']['returncode'] and public['wrong_placement']['returncode'] and public['malformed_load']['rejected']
    assert own['omitted_object_rejected'] and own['wrong_placement_rejected'] and own['malformed_load_rejected']
    pubelf=SCRATCH/f'public-replay/native/program-{i}/positive.elf'
    ownelf=SCRATCH/f'native-01/program-{i}/positive.elf'
    a,asec,asym,aseg=mod.parse_elf(pubelf.read_bytes())
    b,bsec,bsym,bseg=mod.parse_elf(ownelf.read_bytes())
    assert a==b and aseg==bseg
    allocated=lambda sec,data:[(s['name'],s['vma'],s['size'],s['flags'],sha(data[s['offset']:s['offset']+s['size']]) if s['type']==1 else None) for s in sec if s['flags']&2 and s['size']]
    assert allocated(asec,pubelf.read_bytes())==allocated(bsec,ownelf.read_bytes())
    am={s['name']:s['value'] for s in asym};bm={s['name']:s['value'] for s in bsym}
    assert am['__candidate_start']==bm['__store_start']==0x037fcf04
    assert am['__candidate_end']==bm['__store_end']==0x037fcf18
    assert len(pubelf.read_bytes())-len(ownelf.read_bytes())==8
    metadata.append({'program':i,'public_elf_sha256':sha(pubelf.read_bytes()),'independent_elf_sha256':sha(ownelf.read_bytes()),'metadata_difference':'public __candidate_start/end versus independent __store_start/end; allocated sections, segment records, entry, flags, linked image equal'})
receipt={'status':'accepted_no_flags','public_worker_commit':'b83f95736b2058f0e9bf5b50a005f08381d3156d','independent_cherry_commit':run('git','rev-parse','HEAD'),'new_git_blobs':len(added),'git_head_pins':19,'public_replay_receipt_sha256':sha((SCRATCH/'public-replay/trial-proof.json').read_bytes()),'public_published_receipt_sha256':sha((PROOF/'trial-proof.json').read_bytes()),'independent_native_receipt_sha256':sha((SCRATCH/'native-01/result.json').read_bytes()),'object_sha256':FRESH['elf']['object_sha256'],'original_code_sha256':FRESH['elf']['text_sha256'],'programs':metadata,'scope':'finite C/materialization and direct native proof only; source credit zero; original ABI, name, extent, ownership unresolved'}
(SCRATCH/'final-review.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
