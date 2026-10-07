"""Real file controls for finite pin, output and publication boundaries."""
import importlib.util
import tempfile
import os
import subprocess
import sys
import unittest
from unittest.mock import patch
from pathlib import Path
P = Path(__file__).with_name('replay.py')
spec = importlib.util.spec_from_file_location('replay_boundaries', P)
r = importlib.util.module_from_spec(spec); spec.loader.exec_module(r)
class BoundaryTests(unittest.TestCase):
    def test_source_and_tool_pin_changes_reject(self):
        with tempfile.TemporaryDirectory() as d:
            for name in ('source.c', 'compiler.exe'):
                p = Path(d)/name; p.write_bytes(b'original'); expected = {str(p): r.digest(p)}
                p.write_bytes(b'changed')
                with self.assertRaises(ValueError):
                    getattr(r, 'check_snapshot', lambda values: None)(expected)
    def test_existing_output_rejects_without_changes(self):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d)/'output'; p.mkdir(); marker=p/'marker'; marker.write_bytes(b'keep')
            with self.assertRaises(ValueError):
                getattr(r, 'fresh_output', lambda path: path.mkdir(exist_ok=True))(p)
            self.assertEqual(marker.read_bytes(), b'keep')
    def test_receipt_creation_is_exclusive(self):
        with tempfile.TemporaryDirectory() as d:
            p=Path(d)/'receipt.json'; p.write_bytes(b'keep')
            with self.assertRaises(FileExistsError):
                getattr(r, 'publish_receipt', lambda path, payload, snap: path.write_bytes(payload))(p,b'new',{})
            self.assertEqual(p.read_bytes(),b'keep')
    def test_postpublication_checks_actual_changed_input(self):
        with tempfile.TemporaryDirectory() as d:
            source=Path(d)/'source.c'; source.write_bytes(b'original'); expected={str(source):r.digest(source)}
            source.write_bytes(b'changed'); receipt=Path(d)/'receipt.json'
            with self.assertRaises(ValueError):
                getattr(r,'publish_receipt',lambda path,payload,snap:path.write_bytes(payload))(receipt,b'new',expected)
            self.assertFalse(receipt.exists())
    def test_actual_mutation_after_receipt_write_rejects(self):
        with tempfile.TemporaryDirectory() as d:
            source=Path(d)/'source.c'; source.write_bytes(b'original')
            expected={str(source):r.digest(source)}; receipt=Path(d)/'receipt.json'
            real_check=r.check_snapshot
            def mutate_after_write(snapshot):
                self.assertEqual(receipt.read_bytes(),b'new')
                source.write_bytes(b'late changed')
                real_check(snapshot)
            with patch.object(r,'check_snapshot',mutate_after_write):
                with self.assertRaises(ValueError): r.publish_receipt(receipt,b'new',expected)
            self.assertFalse(receipt.exists())
    def test_actual_receipt_mutation_after_write_rejects(self):
        with tempfile.TemporaryDirectory() as d:
            receipt=Path(d)/'receipt.json'
            def mutate_after_write(snapshot):
                self.assertEqual(receipt.read_bytes(),b'new')
                receipt.write_bytes(b'late changed')
            with patch.object(r,'check_snapshot',mutate_after_write):
                with self.assertRaises(ValueError): r.publish_receipt(receipt,b'new',{})
            self.assertFalse(receipt.exists())
    def test_late_same_byte_receipt_symlink_rejects(self):
        with tempfile.TemporaryDirectory() as d:
            output=Path(d)/'output'; output.mkdir()
            external=Path(d)/'external'; external.write_bytes(b'new')
            receipt=output/'receipt.json'
            def substitute_after_write(snapshot):
                self.assertEqual(receipt.read_bytes(),b'new')
                receipt.unlink(); receipt.symlink_to(external)
                self.assertEqual(receipt.read_bytes(),b'new')
            with patch.object(r,'check_snapshot',substitute_after_write):
                with self.assertRaises(ValueError): r.publish_receipt(receipt,b'new',{})
            self.assertFalse(receipt.exists()); self.assertFalse(receipt.is_symlink())
            self.assertEqual(external.read_bytes(),b'new')
    def test_late_same_byte_artifact_symlink_rejects(self):
        with tempfile.TemporaryDirectory() as d:
            output=Path(d)/'output'; output.mkdir()
            external=Path(d)/'external.o'; external.write_bytes(b'compiled')
            artifact=output/'compiled.o'; artifact.write_bytes(b'compiled')
            receipt=output/'receipt.json'; snapshot={str(artifact):r.digest(artifact)}
            real_check=r.check_snapshot
            def substitute_after_write(values):
                self.assertEqual(receipt.read_bytes(),b'new')
                artifact.unlink(); artifact.symlink_to(external)
                self.assertEqual(artifact.read_bytes(),b'compiled')
                real_check(values)
            with patch.object(r,'check_snapshot',substitute_after_write):
                with self.assertRaises(ValueError): r.publish_receipt(receipt,b'new',snapshot)
            self.assertFalse(receipt.exists()); self.assertFalse(receipt.is_symlink())
            self.assertEqual(external.read_bytes(),b'compiled')
    def test_cli_broken_output_symlink_rejects_before_target_creation(self):
        with tempfile.TemporaryDirectory() as d:
            target=Path(d)/'unexpected-target'; output=Path(d)/'output-link'
            output.symlink_to(target)
            # A genuine Git config error stops the old entry point before any compiler.
            # The fixed entry point must reject at fresh_output before Git is called.
            environment=dict(os.environ, GIT_CONFIG_COUNT='1', GIT_CONFIG_KEY_0='invalid', GIT_CONFIG_VALUE_0='x')
            result=subprocess.run([sys.executable,str(P),'--output',str(output)],env=environment,capture_output=True,text=True)
            print({'actual_cli_returncode':result.returncode,'stderr':result.stderr,
                   'symlink_target_created':target.exists(),'verify_created':(target/'verify').exists()})
            self.assertEqual(result.returncode,1)
            self.assertFalse(target.exists())
            self.assertTrue(output.is_symlink())
            self.assertIn('output already exists; supply a fresh directory',result.stderr)
if __name__=='__main__': unittest.main()
