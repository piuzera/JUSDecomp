"""Bind the frozen .28 package to fresh replay and independent native output."""
import hashlib
import json
import subprocess
from pathlib import Path

REPO = Path('/private/tmp/jus-arm7-donor-recipe-independent')
OUT = Path('/private/tmp/jus-arm7-donor-recipe-independent-proof')
PACKAGE = REPO / 'decomp/matching-notes/other-cpus/arm7-donor-recipe-trial-proof'
REPLAY = OUT / 'public-replay-01'
INDEPENDENT = OUT / 'native-01'
COMMIT = '1cb9b6654ea0f334b26085c41ce6ef9149ee1072'
BASE = 'de4ea1eeb70f8d5f4b83bc0e26036f7743331536'
sha = lambda data: hashlib.sha256(data).hexdigest()

def git(*args):
    return subprocess.check_output(['git', *args], cwd=REPO)

assert git('rev-parse', f'{COMMIT}^{{tree}}').strip() == git('rev-parse', 'HEAD^{tree}').strip()
changed = git('diff', '--name-only', BASE, COMMIT).decode().splitlines()
assert len(changed) == 30
assert all('arm7-donor-recipe-trial' in name for name in changed)
closure = []
for name in changed:
    data = (REPO / name).read_bytes()
    blob = git('rev-parse', f'{COMMIT}:{name}').decode().strip()
    assert git('cat-file', 'blob', blob) == data
    assert not data.startswith(b'\x7fELF')
    closure.append({'path': name, 'bytes': len(data), 'git_blob': blob, 'sha256': sha(data)})
manifest = PACKAGE / 'evidence-pins.json'
pins = json.loads(manifest.read_text())['artifact_sha256']
assert len(pins) == 29
assert set(pins) == set(changed) - {'decomp/matching-notes/other-cpus/arm7-donor-recipe-trial-proof/evidence-pins.json'}
for name, digest in pins.items():
    assert sha((REPO / name).read_bytes()) == digest

source = (PACKAGE / 'low_getter_trial.c').read_bytes()
previous = (REPO / 'decomp/matching-notes/other-cpus/arm7-low-getter-trial-proof/low_getter_trial.c').read_bytes()
assert source == previous and sha(source) == 'fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537'
for name in ('original-read.json', 'llvm-original-low-getter.txt', 'compiled-llvm.txt',
             'elf-readback.txt', 'experiment-stdout.log', 'experiment-stderr.log',
             'accepted_negative_control-stdout.log', 'accepted_negative_control-stderr.log'):
    assert (PACKAGE / name).read_bytes() == (REPLAY / name).read_bytes(), name

object_sha = '9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b'
wrong_sha = 'a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20'
elf_sha = '673459693cdd25df49c550f9b0db3ffa8d6d703cc9cdbc4d9f249b55d92a6696'
image_sha = '0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
assert sha((OUT / 'compiled.o').read_bytes()) == sha((REPLAY / 'compiled.o').read_bytes()) == object_sha
assert sha((REPLAY / 'wrong-original.o').read_bytes()) == wrong_sha
public_native = json.loads((REPLAY / 'native/native-proof.json').read_text())
published_native = json.loads((PACKAGE / 'native-proof.json').read_text())
independent_native = json.loads((INDEPENDENT / 'result.json').read_text())
assert len(public_native['programs']) == len(published_native['programs']) == len(independent_native['native_results']) == 2
for index, (fresh, published, independent) in enumerate(zip(public_native['programs'], published_native['programs'], independent_native['native_results'])):
    fresh_elf = REPLAY / f'native/program-{index}/positive.elf'
    own_elf = INDEPENDENT / f'program-{index}/positive/linked.elf'
    assert sha(fresh_elf.read_bytes()) == sha(own_elf.read_bytes()) == elf_sha
    for record in (fresh, published):
        assert record['positive']['readback']['image_sha256'] == image_sha
        assert record['positive']['readback']['image_bytes'] == 165552
        assert record['positive']['readback']['BSS_bytes'] == 21424
        assert record['positive']['readback']['image_mismatch_offsets'] == []
        assert len(record['positive']['readback']['segments']) == 6
        assert record['wrong_binding']['image_mismatch_offsets'] == [20780,20781]
        assert record['wrong_object']['image_mismatch_offsets'] == list(range(20752,20760))
        assert record['malformed_load_offset_rejected']
    assert independent['exact']['image_sha256'] == image_sha
    assert independent['wrong_binding_differences'] == [20780,20781]
    assert independent['wrong_object_differences'] == list(range(20752,20760))
    assert independent['malformed_segment_rejected']

trial = json.loads((REPLAY / 'trial-proof.json').read_text())
assert trial['comparison']['exact_88_bytes_both_programs']
assert trial['comparison']['instruction_mismatch_offsets'] == []
assert trial['source_credit_bytes'] == 0 and trial['original_names_types_ABI_extent_version_ownership_established'] is False
assert trial['elf']['object_sha256'] == object_sha
assert trial['negative_control_elf']['object_sha256'] == wrong_sha
assert not any(x in (PACKAGE / 'native.py').read_text() for x in ('jus-arm7-reachable-root-proof', 'jus-arm7-leaf-worker-proof'))
assert not any(x in (PACKAGE / 'reproduce.py').read_text() for x in ('jus-arm7-reachable-root-proof', 'jus-arm7-leaf-worker-proof'))

receipt = {'status':'accepted_no_flags','reviewed_commit':COMMIT,
    'reviewed_tree':git('rev-parse',f'{COMMIT}^{{tree}}').decode().strip(),
    'base_commit':BASE,'git_blob_closure':closure,
    'evidence_pin_manifest_sha256':sha(manifest.read_bytes()),'git_owned_pins_verified':len(pins),
    'source_unchanged_from_23':True,'source_sha256':sha(source),
    'independent_object_sha256':object_sha,'fresh_public_object_sha256':object_sha,
    'wrong_original_object_sha256':wrong_sha,'positive_elf_sha256_both_programs':elf_sha,
    'exact_full_image_sha256_both_programs':image_sha,'image_bytes':165552,'load_segments':6,'BSS_bytes':21424,
    'wrong_binding_image_offsets':[20780,20781],
    'wrong_prior_object_image_offsets':list(range(20752,20760)),
    'malformed_PT_LOAD_rejected_both':True,
    'public_replay':'passed using own ROM-derived opaque inputs; 8 public readbacks/logs byte-identical',
    'seven_tests':'passed with documented TRIAL_OBJECT and WRONG_OBJECT',
    'own_independent_native_result_sha256':sha((INDEPENDENT/'result.json').read_bytes()),
    'own_independent_native_script_sha256':sha((OUT/'native.py').read_bytes()),
    'original_JUS_compiler_identity_proven':False,'original_names_types_ABI_extent_ownership_proven':False,
    'source_credit_bytes':0,'canonical_bytes':304,'T10_open':True}
path = OUT / 'final-independent-review.json'
path.write_text(json.dumps(receipt,indent=2)+'\n')
print(f'ACCEPTED {COMMIT}; tree {receipt["reviewed_tree"]}')
print(f'Git closure {len(closure)} files; manifest {len(pins)} pins')
print(f'Actual MW object {object_sha}; both direct ELFs {elf_sha}; complete image {image_sha}')
print(f'Receipt {len(path.read_bytes())} bytes SHA256 {sha(path.read_bytes())}')
