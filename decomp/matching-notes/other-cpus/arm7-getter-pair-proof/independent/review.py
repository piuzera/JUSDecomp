"""Bind frozen .30 public pair proof to fresh replay and independent LLD link."""
import hashlib
import json
import subprocess
from pathlib import Path

REPO=Path('/private/tmp/jus-arm7-getter-pair-independent')
OUT=Path('/private/tmp/jus-arm7-getter-pair-independent-proof')
PACKAGE=REPO/'decomp/matching-notes/other-cpus/arm7-getter-pair-proof'
FRESH=OUT/'public-replay-01'
OWN=OUT/'native-01'
COMMIT='4c087a58bc00120ec56ee8769d8c38f1c5cbb2c9'
BASE='574c01f63a7e7b69740159886ceeb01e914a5441'
sha=lambda data:hashlib.sha256(data).hexdigest()
def git(*args):return subprocess.check_output(['git',*args],cwd=REPO)

assert git('rev-parse',f'{COMMIT}^{{tree}}').strip()==git('rev-parse','HEAD^{tree}').strip()
changed=git('diff','--name-only',BASE,COMMIT).decode().splitlines()
assert len(changed)==25 and all('arm7-getter-pair' in name for name in changed)
closure=[]
for name in changed:
    data=(REPO/name).read_bytes();blob=git('rev-parse',f'{COMMIT}:{name}').decode().strip()
    assert git('cat-file','blob',blob)==data and not data.startswith(b'\x7fELF')
    closure.append({'path':name,'bytes':len(data),'git_blob':blob,'sha256':sha(data)})
manifest=PACKAGE/'evidence-pins.json'
pins=json.loads(manifest.read_text())['artifact_sha256']
assert len(pins)==24
assert set(pins)==set(changed)-{'decomp/matching-notes/other-cpus/arm7-getter-pair-proof/evidence-pins.json'}
for name,digest in pins.items():assert sha((REPO/name).read_bytes())==digest

for role,source,expected in (
    ('low','low_getter_trial.c','fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537'),
    ('high','high_getter_trial.c','342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e')):
    data=(PACKAGE/source).read_bytes()
    assert data==(OUT/source).read_bytes() and data==(FRESH/source).read_bytes()
    assert sha(data)==expected
assert (PACKAGE/'checked-layouts.json').read_bytes()==(OUT/'arm7-checked-layouts.json').read_bytes()
assert sha((PACKAGE/'checked-layouts.json').read_bytes())=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'

published=json.loads((PACKAGE/'trial-proof.json').read_text())
fresh=json.loads((FRESH/'trial-proof.json').read_text())
differences=[]
def compare(a,b,path='$'):
    assert type(a) is type(b),path
    if isinstance(a,dict):
        assert a.keys()==b.keys(),path
        for k in a:compare(a[k],b[k],path+'.'+k)
    elif isinstance(a,list):
        assert len(a)==len(b),path
        for i,(left,right) in enumerate(zip(a,b)):compare(left,right,f'{path}[{i}]')
    elif a!=b:differences.append(path)
compare(published,fresh)
assert set(differences)=={'$.getters[0].compile_command.argv[9]','$.getters[0].compile_command.argv[11]',
                          '$.getters[1].compile_command.argv[9]','$.getters[1].compile_command.argv[11]'}
assert fresh['status']==published['status'] and fresh['source_credit_bytes']==0
assert fresh['original_names_types_ABI_extent_version_ownership_established'] is False

object_hashes={'low':'9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b',
               'high':'b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1'}
elf_sha='6298ed9bc7214942ac6fbf6fefedf26c5dafd65a7806c53f14e75083783597c8'
image_sha='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
for role,digest in object_hashes.items():
    assert sha((FRESH/f'{role}.o').read_bytes())==sha((OUT/f'{role}.o').read_bytes())==digest
own=json.loads((OWN/'result.json').read_text())
assert len(fresh['programs'])==len(own['programs'])==2
for i,(public,independent) in enumerate(zip(fresh['programs'],own['programs'])):
    assert sha((FRESH/f'native/program-{i}/positive.elf').read_bytes())==sha((OWN/f'program-{i}/positive.elf').read_bytes())==elf_sha
    positive=public['positive'];wrong=public['wrong_shared_wram']
    assert positive['image_sha256']==independent['positive']['image_sha256']==image_sha
    assert positive['image_bytes']==165552 and len(positive['segments'])==6 and positive['BSS_bytes']==21424
    assert positive['image_mismatch_offsets']==[] and positive['linked_relocation_sections']==0
    assert positive['observed_bindings']=={'subpriv':0x027f9c08,'wram':0x0380bc90,'irq':0x400,'system':0x400}
    assert [(g['role'],g['map_vma'],g['map_bytes'],g['actual_input_sha256']) for g in positive['getters']]==[
        ('low',0x037fcf2c,88,object_hashes['low']),('high',0x037fcf84,128,object_hashes['high'])]
    assert [g['stored_image_offset'] for g in positive['getters']]==[20700,20788]
    assert wrong['image_mismatch_offsets']==independent['wrong_shared_WRAM']['mismatch_offsets']==[20784,20908]
    assert wrong['observed_bindings']=={'subpriv':0x027f9c08,'wram':0x0380bc94,'irq':0x400,'system':0x400}
    assert public['omitted_low']['returncode']!=0 and independent['omitted_high_rejected']
    assert public['swapped_roles']['returncode']!=0 and independent['swapped_roles_rejected']
    assert public['malformed_load']['rejected'] and independent['malformed_load_rejected']

for name in ('pair.py','reproduce.py'):
    script=(PACKAGE/name).read_text()
    assert 'jus-arm7-reachable-root-proof' not in script and 'jus-arm7-getter-pair-trial-worker-proof' not in script
receipt={'status':'accepted_no_flags','reviewed_commit':COMMIT,
    'reviewed_tree':git('rev-parse',f'{COMMIT}^{{tree}}').decode().strip(),
    'base_commit':BASE,'git_blob_closure':closure,
    'evidence_manifest_sha256':sha(manifest.read_bytes()),'git_owned_pins_verified':len(pins),
    'low_object_sha256':object_hashes['low'],'high_object_sha256':object_hashes['high'],
    'positive_elf_sha256_both_programs':elf_sha,'full_image_sha256_both_programs':image_sha,
    'image_bytes':165552,'load_segments':6,'BSS_bytes':21424,
    'five_actual_ABS32_relocations_across_four_bindings':True,
    'shared_WRAM_wrong_binding_stored_offsets':[20784,20908],
    'public_omitted_low_rejected':True,'independent_omitted_high_rejected':True,
    'swapped_roles_and_malformed_load_rejected':True,
    'fresh_public_receipt_differences_only_compiler_input_output_paths':sorted(differences),
    'public_replay':'passed from package-owned C, contract, layout and pinned ROM/tools; no private baseline inputs',
    'four_tests':'passed from public package',
    'independent_pair_script_sha256':sha((OUT/'pair.py').read_bytes()),
    'independent_pair_result_sha256':sha((OWN/'result.json').read_bytes()),
    'original_names_types_ABI_extent_ownership_proven':False,
    'source_credit_bytes':0,'canonical_bytes':304,'T10_open':True}
path=OUT/'final-independent-review.json';path.write_text(json.dumps(receipt,indent=2)+'\n')
print(f'ACCEPTED {COMMIT}; tree {receipt["reviewed_tree"]}')
print(f'Git closure {len(closure)} files, manifest {len(pins)} pins; four tests pass')
print(f'Both direct ELFs {elf_sha}; full original image {image_sha}; shared WRAM offsets 20784,20908')
print(f'Receipt {len(path.read_bytes())} bytes SHA256 {sha(path.read_bytes())}')
