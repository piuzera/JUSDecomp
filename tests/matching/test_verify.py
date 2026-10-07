"""Strict verifier contract tests; all input bytes are public synthetic fixtures."""
import importlib.util
import json
import os
import subprocess
import sys
import tempfile
import time
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/verify.py'


def module():
    spec = importlib.util.spec_from_file_location('verify', SCRIPT)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


class VerificationTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(SCRIPT.exists(), 'strict verifier missing')

    def test_wrong_rom_fails_before_tools_or_extraction_and_writes_report(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            rom = root / 'wrong.nds'
            rom.write_bytes(b'public wrong ROM')
            output = root / 'fresh'
            result = subprocess.run([sys.executable, str(SCRIPT), '--rom', str(rom),
                '--output', str(output), '--dsd', '/missing/dsd', '--lld', '/missing/lld',
                '--clang', '/missing/clang'], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            report = json.loads((output / 'report.json').read_text())
            self.assertEqual(report['status'], 'failed')
            self.assertIn('ROM SHA1 mismatch', report['failure'])
            self.assertEqual(report['stages'][-1]['name'], 'intake')
            self.assertNotIn('extract', [s['name'] for s in report['stages']])
            self.assertNotIn('tool_versions', [s['name'] for s in report['stages']])

    def test_existing_output_is_rejected_without_touching_stale_artifacts(self):
        with tempfile.TemporaryDirectory() as tmp:
            output = Path(tmp) / 'stale'
            output.mkdir()
            (output / 'arm9.bin').write_bytes(b'old payload')
            result = subprocess.run([sys.executable, str(SCRIPT), '--rom', '/unused',
                '--output', str(output), '--dsd', '/unused', '--lld', '/unused',
                '--clang', '/unused'], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual((output / 'arm9.bin').read_bytes(), b'old payload')
            reports = list(Path(tmp).glob('stale.rejected-*.json'))
            self.assertEqual(len(reports), 1)
            self.assertIn('already exists', json.loads(reports[0].read_text())['failure'])

    def test_missing_or_skipped_linker_stage_never_passes(self):
        tool = module()
        stages = [{'name': name, 'status': 'passed'} for name in tool.REQUIRED_STAGES]
        with self.assertRaisesRegex(ValueError, 'native_link'):
            tool.require_stages([s for s in stages if s['name'] != 'native_link'])
        next(s for s in stages if s['name'] == 'native_link')['status'] = 'skipped'
        with self.assertRaisesRegex(ValueError, 'native_link'):
            tool.require_stages(stages)

    def test_source_pipeline_requires_compilation_and_ownership_before_credit(self):
        tool = module()
        self.assertTrue(hasattr(tool, 'SOURCE_STAGES'), 'source promotion stages missing')
        stages = [{'name': name, 'status': 'passed'} for name in tool.SOURCE_STAGES]
        tool.require_stages(stages, source_enabled=True)
        for name in ('source_build', 'source_ownership'):
            with self.subTest(name=name), self.assertRaisesRegex(ValueError, name):
                tool.require_stages([s for s in stages if s['name'] != name], source_enabled=True)

    def test_binary_reference_config_and_source_candidate_are_kept_separate(self):
        tool = module()
        self.assertTrue(hasattr(tool, 'prepare_source_config'), 'source candidate config missing')
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            canonical = root / 'decomp/arm9/overlays/ov000'
            canonical.mkdir(parents=True)
            declaration = ('    .text start:0x1000 end:0x1020 kind:code align:4\n'
                'src/ov000/test.c:\n    complete\n    .text start:0x1008 end:0x1010\n')
            (canonical / 'delinks.txt').write_text(declaration)
            output = root / 'fresh'
            baseline = output / 'config/overlays/ov000'
            baseline.mkdir(parents=True)
            (baseline / 'delinks.txt').write_text(declaration.split('src/')[0])
            (baseline / 'symbols.txt').write_text('public synthetic symbol metadata')
            os.utime(baseline / 'symbols.txt', ns=(1_000_000, 1_000_000))
            (output / 'config/config.yaml').write_text('delinks_path: ../delinks\nbuild_path: ../linked\n')
            manifest = {'schema_version': 1, 'translation_units': [{'module': 'ov000',
                'source': 'decomp/src/ov000/test.c', 'object': 'src/ov000/test.o'}]}
            started = time.time_ns()
            result = tool.prepare_source_config(root, output, manifest)
            candidate = Path(result['config'])
            self.assertEqual((baseline / 'delinks.txt').read_text(), declaration.split('src/')[0])
            self.assertEqual((candidate.parent / 'overlays/ov000/delinks.txt').read_text(), declaration)
            self.assertIn('delinks_path: ../candidate-delinks', candidate.read_text())
            self.assertGreaterEqual((candidate.parent / 'overlays/ov000/symbols.txt').stat().st_mtime_ns, started)
            manifest['translation_units'].append(dict(manifest['translation_units'][0]))
            with self.assertRaisesRegex(ValueError, 'duplicate|exists'):
                tool.prepare_source_config(root, output, manifest)

    def test_missing_stub_module_fails_even_when_other_outputs_exist(self):
        with tempfile.TemporaryDirectory() as tmp:
            output = Path(tmp)
            expected = [{'region': 'OV009', 'filename': 'arm9_ov009.bin'}]
            with self.assertRaisesRegex(ValueError, 'OV009'):
                module().require_module_files(output, expected)

    def test_changed_input_or_tool_digest_invalidates_freshness(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / 'input.txt'
            path.write_text('before')
            snapshot = {str(path): module().sha256(path)}
            path.write_text('after')
            with self.assertRaisesRegex(ValueError, 'changed'):
                module().require_unchanged(snapshot)

    def test_missing_tool_and_wrong_tool_digest_are_rejected(self):
        tool = module()
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / 'tool'
            with self.assertRaisesRegex(ValueError, 'missing'):
                tool.require_tool(path, '0' * 64)
            path.write_bytes(b'public synthetic tool')
            with self.assertRaisesRegex(ValueError, 'SHA256 mismatch'):
                tool.require_tool(path, '0' * 64)

    def test_tool_argument_preserves_driver_symlink_basename(self):
        tool = module()
        self.assertTrue(hasattr(tool, 'tool_argument'), 'tool driver path helper missing')
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            target = root / 'lld'
            target.write_bytes(b'public driver')
            symlink = root / 'ld.lld'
            symlink.symlink_to(target)
            self.assertEqual(tool.tool_argument(symlink).name, 'ld.lld')

    def test_link_record_requires_actual_inputs_and_matching_hashes(self):
        tool = module()
        self.assertTrue(hasattr(tool, 'verify_link_record'), 'actual link input validation missing')
        with tempfile.TemporaryDirectory() as tmp:
            output = Path(tmp)
            native = output / 'native-link'
            native.mkdir()
            linked = output / 'linked'
            linked.mkdir()
            refs = output / 'delinks'
            refs.mkdir()
            source, normalized = refs / 'a.o', native / 'a.o'
            source.write_bytes(b'public reference object')
            normalized.write_bytes(b'public normalized object')
            lcf, script, attrs = linked / 'arm9.lcf', native / 'native.ld', native / 'attributes.o'
            lcf.write_text('a.o(.text)')
            script.write_text('public script')
            attrs.write_bytes(b'public attributes')
            command = ['/public/ld.lld', '-T', str(script), '-o', str(native / 'linked.elf'),
                       str(normalized), str(attrs)]
            record = {'schema_version': 1, 'command': command, 'returncode': 0,
                'objects': [{'filename': 'a.o', 'source': str(source), 'normalized': str(normalized),
                             'reference_sha256': tool.sha256(source),
                             'normalized_sha256': tool.sha256(normalized)}],
                'inputs': [{'path': str(p), 'sha256': tool.sha256(p)} for p in (normalized, attrs)],
                'attributes': {'sha256': tool.sha256(attrs), 'compiler_command': ['/public/clang']},
                'lcf_sha256': tool.sha256(lcf), 'native_script_sha256': tool.sha256(script),
                'lld_sha256': 'lld digest', 'clang_sha256': 'clang digest'}
            pins = {name: {'sha256': name + ' digest', 'command': ['/public/' + exe]}
                    for name, exe in [('lld', 'ld.lld'), ('clang', 'clang')]}
            (native / 'link-inputs.json').write_text(json.dumps(record))
            validated = tool.verify_link_record(output, pins)
            self.assertEqual(validated['command'], command)
            normalized.write_bytes(b'changed input')
            with self.assertRaisesRegex(ValueError, 'hash'):
                tool.verify_link_record(output, pins)

    def test_source_link_record_cannot_claim_reference_input_as_compiled_source(self):
        tool = module()
        self.assertTrue(hasattr(tool, 'require_source_input'), 'compiled input binding missing')
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            compiled = root / 'source.o'
            reference = root / 'reference.o'
            compiled.write_bytes(b'compiled from public synthetic C')
            reference.write_bytes(b'original synthetic reference')
            builds = {'objects': {'test.o': str(compiled)}}
            record = {'filename': 'test.o', 'kind': 'source', 'source': str(reference),
                      'compiled': str(reference), 'compiled_sha256': tool.sha256(reference)}
            with self.assertRaisesRegex(ValueError, 'compiled'):
                tool.require_source_input(record, builds, root)
            record.update(source=str(compiled), compiled=str(compiled), compiled_sha256=tool.sha256(compiled))
            tool.require_source_input(record, builds, root)

    def test_relocation_success_requires_every_pinned_slot_to_be_validated(self):
        tool = module()
        self.assertTrue(hasattr(tool, 'require_relocation_result'), 'relocation count gate missing')
        reference = {'relocations': [{'type': 1, 'count': 3}]}
        result = {'status': 'passed', 'counts': {'total': 3, 'validated': 2, 'failed': 0, 'unresolved': 0},
                  'relocation_types': {'1': 3}}
        with self.assertRaisesRegex(ValueError, 'relocation'):
            tool.require_relocation_result(result, reference)
        result['counts']['validated'] = 3
        tool.require_relocation_result(result, reference)
        result['counts'].update(total=0, validated=0)
        with self.assertRaisesRegex(ValueError, 'relocation'):
            tool.require_relocation_result(result, reference)

    def test_failed_subprocess_is_recorded_and_stops_pipeline(self):
        report = {'stages': []}
        result = subprocess.CompletedProcess(['public'], 7, 'stage stdout', 'stage stderr')
        with self.assertRaisesRegex(ValueError, 'public_stage'):
            module().record_stage(report, 'public_stage', lambda: result)
        stage = report['stages'][0]
        self.assertEqual(stage['exit_status'], 7)
        self.assertEqual(stage['stdout'], 'stage stdout')
        self.assertEqual(stage['stderr'], 'stage stderr')
        self.assertEqual(stage['status'], 'failed')


if __name__ == '__main__':
    unittest.main()
