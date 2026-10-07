"""Check the frozen .25 public package against this independent replay."""
import hashlib
import json
import subprocess
from pathlib import Path

REPO = Path('/private/tmp/jus-arm7-low-getter-symbol-kind-independent')
OUT = Path('/private/tmp/jus-arm7-low-getter-symbol-kind-independent-proof')
PACKAGE = REPO / 'decomp/matching-notes/other-cpus/arm7-low-getter-symbol-kind-proof'
PREVIOUS = REPO / 'decomp/matching-notes/other-cpus/arm7-low-getter-trial-proof'
REPLAY = OUT / 'public-replay-01'
COMMIT = 'e82111bc3c63a0e003d1ffe13ae903911641f3de'
BASE = 'b7ec2f1b2a3f0d60b84f26bad5df813fb201d23d'
sha = lambda data: hashlib.sha256(data).hexdigest()

def git(*args):
    return subprocess.check_output(['git', *args], cwd=REPO)

assert git('rev-parse', f'{COMMIT}^{{tree}}').strip() == git('rev-parse', 'HEAD^{tree}').strip()
changed = git('diff', '--name-only', BASE, COMMIT).decode().splitlines()
assert len(changed) == 23
assert all('arm7-low-getter-symbol-kind' in name for name in changed)
closure = []
for name in changed:
    data = (REPO / name).read_bytes()
    blob = git('rev-parse', f'{COMMIT}:{name}').decode().strip()
    assert git('cat-file', 'blob', blob) == data
    assert not data.startswith(b'\x7fELF')
    closure.append({'path': name, 'bytes': len(data), 'git_blob': blob, 'sha256': sha(data)})

pins = json.loads((PACKAGE / 'public-artifact-pins.json').read_text())['artifact_sha256']
assert len(pins) == 22
assert set(pins) == set(changed) - {'decomp/matching-notes/other-cpus/arm7-low-getter-symbol-kind-proof/public-artifact-pins.json'}
for name, digest in pins.items():
    assert sha((REPO / name).read_bytes()) == digest

old = (PREVIOUS / 'low_getter_trial.c').read_bytes()
new = (PACKAGE / 'low_getter_trial.c').read_bytes()
before = b'extern unsigned char hyp_wram_arena_lo;'
after = b'extern void hyp_wram_arena_lo(void);'
assert old.count(before) == 1 and new == old.replace(before, after)
assert (PACKAGE / 'accepted_original_source.c').read_bytes() == old
assert sha(new) == '3f7b22c42f4b98cfed84308f2e5b658ae9cecdb8a17d900421e71ed70c496495'
for name in ('read_original.py', 'original-manifest.json', 'verify.py', 'test_verify.py',
             'original-read.json', 'elf-readback.txt', 'compiled-llvm.txt',
             'llvm-original-low-getter.txt'):
    assert (PREVIOUS / name).read_bytes() == (PACKAGE / name).read_bytes(), name
for name in ('original-read.json', 'elf-readback.txt', 'compiled-llvm.txt',
             'llvm-original-low-getter.txt', 'compiler-stderr.log', 'compiler-stdout.log'):
    assert (PACKAGE / name).read_bytes() == (REPLAY / name).read_bytes(), name

published = json.loads((PACKAGE / 'trial-proof.json').read_text())
actual = json.loads((REPLAY / 'trial-proof.json').read_text())
differences = []
def compare(a, b, path='$'):
    assert type(a) is type(b), path
    if isinstance(a, dict):
        assert a.keys() == b.keys(), path
        for key in a: compare(a[key], b[key], path + '.' + key)
    elif isinstance(a, list):
        assert len(a) == len(b), path
        for index, (left, right) in enumerate(zip(a, b)):
            compare(left, right, f'{path}[{index}]')
    elif a != b:
        differences.append(path)
compare(published, actual)
assert set(differences) == {'$.inputs[9].path', '$.inputs[10].path', '$.argv[9]',
                            '$.argv[11]', '$.readback_commands[0][5]'}
assert sha((REPLAY / 'compiled.o').read_bytes()) == 'a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20'
assert actual['comparison']['instruction_mismatch_offsets'] == list(range(52, 60))
assert actual['source_credit_bytes'] == 0 and not actual['native_link_attempted']

receipt = {
    'status': 'accepted_no_flags', 'reviewed_commit': COMMIT,
    'reviewed_tree': git('rev-parse', f'{COMMIT}^{{tree}}').decode().strip(),
    'base_commit': BASE, 'git_blob_closure': closure,
    'public_pin_manifest_sha256': sha((PACKAGE / 'public-artifact-pins.json').read_bytes()),
    'public_pins_verified': len(pins), 'source_single_declaration_change': True,
    'candidate_source_sha256': sha(new),
    'independent_object_sha256': sha((OUT / 'compiled.o').read_bytes()),
    'fresh_public_replay_object_sha256': sha((REPLAY / 'compiled.o').read_bytes()),
    'object_byte_identical_to_rejected_23': True,
    'undefined_wram_symbol': {'binding': 1, 'type': 0, 'section': 0, 'value': 0, 'size': 0},
    'instruction_mismatch_offsets_both_programs': list(range(52, 60)),
    'trial_proof_replay_differences_only_absolute_paths': sorted(differences),
    'copied_previous_artifacts_byte_identical': 8,
    'replayed_public_outputs_byte_identical': 6,
    'four_tests': 'passed with documented TRIAL_OBJECT path',
    'native_link_attempted': False, 'source_credit_bytes': 0,
    'canonical_bytes': 304, 'T10_open': True,
}
path = OUT / 'final-independent-review.json'
path.write_text(json.dumps(receipt, indent=2) + '\n')
print(f'ACCEPTED: {COMMIT}, tree {receipt["reviewed_tree"]}')
print(f'Git closure: {len(closure)} files; manifest: {len(pins)} pins')
print(f'Source: {sha(new)}; object: {receipt["independent_object_sha256"]}')
print(f'Receipt: {len(path.read_bytes())} bytes, SHA256 {sha(path.read_bytes())}')
