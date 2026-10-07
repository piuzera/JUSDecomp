"""Real-git preparation tests; no registry cache or network access."""
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import unittest

BUNDLE = Path(__file__).resolve().parent


def git(root, *args):
    return subprocess.check_output(['git', '-C', str(root), *args], stderr=subprocess.STDOUT)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


class PrepareTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.checkout = self.root / 'checkout'
        self.bundle = self.root / 'bundle'
        self.checkout.mkdir()
        self.bundle.mkdir()
        git(self.checkout, 'init', '-q')
        (self.checkout / 'disasm').mkdir()
        (self.checkout / 'disasm/Cargo.toml').write_text('[package]\nname="unarm"\nversion="1.9.2"\n')
        (self.checkout / 'LICENSE').write_text('MIT fixture license\n')
        (self.checkout / 'source.txt').write_text('before\n')
        git(self.checkout, 'add', '.')
        git(self.checkout, '-c', 'user.name=Test', '-c', 'user.email=test@example.invalid', 'commit', '-qm', 'fixture')
        commit = git(self.checkout, 'rev-parse', 'HEAD').decode().strip()
        names = git(self.checkout, 'ls-files').decode().splitlines()
        before = {name: digest(self.checkout / name) for name in names}
        (self.checkout / 'source.txt').write_text('after\n')
        patch = git(self.checkout, 'diff', '--binary', 'HEAD')
        after = {name: digest(self.checkout / name) for name in names}
        git(self.checkout, 'checkout', '--', 'source.txt')
        (self.bundle / 'source.patch').write_bytes(patch)
        self.manifest = dict(schema_version=1, name='unarm', version='1.9.2', upstream_commit=commit,
                             upstream_url='unused-by-existing-checkout', patch='source.patch',
                             patch_sha256=hashlib.sha256(patch).hexdigest(),
                             license_file='LICENSE', license_sha256=before['LICENSE'],
                             before_files=before, after_files=after)
        self.save_manifest()
        spec = importlib.util.spec_from_file_location('prepare_unarm', BUNDLE / 'prepare.py')
        self.module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(self.module)

    def save_manifest(self):
        (self.bundle / 'manifest.json').write_text(json.dumps(self.manifest))

    def prepare(self):
        return self.module.prepare(self.checkout, self.bundle)

    def test_pinned_patch_is_applied_and_idempotent(self):
        self.assertEqual(self.prepare()['status'], 'prepared')
        self.assertEqual((self.checkout / 'source.txt').read_text(), 'after\n')
        self.assertEqual(self.prepare()['status'], 'already_prepared')

    def test_wrong_revision_rejected_without_patch(self):
        self.manifest['upstream_commit'] = '0' * 40
        self.save_manifest()
        with self.assertRaisesRegex(ValueError, 'commit'):
            self.prepare()
        self.assertEqual((self.checkout / 'source.txt').read_text(), 'before\n')

    def test_unrelated_tracked_edit_rejected(self):
        (self.checkout / 'LICENSE').write_text('tampered\n')
        with self.assertRaisesRegex(ValueError, 'source|license'):
            self.prepare()
        self.assertEqual((self.checkout / 'source.txt').read_text(), 'before\n')

    def test_patch_tampering_rejected_before_checkout_mutation(self):
        (self.bundle / 'source.patch').write_text('tampered\n')
        with self.assertRaisesRegex(ValueError, 'patch'):
            self.prepare()
        self.assertEqual((self.checkout / 'source.txt').read_text(), 'before\n')

    def test_unexpected_source_file_rejected(self):
        (self.checkout / 'unexpected.rs').write_text('unreviewed\n')
        with self.assertRaisesRegex(ValueError, 'untracked'):
            self.prepare()

    def test_post_patch_mutation_rejected(self):
        self.prepare()
        (self.checkout / 'source.txt').write_text('different repair\n')
        with self.assertRaisesRegex(ValueError, 'source'):
            self.prepare()

    def test_ignored_build_script_rejected_after_preparation(self):
        self.prepare()
        (self.checkout / 'disasm/build.rs').write_text('compile_error!("unpinned build script");\n')
        (self.checkout / '.git/info/exclude').write_text('/disasm/build.rs\n')
        with self.assertRaisesRegex(ValueError, 'untracked'):
            self.module.prepare(self.checkout, self.bundle, check_only=True)

    def test_ignored_cargo_configuration_rejected(self):
        self.prepare()
        (self.checkout / '.cargo').mkdir()
        (self.checkout / '.cargo/config.toml').write_text('[build]\nrustflags=["--cfg=unpinned"]\n')
        (self.checkout / '.git/info/exclude').write_text('/.cargo/\n')
        with self.assertRaisesRegex(ValueError, 'untracked'):
            self.module.prepare(self.checkout, self.bundle, check_only=True)

    def test_ignored_source_rejected_before_patch(self):
        (self.checkout / 'disasm/extra.rs').write_text('unreviewed\n')
        (self.checkout / '.git/info/exclude').write_text('/disasm/extra.rs\n')
        with self.assertRaisesRegex(ValueError, 'untracked'):
            self.prepare()
        self.assertEqual((self.checkout / 'source.txt').read_text(), 'before\n')

    def test_only_root_target_output_is_allowed(self):
        self.prepare()
        (self.checkout / 'target/debug').mkdir(parents=True)
        (self.checkout / 'target/debug/build-output').write_text('generated\n')
        (self.checkout / '.git/info/exclude').write_text('/target/\n/disasm/target/\n')
        self.assertEqual(self.module.prepare(self.checkout, self.bundle, check_only=True)['status'],
                         'already_prepared')
        (self.checkout / 'disasm/target').mkdir()
        (self.checkout / 'disasm/target/unknown.rs').write_text('unreviewed\n')
        with self.assertRaisesRegex(ValueError, 'untracked'):
            self.module.prepare(self.checkout, self.bundle, check_only=True)


if __name__ == '__main__':
    unittest.main()
