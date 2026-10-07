"""Compiler experiments reject stale source/context before any tool executes."""
import importlib.util
import hashlib
import json
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[2] / 'tools/scripts/compiler_experiments.py'

def tool():
    spec = importlib.util.spec_from_file_location('compiler_experiments', SCRIPT)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value

class CompilerExperimentTests(unittest.TestCase):
    def setup_case(self, root):
        source = root / 'case.c'
        source.write_text('int case_function(int x) { return x + 1; }\n')
        context = {'cpu': 'arm946e', 'flags': ['-nostdinc'], 'abi': {'int_bits': 32},
                   'include_paths': [], 'headers': {}}
        return {'source': 'case.c', 'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
                'contexts': [{'id': 'default', **context,
                             'sha256': hashlib.sha256(json.dumps(context, sort_keys=True, separators=(',', ':')).encode()).hexdigest()}]}

    def test_source_mutation_rejects_stale_experiment(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); unit = self.setup_case(root)
            self.assertTrue(SCRIPT.exists(), 'compiler experiment runner missing')
            (root / 'case.c').write_text('int case_function(int x) { return x + 2; }\n')
            with self.assertRaisesRegex(ValueError, 'source hash'):
                tool().validate_unit(unit, root)

    def test_context_mutation_rejects_stale_experiment(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); unit = self.setup_case(root)
            self.assertTrue(SCRIPT.exists(), 'compiler experiment runner missing')
            unit['contexts'][0]['flags'].append('-O4,p')
            with self.assertRaisesRegex(ValueError, 'context hash'):
                tool().validate_unit(unit, root)

    def test_header_includes_need_declared_context(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); unit = self.setup_case(root)
            self.assertTrue(SCRIPT.exists(), 'compiler experiment runner missing')
            (root / 'case.c').write_text('#include "untracked.h"\nint case_function(void) { return X; }\n')
            unit['source_sha256'] = hashlib.sha256((root / 'case.c').read_bytes()).hexdigest()
            with self.assertRaisesRegex(ValueError, 'header-free'):
                tool().validate_unit(unit, root)

    def test_good_header_free_context_validates(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); unit = self.setup_case(root)
            self.assertTrue(SCRIPT.exists(), 'compiler experiment runner missing')
            tool().validate_unit(unit, root)

    def test_comment_and_spliced_includes_cannot_bypass_saved_context(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); unit = self.setup_case(root)
            for text in ('#/**/include "untracked.h"\n', '%:include "untracked.h"\n',
                         '#inc\\\nlude "untracked.h"\n'):
                (root / 'case.c').write_text(text + 'int case_function(void) { return X; }\n')
                unit['source_sha256'] = hashlib.sha256((root / 'case.c').read_bytes()).hexdigest()
                with self.subTest(text=text), self.assertRaisesRegex(ValueError, 'header-free'):
                    tool().validate_unit(unit, root)

    def test_prefix_header_flags_cannot_bypass_header_free_scope(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); unit = self.setup_case(root)
            unit['contexts'][0]['flags'] += ['-prefix', 'untracked.h']
            unit['contexts'][0]['sha256'] = tool().context_hash(unit['contexts'][0])
            with self.assertRaisesRegex(ValueError, 'header-free'):
                tool().validate_unit(unit, root)

    def test_changed_compiler_dependency_is_rejected(self):
        self.assertTrue(hasattr(tool(), 'validate_compiler'), 'compiler dependency pin validation missing')
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp); package = root / 'example'; package.mkdir()
            (package / 'mwccarm.exe').write_bytes(b'compiler fixture')
            (package / 'ELFIO.dll').write_bytes(b'original dependency')
            hashes = {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in package.iterdir()}
            compiler = {'package': 'example', 'sha256': hashes['mwccarm.exe'], 'binaries': hashes}
            (package / 'ELFIO.dll').write_bytes(b'changed dependency')
            with self.assertRaisesRegex(ValueError, 'binary hash'):
                tool().validate_compiler(compiler, root)

    def test_empty_compiler_inventory_never_completes(self):
        self.assertTrue(hasattr(tool(), 'validate_manifest'), 'experiment inventory validation missing')
        with self.assertRaisesRegex(ValueError, 'compiler inventory'):
            tool().validate_manifest({'schema_version': 1, 'compilers': [], 'translation_units': [{}]})

    def test_duplicate_contexts_are_rejected(self):
        self.assertTrue(hasattr(tool(), 'validate_manifest'), 'experiment inventory validation missing')
        with self.assertRaisesRegex(ValueError, 'context'):
            tool().validate_manifest({'schema_version': 1, 'compilers': [{'package': 'a'}],
                                     'translation_units': [{'object': 'a.o', 'contexts': [{'id': 'a'}, {'id': 'a'}]}]})

    def test_emitted_equivalence_groups_ignore_container_hash_but_keep_relocation_targets(self):
        self.assertTrue(SCRIPT.exists(), 'compiler experiment runner missing')
        self.assertTrue(hasattr(tool(), 'emitted_fingerprint'), 'emitted equivalence grouping missing')
        left = {'sha256': 'container-a', 'functions': [{'name': 'f', 'size': 32}],
                'sections': [{'name': '.text', 'sha256': 'same'}],
                'relocations': [{'offset': 4, 'symbol': 'destination_a'}]}
        right = dict(left, sha256='container-b')
        self.assertEqual(tool().emitted_fingerprint(left), tool().emitted_fingerprint(right))
        right['relocations'] = [{'offset': 4, 'symbol': 'destination_b'}]
        self.assertNotEqual(tool().emitted_fingerprint(left), tool().emitted_fingerprint(right))

if __name__ == '__main__': unittest.main()
