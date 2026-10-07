"""Bind frozen .29 public evidence to independent high getter and native reads."""
import hashlib
import json
import struct
import subprocess
from pathlib import Path

REPO = Path('/private/tmp/jus-arm7-high-getter-independent')
OUT = Path('/private/tmp/jus-arm7-high-getter-independent-proof')
PACKAGE = REPO / 'decomp/matching-notes/other-cpus/arm7-high-getter-trial-proof'
REPLAY = OUT / 'public-replay-01'
INDEPENDENT = OUT / 'native-01'
COMMIT = 'ad263cf56a7e8c18a587c38886063b047d7017c5'
BASE = '6a39bceb7893e1a2cf0a57359797a13fd094cace'
sha = lambda data: hashlib.sha256(data).hexdigest()

def git(*args):
    return subprocess.check_output(['git', *args], cwd=REPO)

assert git('rev-parse',f'{COMMIT}^{{tree}}').strip() == git('rev-parse','HEAD^{tree}').strip()
changed = git('diff','--name-only',BASE,COMMIT).decode().splitlines()
assert len(changed) == 35
assert all('arm7-high-getter-trial' in name for name in changed)
closure=[]
for name in changed:
    data=(REPO/name).read_bytes()
    blob=git('rev-parse',f'{COMMIT}:{name}').decode().strip()
    assert git('cat-file','blob',blob) == data
    assert not data.startswith(b'\x7fELF')
    closure.append({'path':name,'bytes':len(data),'git_blob':blob,'sha256':sha(data)})
manifest=PACKAGE/'evidence-pins.json'
pins=json.loads(manifest.read_text())['artifact_sha256']
assert len(pins)==34
assert set(pins)==set(changed)-{'decomp/matching-notes/other-cpus/arm7-high-getter-trial-proof/evidence-pins.json'}
for name,digest in pins.items():
    assert sha((REPO/name).read_bytes()) == digest

source=(PACKAGE/'high_getter_trial.c').read_bytes()
assert source==(OUT/'high_getter_trial.c').read_bytes()
assert sha(source)=='342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e'
raw=json.loads((OUT/'high-original.json').read_text())
published_manifest=json.loads((PACKAGE/'original-manifest.json').read_text())
windows=[w for w in published_manifest['instruction_windows']]
literals=[w for w in published_manifest['literal_words']]
assert len(windows)==5 and len(literals)==5
assert [w['start'] for w in windows]==[0x037fcf84,0x037fcfa0,0x037fcfa8,0x037fcfb0,0x037fcfe8]
assert [w['address'] for w in literals]==[0x037fcff0,0x037fcff4,0x037fcff8,0x037fcffc,0x037fd000]
for program in raw['programs']:
    code=[word for w in windows for word in w['words']]
    pool=[w['word'] for w in literals]
    assert code==program['code_words'] and pool==program['pool_words']
assert raw['programs'][0]['whole_sha256']==raw['programs'][1]['whole_sha256']=='13b9cdc287f94094ed89582210e0c8d008ca9395b768c3f3fec183882af88fa4'
for name in ('original-read.json','llvm-original-high-getter.txt','compiled-llvm.txt',
             'elf-readback.txt','experiment-stdout.log','experiment-stderr.log'):
    assert (PACKAGE/name).read_bytes()==(REPLAY/name).read_bytes(),name

object_sha='b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1'
elf_sha='d90a255d1193d31f0c4b322250e2b4de85608dbf59b855975a25ad499332c059'
image_sha='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
assert sha((OUT/'compiled.o').read_bytes())==sha((REPLAY/'compiled.o').read_bytes())==object_sha
public_native=json.loads((REPLAY/'native/native-proof.json').read_text())
published_native=json.loads((PACKAGE/'native-proof.json').read_text())
independent_native=json.loads((INDEPENDENT/'result.json').read_text())
assert len(public_native['programs'])==len(published_native['programs'])==len(independent_native['native_results'])==2
for index,(fresh,published,independent) in enumerate(zip(public_native['programs'],published_native['programs'],independent_native['native_results'])):
    assert sha((REPLAY/f'native/program-{index}/positive.elf').read_bytes())==sha((INDEPENDENT/f'program-{index}/positive/linked.elf').read_bytes())==elf_sha
    for record in (fresh,published):
        positive=record['positive']['readback']
        assert positive['image_sha256']==image_sha and positive['image_bytes']==165552
        assert positive['BSS_bytes']==21424 and len(positive['segments'])==6
        assert positive['image_mismatch_offsets']==[] and positive['linked_relocation_sections']==0
        assert record['wrong_binding']['image_mismatch_offsets']==[20901]
        assert record['malformed_load_offset_rejected']
    assert independent['exact']['image_sha256']==image_sha
    assert independent['wrong_binding_differences']==[20908]
    assert independent['malformed_segment_rejected']

trial=json.loads((REPLAY/'trial-proof.json').read_text())
assert trial['comparison']['exact_128_bytes_both_programs']
assert trial['comparison']['instruction_mismatch_offsets']==[]
assert trial['elf']['object_sha256']==object_sha and trial['source_credit_bytes']==0
assert trial['original_names_types_ABI_extent_version_ownership_established'] is False
for name in ('native.py','reproduce.py','read_original.py'):
    script=(PACKAGE/name).read_text()
    assert 'jus-arm7-reachable-root-proof' not in script and 'jus-arm7-high-getter-trial-worker-proof' not in script

receipt={'status':'accepted_no_flags','reviewed_commit':COMMIT,
    'reviewed_tree':git('rev-parse',f'{COMMIT}^{{tree}}').decode().strip(),
    'base_commit':BASE,'git_blob_closure':closure,
    'public_manifest_sha256':sha(manifest.read_bytes()),'git_owned_pins_verified':len(pins),
    'frozen_source_sha256':sha(source),'actual_object_sha256':object_sha,
    'fixed_code_bytes':108,'literal_pool_bytes':20,'actual_relocation_offsets':[112,120,124],
    'complete_candidate_sha256':raw['programs'][0]['whole_sha256'],
    'positive_elf_sha256_both_programs':elf_sha,'full_image_sha256_both_programs':image_sha,
    'image_bytes':165552,'load_segments':6,'BSS_bytes':21424,
    'public_IRQ_0x800_wrong_binding_offset':[20901],
    'independent_WRAM_0x0380bc94_wrong_binding_offset':[20908],
    'malformed_PT_LOAD_rejected_both':True,
    'public_replay':'passed with fresh ROM-derived opaque inputs; six readbacks/logs byte-identical',
    'five_tests':'passed with documented TRIAL_OBJECT',
    'independent_native_script_sha256':sha((OUT/'native.py').read_bytes()),
    'independent_native_result_sha256':sha((INDEPENDENT/'result.json').read_bytes()),
    'original_names_types_ABI_extent_compiler_ownership_proven':False,
    'source_credit_bytes':0,'canonical_bytes':304,'T10_open':True}
path=OUT/'final-independent-review.json';path.write_text(json.dumps(receipt,indent=2)+'\n')
print(f'ACCEPTED {COMMIT}; tree {receipt["reviewed_tree"]}')
print(f'Git closure {len(closure)} files; manifest {len(pins)} pins')
print(f'Object {object_sha}; positive ELF {elf_sha}; complete image {image_sha}')
print(f'IRQ public negative 20901; WRAM independent negative 20908')
print(f'Receipt {len(path.read_bytes())} bytes SHA256 {sha(path.read_bytes())}')
