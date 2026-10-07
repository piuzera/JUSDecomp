import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
import unittest


CLI = Path(__file__).with_name('verify-evidence-pins.py').resolve()


class PublishedPinTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='jus-pin-test-')
        self.addCleanup(self.temp.cleanup)
        self.repo = Path(self.temp.name)
        self.git('init', '-q')
        self.git('config', 'user.name', 'Evidence test')
        self.git('config', 'user.email', 'evidence-test@localhost')
        (self.repo / '.gitignore').write_text('__pycache__/\n')
        (self.repo / 'evidence.txt').write_bytes(b'original evidence\n')
        self.git('add', '.gitignore', 'evidence.txt')
        self.git('commit', '-qm', 'test evidence')

    def git(self, *args):
        subprocess.run(['git', *args], cwd=self.repo, check=True, capture_output=True)

    def audit(self, path='evidence.txt', digest=None):
        target = self.repo / path
        digest = digest or hashlib.sha256(target.read_bytes()).hexdigest()
        (self.repo / 'acceptance.json').write_text(json.dumps({'artifact_sha256': {path: digest}}))
        return subprocess.run(['python3', str(CLI), 'acceptance.json'], cwd=self.repo, capture_output=True, text=True)

    def test_accepts_committed_original_bytes(self):
        result = self.audit()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('Verified 1 published pins', result.stdout)

    def test_rejects_ignored_bytecode_even_with_matching_hash(self):
        cache = self.repo / '__pycache__'
        cache.mkdir()
        (cache / 'ignored.pyc').write_bytes(b'ignored cache')
        result = self.audit('__pycache__/ignored.pyc')
        self.assertEqual(result.returncode, 1)
        self.assertIn('not tracked at HEAD', result.stderr)

    def test_rejects_wrong_committed_digest(self):
        result = self.audit(digest='0' * 64)
        self.assertEqual(result.returncode, 1)
        self.assertIn('committed hash mismatch', result.stderr)

    def test_rejects_modified_working_file(self):
        digest = hashlib.sha256((self.repo / 'evidence.txt').read_bytes()).hexdigest()
        (self.repo / 'evidence.txt').write_bytes(b'modified evidence\n')
        result = self.audit(digest=digest)
        self.assertEqual(result.returncode, 1)
        self.assertIn('working file hash mismatch', result.stderr)


if __name__ == '__main__':
    unittest.main()
