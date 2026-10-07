"""Actual live producers and private late-artifact controls."""
import copy
import importlib.util
import json
import os
from pathlib import Path
import shutil
import struct
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
SCRATCH = Path(os.environ['ROM_TRIAL_TEST_ROOT'])


class PublicReplay(unittest.TestCase):
    def test_actual_public_replay(self):
        output = SCRATCH/'public-replay'
        run = subprocess.run([sys.executable, str(HERE/'reproduce.py'), str(output)], capture_output=True, text=True)
        self.assertEqual(run.returncode, 0, run.stderr)
        receipt = json.loads(Path(run.stdout.strip()).read_text())
        self.assertEqual(receipt['status'], 'passed')
        self.assertEqual(receipt['rom']['sha256'], 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27')
        self.assertEqual(len(receipt['research_pack']['writes']), 20)
        self.assertEqual(receipt['source_credit']['arm7'], 0)
        self.assertEqual(receipt['source_credit']['canonical'], 304)
        self.assertEqual([s['name'] for s in receipt['stages']], ['parent_verification','arm7_native_baselines','child_arm9_native_roundtrip','research_trial','integrated_input_gate','research_pack','final_freshness'])
        self.assertEqual(receipt['research_pack']['trial']['distinct_candidate_bytes'], 460)
        self.assertEqual(receipt['research_pack']['trial']['paired_candidate_bytes'], 920)

    def test_optimized_python_rejects_before_output(self):
        output = SCRATCH/'optimized'
        run = subprocess.run([sys.executable, '-O', str(HERE/'reproduce.py'), str(output)], capture_output=True, text=True)
        self.assertNotEqual(run.returncode, 0)
        self.assertIn('optimized Python', run.stderr)
        self.assertFalse(output.exists())


class LiveControls(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        SCRATCH.mkdir(parents=True,exist_ok=True)
        sys.path.insert(0,str(HERE))
        import reproduce
        cls.runner = reproduce
        cls.rom = reproduce.research_rom
        cls.tool = SCRATCH/'private-dsd'
        shutil.copy2('/private/tmp/jus-track-a/tools/dsd/dsd-macos-arm64', cls.tool)
        cls.context = reproduce._prepare(SCRATCH/'controls', parent_dsd=cls.tool)
        cls.trial = cls.context.trial_dir
        cls.index = 0

    def output(self):
        type(self).index += 1
        return self.context.output/f'negative-{self.index}.nds'

    def reject_changed(self, path, change, error=(ValueError,AssertionError)):
        data = path.read_bytes(); stamp = path.stat().st_mtime_ns
        try:
            change(path, data)
            with self.assertRaises(error):
                self.rom._pack(self.context, self.output())
        finally:
            if path.is_symlink(): path.unlink()
            path.write_bytes(data); os.utime(path,ns=(stamp,stamp))

    def test_actual_fixture_pack_and_parent_outputs(self):
        result = self.rom._pack(self.context, self.output())
        self.assertEqual(len(result['writes']),20)
        self.assertEqual(result['rom']['sha256'], self.context.parent['rom']['sha256'])
        self.assertEqual([p['image_bytes'] for p in result['trial']['programs']], [165552,165552])
        self.assertEqual([p['bss_bytes'] for p in result['trial']['programs']], [21424,21424])
        child=self.rom.approved_child.recheck_child(self.context.child_operation.report,self.context.build,self.context.rom.read_bytes(),self.context.parent['build_id'],self.context.parent['started_ns'],self.context.child_operation)
        for field in ('image_slice_offset','image_sha256','elf_sha256'):
            self.assertIn(field,result['writes'][17],'actual child slice origin must be retained')
            self.assertEqual(result['writes'][17][field],child[field])
        for index,record in enumerate(result['writes'][18:]):
            self.assertIn('elf_sha256',record,'actual ARM7 ELF origin must be retained')
            elf=self.context.output/record['input_file']
            self.assertEqual(record['elf_sha256'],self.rom._sha(elf.read_bytes()))
            self.assertEqual(record['native_program_index'],index)
            self.assertEqual(record['native_readback'],f'/research_pack/trial/programs/{index}/actual_readback')
            header,_,segments,_=self.rom.loads._parse_elf(elf)
            self.assertEqual(header['flags'],0x05000200)
            self.assertEqual(len(segments),6)
            self.assertEqual(sum(s['memory_bytes'] for s in segments if not s['file_bytes']),21424)
        for name,pin in self.context.parent_outputs.items():
            self.assertEqual(self.rom._sha((self.context.build/name).read_bytes()),pin)

    def test_changed_actual_trial_artifacts_and_tool(self):
        paths = [self.trial/'lower_load.o', self.trial/'low_load_trial.c', self.trial/'trial-proof.json',
                 self.trial/'lower_load-compile.json', self.trial/'native/program-0/positive.map',
                 self.trial/'native/program-1/positive.elf', self.tool]
        for path in paths:
            with self.subTest(path=path.name):
                self.reject_changed(path,lambda p,b:p.write_bytes(b[:-1]+bytes([b[-1]^1])))

    def test_missing_stale_symlink_and_escaped_artifacts(self):
        path = self.trial/'upper_load.o'
        self.reject_changed(path,lambda p,b:p.unlink())
        self.reject_changed(path,lambda p,b:os.utime(p,ns=(1,1)))
        other = SCRATCH/'escaped-copy.o'; other.write_bytes(path.read_bytes())
        self.reject_changed(path,lambda p,b:(p.unlink(),p.symlink_to(other)))
        previous = self.context.trial_operation.directory
        try:
            self.context.trial_operation.directory = SCRATCH
            with self.assertRaises(ValueError): self.rom._pack(self.context,self.output())
        finally: self.context.trial_operation.directory = previous

    def test_saved_json_and_missing_trial_stage_have_no_authority(self):
        owner = self.context.trial_operation
        self.context.trial_operation = json.loads((self.trial/'trial-proof.json').read_text())
        try:
            with self.assertRaises(ValueError): self.rom._pack(self.context,self.output())
        finally: self.context.trial_operation = owner
        stages = self.context.report['stages']
        self.context.report['stages'] = [s for s in stages if s['name'] != 'research_trial']
        try:
            with self.assertRaises(ValueError): self.rom._pack(self.context,self.output())
        finally: self.context.report['stages'] = stages

    def test_malformed_flags_and_identity_readback(self):
        source = self.trial/'native/program-0/positive.elf'
        wrong = SCRATCH/'flags.elf'; data = bytearray(source.read_bytes()); struct.pack_into('<I',data,36,0x05000000); wrong.write_bytes(data)
        with self.assertRaises(ValueError): self.rom._read_trial_elf(self.context,0,wrong)
        saved = self.context.layouts
        self.context.layouts = copy.deepcopy(saved); self.context.layouts[1]['image_offset'] += 4
        try:
            with self.assertRaises(ValueError): self.rom._pack(self.context,self.output())
        finally: self.context.layouts = saved

    def test_conflicting_writes_and_non_target_rom_change(self):
        original = self.context.rom.read_bytes()
        pending = self.rom._pending(self.context)
        with self.assertRaises(ValueError): self.rom.canonical_rom._apply_writes(original,pending+[pending[0]])
        changed = list(pending); start,data,lo,hi,record = changed[-1]
        changed[-1] = (lo-1,data,lo,hi,record)
        with self.assertRaises(ValueError): self.rom.canonical_rom._apply_writes(original,changed)
        rebuilt = bytearray(original); rebuilt[-1] ^= 1
        with self.assertRaises(ValueError): self.rom.canonical_rom.verify_repacked_rom(original,bytes(rebuilt),self.context.regions)

    def test_final_receipt_publication_rechecks_all_outputs(self):
        receipt=self.context.output/'trial-proof.json'; output=self.context.output/'research.nds'
        checkpoint=self.context.output/'module-checkpoint.json'
        checkpoint_bytes=checkpoint.read_bytes(); checkpoint_stamp=checkpoint.stat().st_mtime_ns
        previous=copy.deepcopy(self.context.report); actual=Path.open
        for target in (output,checkpoint,receipt):
            with self.subTest(target=target.name):
                self.context.report=copy.deepcopy(previous)
                class Stream:
                    def __init__(self,stream): self.stream=stream
                    def __enter__(self): self.stream.__enter__(); return self
                    def write(self,payload): return self.stream.write(payload)
                    def __exit__(self,*args):
                        result=self.stream.__exit__(*args)
                        data=target.read_bytes()
                        target.write_bytes(data[:-1]+bytes([data[-1]^1]))
                        return result
                def intercepted(p,*args,**kwargs):
                    stream=actual(p,*args,**kwargs)
                    return Stream(stream) if p==receipt and args and args[0] in ('w','xb') else stream
                try:
                    with patch.object(self.runner,'_prepare',lambda unused:self.context), patch.object(Path,'open',intercepted):
                        with self.assertRaises(ValueError): self.runner.replay(self.context.output)
                finally:
                    output.unlink(missing_ok=True);receipt.unlink(missing_ok=True)
                    checkpoint.write_bytes(checkpoint_bytes);os.utime(checkpoint,ns=(checkpoint_stamp,checkpoint_stamp))
        self.context.report=previous

    def test_mutation_after_consumption_is_rejected(self):
        path = self.trial/'native/program-0/positive.map'; data=path.read_bytes(); stamp=path.stat().st_mtime_ns
        actual = self.rom.canonical_rom._apply_writes
        def changed_after_apply(original,pending):
            result=actual(original,pending); path.write_bytes(data+b'changed\n'); return result
        try:
            with patch.object(self.rom.canonical_rom,'_apply_writes',changed_after_apply):
                with self.assertRaises(ValueError): self.rom._pack(self.context,self.output())
        finally: path.write_bytes(data); os.utime(path,ns=(stamp,stamp))

    def test_mutation_at_publication_is_rejected(self):
        path=self.trial/'trial-proof.json'; data=path.read_bytes(); stamp=path.stat().st_mtime_ns
        output=self.output(); actual=Path.open
        class Stream:
            def __init__(self,stream): self.stream=stream
            def __enter__(self): self.stream.__enter__(); return self
            def write(self,payload):
                result=self.stream.write(payload); path.write_bytes(data+b' '); return result
            def __exit__(self,*args): return self.stream.__exit__(*args)
        def intercepted(p,*args,**kwargs):
            stream=actual(p,*args,**kwargs)
            return Stream(stream) if p==output and args and args[0]=='xb' else stream
        try:
            with patch.object(Path,'open',intercepted):
                with self.assertRaises(ValueError): self.rom._pack(self.context,output)
        finally: path.write_bytes(data); os.utime(path,ns=(stamp,stamp))


class CheckoutPins(unittest.TestCase):
    def test_declared_checkout_bytes_match_git_blobs(self):
        root=HERE.parents[3]; owner=HERE/'checkout-eol.json'
        self.assertTrue(owner.is_file(),'the47 consumed CRLF inputs require explicit Git-blob provenance')
        import hashlib
        sha=lambda data:hashlib.sha256(data).hexdigest()
        proof=json.loads(owner.read_text()); catalog=json.loads((HERE/'dependency-catalog.json').read_text())
        self.assertEqual(sha((root/'.gitattributes').read_bytes()),proof['gitattributes_sha256'])
        self.assertEqual(sha(subprocess.check_output(['git','show','HEAD:.gitattributes'],cwd=root)),proof['gitattributes_sha256'])
        rows=proof['inputs'];self.assertEqual(len(rows),47)
        differing=set()
        for name,pin in catalog['repository_sha256'].items():
            working=(root/name).read_bytes(); blob=subprocess.check_output(['git','show','HEAD:'+name],cwd=root)
            self.assertEqual(sha(working),pin)
            if sha(blob)!=pin:differing.add(name)
        self.assertEqual(differing,{row['path'] for row in rows})
        for row in rows:
            with self.subTest(path=row['path']):
                blob=subprocess.check_output(['git','show','HEAD:'+row['path']],cwd=root)
                working=(root/row['path']).read_bytes()
                attrs=subprocess.check_output(['git','check-attr','-z','text','eol','--',row['path']],cwd=root).decode().split('\0')
                self.assertEqual({attrs[i+1]:attrs[i+2] for i in range(0,len(attrs)-1,3)}, {'text':'set','eol':'crlf'})
                self.assertEqual(sha(blob),row['committed_blob_sha256'])
                self.assertEqual(sha(working),row['consumed_checkout_sha256'])
                self.assertEqual(catalog['repository_sha256'][row['path']],row['consumed_checkout_sha256'])
                self.assertNotIn(b'\r',blob)
                self.assertEqual(blob.replace(b'\n',b'\r\n'),working)


if __name__ == '__main__': unittest.main()
