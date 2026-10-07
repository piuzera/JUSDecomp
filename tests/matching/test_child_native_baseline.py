"""Public invented input rejection tests for the whole child operation."""
import importlib
import inspect
import json
import sys
import tempfile
import time
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/scripts'))


class ChildNativeTests(unittest.TestCase):
    def helper(self):
        self.assertTrue((ROOT/'tools/scripts/child_native_baseline.py').exists(),
                        'whole child operation is missing')
        return importlib.import_module('child_native_baseline')

    def test_selected_child_is_mandatory_before_freshness_and_requires_arm7(self):
        import verify
        self.assertIn('child_enabled', inspect.signature(verify.required_stages).parameters,
                      'child stage selection is missing')
        for source, count in ((False, 17), (True, 21)):
            stages = verify.required_stages(source, True, True)
            self.assertEqual(len(stages), count)
            self.assertEqual(stages[-4:], ('child_arm9_native_roundtrip','freshness',
                                          'rom_roundtrip','rom_freshness'))
            records = [dict(name=n,status='passed') for n in stages]
            verify.require_stages(records, source, True, True)
            with self.assertRaises(ValueError):
                verify.require_stages([s for s in records if s['name'] != 'child_arm9_native_roundtrip'],
                                      source, True, True)
        with self.assertRaises(ValueError):
            verify.required_stages(False, False, True)

    def test_report_cannot_issue_live_operation_or_authorize_repacking(self):
        helper = self.helper()
        with self.assertRaises(TypeError):
            helper._LiveOperation({'status': 'passed'})
        with self.assertRaisesRegex(ValueError, 'live'):
            helper.recheck_child({'status':'passed'}, Path('/missing'), b'PUBLIC ROM', 'id', 1)
        class Forged:
            def recheck(self, *args):
                return {'data': b'PUBLIC FORGED PAYLOAD'}
        with self.assertRaisesRegex(ValueError, 'live'):
            helper.recheck_child({}, Path('/missing'), b'PUBLIC ROM', 'id', 1, Forged())

    def test_detached_child_report_rejected_before_artifact_reads(self):
        import rom_roundtrip
        self.assertIn('child_operation', inspect.signature(rom_roundtrip._verify_build).parameters,
                      'child authority boundary is missing')
        with self.assertRaisesRegex(ValueError, 'child.*live|Child.*live'):
            rom_roundtrip._verify_build(Path('/missing'), b'PUBLIC ROM', Path('/missing'), {},
                {'status':'passed','artifact_hashes':{'invented.elf':'0'*64},'child_arm9':{}})

    def test_invented_rom_cannot_borrow_real_approved_tools_or_old_proof(self):
        helper = self.helper()
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary).resolve()
            rom = root/'invented.nds'
            rom.write_bytes(b'PUBLIC INVENTED CHILD ROM')
            approval = root/'approval.json'
            approval.write_text(json.dumps({'schema_version':1,'status':'pending'}))
            with self.assertRaises(ValueError):
                helper.build_child(original=rom,output=root/'child-arm9',root=root,
                    build_id='PUBLIC',started_ns=time.time_ns(),native_tools={},
                    analyzer=root/'analyzer',analyzer_approval=approval,
                    encoder=root/'encoder',codec_approval=approval)
            self.assertFalse((root/'child-arm9').exists())

    def test_all_physical_extents_validate_before_any_write(self):
        import rom_roundtrip
        self.assertTrue(hasattr(rom_roundtrip, '_apply_writes'), 'shared write validation is missing')
        original = b'P' * 0x600
        writes = [(0x200, b'A'*8, 0, 0x600, {}), (0x210, b'B'*8, 0, 0x600, {})]
        expected = bytearray(original)
        expected[0x200:0x208] = b'A'*8
        expected[0x210:0x218] = b'B'*8
        self.assertEqual(rom_roundtrip._apply_writes(original,writes), expected)
        for extent in [(0x204,b'badbad',0,0x600,{}), (0x200,b'A'*8,0,0x600,{}),
                       (0x100,b'header',0,0x600,{}), (0x5ff,b'outside',0,0x600,{})]:
            with self.subTest(extent=extent), self.assertRaises(ValueError):
                rom_roundtrip._apply_writes(original,[writes[0],extent])
        self.assertEqual(original,b'P'*0x600)

    def test_child_stage_without_child_report_cannot_reach_checkpoint(self):
        import rom_roundtrip, verify
        stages = verify.required_stages(False,True,True)
        report = {'status':'passed','artifact_hashes':{'invented.elf':'0'*64},
                  'arm7_baselines':{'status':'passed'},
                  'stages':[dict(name=n,status='passed') for n in stages[:-2]]}
        with self.assertRaisesRegex(ValueError,'child report/stage'):
            rom_roundtrip._verify_build(Path('/missing'),b'PUBLIC ROM',Path('/missing'),{},
                                       report,arm7_operation=object())

    def test_late_artifact_or_input_mutation_cannot_rewrite_capture(self):
        # The private seal builds a minimal rejected capture to exercise checks
        # before native parsing. This fixture never earns a successful operation.
        import hashlib, os
        helper = self.helper()
        with tempfile.TemporaryDirectory() as temporary:
            build = Path(temporary).resolve()
            output = build/'child-arm9'; output.mkdir()
            source = build/'source.py'; source.write_bytes(b'PUBLIC SOURCE')
            artifact = output/'linked.elf'; artifact.write_bytes(b'PUBLIC ELF')
            sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
            record = {'build_id':'PUBLIC','started_ns':1,'output':str(output),
                      'snapshot':{str(source):sha(source)},'tool_paths':[],
                      'artifact_hashes':{'linked.elf':sha(artifact)}}
            operation = helper._LiveOperation(record,helper._SEAL)
            for path in (source,artifact):
                saved = path.read_bytes(); path.write_bytes(saved+b'CHANGED')
                with self.subTest(path=path), self.assertRaisesRegex(ValueError,'changed'):
                    helper.recheck_child(record,build,b'PUBLIC ROM','PUBLIC',1,operation)
                forged = json.loads(json.dumps(record))
                if path == source: forged['snapshot'][str(path)] = sha(path)
                else: forged['artifact_hashes']['linked.elf'] = sha(path)
                with self.assertRaisesRegex(ValueError,'audit report'):
                    helper.recheck_child(forged,build,b'PUBLIC ROM','PUBLIC',1,operation)
                path.write_bytes(saved)
            with self.assertRaises(AttributeError): operation.capture = record
            with self.assertRaisesRegex(ValueError,'current build'):
                helper.recheck_child(record,build,b'PUBLIC ROM','OTHER',1,operation)
            artifact.unlink(); artifact.symlink_to(source)
            with self.assertRaisesRegex(ValueError,'symlink'):
                helper.recheck_child(record,build,b'PUBLIC ROM','PUBLIC',1,operation)

    def test_later_operation_cannot_replace_initial_shared_source_digest(self):
        import verify
        self.assertTrue(hasattr(verify,'merge_snapshot'),'conflicting operation snapshot union is unchecked')
        initial = {'shared.py':'old','parent.py':'parent'}
        with self.assertRaisesRegex(ValueError,'changed'):
            verify.merge_snapshot(initial,{'new.py':'new','shared.py':'replacement'})
        self.assertEqual(initial,{'shared.py':'old','parent.py':'parent'})
        verify.merge_snapshot(initial,{'new.py':'new','shared.py':'old'})
        self.assertEqual(initial,{'shared.py':'old','parent.py':'parent','new.py':'new'})

    def test_child_helpers_and_role_approvals_are_snapshotted_before_parent_work(self):
        import verify
        capsule = ROOT/'decomp/matching-notes/other-cpus/child-tool-approval'
        with tempfile.TemporaryDirectory() as temporary:
            output = Path(temporary)/'fresh'
            report, _ = verify.verify(Path(temporary)/'PUBLIC-MISSING-ROM',output,
                Path(sys.executable),Path(sys.executable),Path(sys.executable),root=ROOT,
                arm7_native_manifest=ROOT/'decomp/matching-notes/other-cpus/arm7-physical-baseline/approval.json',
                arm7_native_producer=Path(sys.executable),child_analyzer=Path(sys.executable),
                child_analyzer_approval=capsule/'analyzer-approval.json',child_encoder=Path(sys.executable),
                child_codec_approval=capsule/'codec-approval.json')
            self.assertEqual(report['status'],'failed')
            for path in (ROOT/'tools/scripts/child_native_baseline.py',ROOT/'tools/scripts/child_rom_roundtrip.py',
                         capsule/'analyzer-approval.json',capsule/'codec-approval.json'):
                self.assertIn(str(path.relative_to(ROOT)),report['source_hashes'])
