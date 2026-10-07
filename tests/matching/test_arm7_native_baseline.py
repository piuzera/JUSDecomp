"""Fresh-process ARM7 orchestration contracts, using public invented ROM bytes."""
import hashlib
import copy
import importlib.util
import json
import os
import struct
import subprocess
import sys
import tempfile
import time
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'tools/scripts'))
from test_rom_roundtrip import fixture, hashes

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/arm7_native_baseline.py'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def tool():
    spec = importlib.util.spec_from_file_location('arm7_native_baseline', SCRIPT)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


class Arm7NativeTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(SCRIPT.exists(), 'fresh pinned ARM7 producer integration missing')
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        original, self.regions = fixture()
        parent = bytearray(original)
        image = b'PUBLIC OPAQUE ARM7 INPUT' * 3
        self.image = image
        struct.pack_into('<4I', parent, 0x30, 0x300, 0x02380000, 0x02380000, len(image))
        parent[0x300:0x300 + len(image)] = image
        child = bytearray(0x500)
        struct.pack_into('<4I', child, 0x30, 0x200, 0x02380000, 0x02380000, len(image))
        child[0x200:0x200 + len(image)] = image
        parent[0xb00:0x1000] = child
        struct.pack_into('<2I', parent, 0x770, 0xb00, 0x1000)
        fnt = struct.pack('<IHHIHH', 16, 14, 2, 28, 14, 0xf000)
        fnt += b'\x88ChildRom\x01\xf0\0\x0dJSS2Child.srl\0'
        struct.pack_into('<2I', parent, 0x40, 0x780, len(fnt))
        parent[0x780:0x780 + len(fnt)] = fnt
        self.rom = self.root / 'original.nds'
        self.rom.write_bytes(parent)
        self.regions['rom'] = {'bytes': len(parent), 'hashes': hashes(parent)}
        self.layouts = []
        for i, program in enumerate((bytes(parent), bytes(child))):
            offset = (0x300, 0x200)[i]
            self.layouts.append({'identity': {
                'parent_rom_sha256': digest(parent),
                'program': {'kind': 'parent'} if not i else
                    {'kind': 'nitro_fs', 'path': 'ChildRom/JSS2Child.srl'},
                'program_sha256': digest(program)},
                'target': {'cpu': 'arm7', 'isa': 'armv4t', 'processor': 'arm7tdmi'},
                'image_offset': offset, 'image_bytes': len(image), 'image_sha256': digest(image),
                'base': 0x02380000, 'entry': 0x02380000,
                'header_sha256': digest(program[:0x160]), 'params_offset': 0,
                'params_sha256': digest(image[:20]), 'table_extent': {'start': len(image), 'end': len(image)},
                'table_sha256': digest(b''), 'regions': [{'kind': 'startup',
                    'stored_extent': {'start': 0, 'end': len(image)}, 'runtime_base': 0x02380000,
                    'bss_bytes': 0, 'sha256': digest(image)}]})
        self.layout = self.root / 'layout.json'
        self.layout.write_text(json.dumps(self.layouts))
        self.native = self.root / 'native-pins.json'
        native = {}
        for name in ('clang', 'lld'):
            path = self.root / name
            path.write_text('public executable pin ' + name)
            native[name] = {'executable': str(path), 'sha256': digest(path.read_bytes()), 'version': 'PUBLIC1'}
        self.native.write_text(json.dumps(native))
        self.source = self.root / 'recipe.txt'
        self.source.write_text('public reviewed fixture recipe')
        self.producer = self.root / 'producer.py'
        self.approval_path = self.root / 'approval.json'
        self.set_producer()
        self.started = time.time_ns()
        self.build_dir = self.root / 'fresh'
        self.build_dir.mkdir()
        self.output = self.build_dir / 'arm7-native'

    def set_producer(self, mutation=''):
        # This public executable tests process/receipt boundaries, not native ELF correctness.
        body = '''#!/usr/bin/env python3
import hashlib,json,sys
from pathlib import Path
def sha(b): return hashlib.sha256(b).hexdigest()
rom,layout,layout_sha,pins,pins_sha,out=sys.argv[1:]
data=Path(rom).read_bytes(); rows=json.loads(Path(layout).read_text()); tools=json.loads(Path(pins).read_text())
out=Path(out); out.mkdir(); programs=[]
for i,row in enumerate(rows):
 d=out/('program-'+str(i));d.mkdir(); payload=data[0x300:0x300+row['image_bytes']]
 artifacts=[]
 for name,b in [('linked.elf',b'PUBLIC ELF CONTAINER'+bytes([i])),('arm7.bin',payload),('startup.o',b'PUBLIC OBJECT'),('startup.s',b'PUBLIC ASM INPUT'),('physical.ld',b'PUBLIC SCRIPT'),('physical.map',b'PUBLIC MAP')]:
  (d/name).write_bytes(b);artifacts.append({'name':name,'bytes':len(b),'sha256':sha(b)})
 p={k:row[k] for k in ('identity','entry','image_offset','image_bytes','image_sha256','header_sha256','params_offset','params_sha256','table_extent','table_sha256','regions')}
 p.update(status='opaque_physical_baseline_verified',source_bytes=0,functions='unknown',executability='unknown',original_relocations='unknown',arm7_source_complete=False,t10_complete=False,bootable_elf=False,generated_cpu_arch='ARMv4T',generated_elf_abi_flags=0x05000200,commands=[{'tool_sha256':tools['clang']['sha256'],'arguments':['--target=arm-none-eabi','-mcpu=arm7tdmi','-c','startup.s','-o','startup.o'],'return_code':0},{'tool_sha256':tools['lld']['sha256'],'arguments':['-T','physical.ld','-Map','physical.map','-o','linked.elf','startup.o'],'return_code':0}],selected_inputs=[a for a in artifacts if a['name'] in ('startup.o','physical.ld')],segments=[{'section':'.arm7.startup','vma':row['base'],'lma':row['base'],'file_bytes':row['image_bytes'],'memory_bytes':row['image_bytes'],'file_offset':128,'alignment':4,'flags':4},{'section':'.arm7.table','vma':row['base']+row['image_bytes'],'lma':row['base']+row['image_bytes'],'file_bytes':0,'memory_bytes':0,'file_offset':200,'alignment':4,'flags':4}],artifacts=artifacts,clang_sha256=tools['clang']['sha256'],lld_sha256=tools['lld']['sha256'],layout_sidecar_sha256=layout_sha,native_pins_sidecar_sha256=pins_sha)
 programs.append(p)
report=dict(status='opaque_physical_baselines_verified',programs=programs,parent_rom_sha256=sha(data),layout_sidecar_sha256=layout_sha,native_pins_sidecar_sha256=pins_sha,producer_binary_sha256=sha(Path(__file__).read_bytes()),inputs_unchanged=True,source_bytes=0,t10_complete=False)
'''
        self.producer.write_text(body + mutation + '\nprint(json.dumps(report))\n')
        self.producer.chmod(0o755)
        self.approval = {'schema_version': 1, 'status': 'approved',
            'producer': {'sha256': digest(self.producer.read_bytes())},
            'source_commit': '1' * 40, 'source_tree': '2' * 40,
            'source_artifacts': {'recipe.txt': digest(self.source.read_bytes())},
            'layout': {'path': 'layout.json', 'sha256': digest(self.layout.read_bytes())},
            'native_pins': {'path': 'native-pins.json', 'sha256': digest(self.native.read_bytes())}}
        self.approval_path.write_text(json.dumps(self.approval))

    def build(self):
        self.operation = tool().build_baselines(self.rom, self.output, self.approval_path,
                                                self.producer, self.root, 'PUBLIC-BUILD', self.started)
        return self.operation.report

    def consume(self, record):
        return tool().recheck_baselines(record, self.build_dir, self.rom.read_bytes(),
                                        'PUBLIC-BUILD', self.started, self.operation)

    def test_actual_fresh_process_and_exact_parent_child_payload_writes(self):
        record = self.build()
        self.assertEqual(record['status'], 'passed')
        self.assertEqual(record['execution']['command'][0], str(self.producer))
        self.assertEqual(record['execution']['cwd'], str(self.root))
        self.assertEqual(len(self.consume(record)), 2)
        import rom_roundtrip
        modules = self.build_dir / 'native-link'
        modules.mkdir()
        original = self.rom.read_bytes()
        for target in rom_roundtrip._targets(self.regions):
            start = target['rom_offset']
            (modules / target['filename']).write_bytes(original[start:start + target['bytes']])
        rebuilt, writes = rom_roundtrip.rebuild_rom(original, modules, self.regions,
            arm7_baselines=record, build_dir=self.build_dir, build_id='PUBLIC-BUILD', started_ns=self.started,
            arm7_operation=self.operation)
        self.assertEqual(rebuilt, original)
        self.assertEqual(len(writes), 19)
        self.assertEqual([w['rom_offset'] for w in writes[-2:]], [0x300, 0xd00])
        self.assertEqual([w['source_bytes'] for w in writes[-2:]], [0, 0])
        rom_roundtrip.verify_repacked_rom(original, rebuilt, self.regions)

    def test_pending_or_wrong_producer_pin_fails_before_output(self):
        for field, value in [('status', 'pending'), ('producer', {'sha256': '0' * 64})]:
            self.approval[field] = value
            self.approval_path.write_text(json.dumps(self.approval))
            with self.subTest(field=field), self.assertRaises(ValueError):
                self.build()
            self.assertFalse(self.output.exists())
            self.approval['status'] = 'approved'

    def test_corrupt_missing_stale_symlinked_or_unrecorded_artifacts_reject(self):
        cases = ["(out/'program-0'/'arm7.bin').write_bytes(b'bad')",
                 "(out/'program-0'/'linked.elf').unlink()",
                 "import os; os.utime(out/'program-0'/'arm7.bin',ns=(1,1))",
                 "(out/'program-0'/'arm7.bin').unlink(); (out/'program-0'/'arm7.bin').symlink_to(Path(rom))",
                 "(out/'program-0'/'undeclared.bin').write_bytes(b'extra')"]
        for mutation in cases:
            with self.subTest(mutation=mutation):
                self.set_producer(mutation)
                with self.assertRaises(ValueError):
                    self.build()
                import shutil
                shutil.rmtree(self.output, ignore_errors=True)

    def test_missing_swapped_or_credit_claiming_program_receipts_reject(self):
        for mutation in ["report['programs'].pop()", "report['programs'].reverse()",
                         "report['programs'][0]['source_bytes']=1",
                         "report['programs'][0]['segments'][0]['vma']+=4"]:
            self.set_producer(mutation)
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                self.build()
            import shutil
            shutil.rmtree(self.output, ignore_errors=True)

    def test_live_inputs_and_outputs_rechecked_not_copied_report(self):
        record = self.build()
        for path in (self.producer, self.source, self.layout, self.native, self.root/'lld',
                     self.output/'artifacts/program-0/linked.elf',
                     self.output/'artifacts/program-1/arm7.bin'):
            saved = path.read_bytes()
            path.write_bytes(saved + b'changed')
            with self.subTest(path=path), self.assertRaises(ValueError):
                self.consume(record)
            path.write_bytes(saved)
        with self.assertRaisesRegex(ValueError, 'current build'):
            tool().recheck_baselines(record, self.build_dir, self.rom.read_bytes(), 'OTHER', self.started,
                                    self.operation)
        with self.assertRaises(ValueError):
            self.build()

    def test_producer_failure_captures_actual_execution(self):
        self.set_producer("print('PUBLIC FAILURE',file=sys.stderr);sys.exit(7)")
        with self.assertRaises(ValueError):
            self.build()
        invocation = json.loads((self.output/'execution.json').read_text())
        self.assertEqual(invocation['exit_status'], 7)
        self.assertIn('PUBLIC FAILURE', invocation['stderr'])

    def test_native_tool_symlink_is_pinned_by_consumed_bytes(self):
        native = json.loads(self.native.read_text())
        executable = self.root/'lld'
        target = self.root/'lld-real'
        executable.rename(target)
        executable.symlink_to(target)
        self.native.write_text(json.dumps(native))
        self.set_producer()
        try:
            record = self.build()
        except ValueError as error:
            self.fail(f'valid native tool symlink rejected: {error}')
        target.write_bytes(b'replaced actual linker executable')
        with self.assertRaises(ValueError):
            self.consume(record)

    def test_receipt_native_commands_and_segment_alignment_are_checked(self):
        mutations = ["report['programs'][0]['commands'].pop()",
                     "report['programs'][0]['commands'][0]['arguments'][0]='--target=x86_64'",
                     "report['programs'][0]['segments'][0]['alignment']=3",
                     "report['programs'][0]['commands'][-1]['arguments'][3]='changed.map'"]
        for mutation in mutations:
            self.set_producer(mutation)
            with self.subTest(mutation=mutation), self.assertRaises(ValueError):
                self.build()
            import shutil
            shutil.rmtree(self.output, ignore_errors=True)

    def test_input_changes_during_actual_producer_operation_reject(self):
        self.set_producer("Path(pins).write_text('changed actual native pins')")
        with self.assertRaises(ValueError):
            self.build()

    def test_captured_command_cannot_be_rebound_to_a_different_executable(self):
        record = self.build()
        record['execution']['command'][0] = '/different/producer'
        (self.output/'execution.json').write_text(json.dumps(record['execution']))
        with self.assertRaises(ValueError):
            self.consume(record)

    def test_approval_source_context_is_durable_and_checked(self):
        record = self.build()
        self.assertEqual(record.get('approval'), self.approval)

    def test_explicit_empty_native_receipt_cannot_fall_back_to_original_arm7(self):
        import rom_roundtrip
        modules = self.build_dir/'native-link'
        modules.mkdir()
        original = self.rom.read_bytes()
        for target in rom_roundtrip._targets(self.regions):
            start = target['rom_offset']
            (modules/target['filename']).write_bytes(original[start:start+target['bytes']])
        with self.assertRaises(ValueError):
            rom_roundtrip.rebuild_rom(original, modules, self.regions, arm7_baselines={},
                build_dir=self.build_dir, build_id='PUBLIC-BUILD', started_ns=self.started)

    def test_original_parent_or_child_header_change_cannot_reuse_receipt(self):
        record = self.build()
        for offset in (0x34, 0xb34):
            changed = bytearray(self.rom.read_bytes())
            changed[offset] ^= 1
            with self.subTest(offset=offset), self.assertRaisesRegex(ValueError, 'original.*identity'):
                tool().recheck_baselines(record, self.build_dir, bytes(changed), 'PUBLIC-BUILD', self.started,
                                        self.operation)

    def test_actual_generated_softfloat_container_flags_preserve_unknown_original_abi(self):
        self.set_producer("\nfor p in report['programs']: p['generated_elf_abi_flags']=0x05000200")
        try:
            record = self.build()
        except ValueError as error:
            self.fail(f'actual generated EABI5 soft-float metadata rejected: {error}')
        self.assertEqual(record['receipt']['programs'][0]['generated_elf_abi_flags'], 0x05000200)
        self.assertEqual(record['receipt']['programs'][0]['original_relocations'], 'unknown')

    def test_changed_elf_and_rewritten_receipt_cannot_override_actual_stdout(self):
        record = self.build()
        elf = self.output/'artifacts/program-0/linked.elf'
        elf.write_bytes(b'PUBLIC UNVALIDATED ELF REPLACEMENT')
        artifact = next(a for a in record['receipt']['programs'][0]['artifacts'] if a['name']=='linked.elf')
        artifact.update(bytes=elf.stat().st_size, sha256=digest(elf.read_bytes()))
        (self.output/'receipt.json').write_text(json.dumps(record['receipt']))
        with self.assertRaises(ValueError):
            self.consume(record)

    def test_changed_pin_input_and_rewritten_snapshot_cannot_override_approval(self):
        record = self.build()
        for path in (self.source, self.producer, self.root/'lld'):
            saved = path.read_bytes()
            path.write_bytes(saved+b'PUBLIC REPLACEMENT')
            altered = copy.deepcopy(record)
            altered['snapshot'][str(path)] = digest(path.read_bytes())
            with self.subTest(path=path), self.assertRaises(ValueError):
                self.consume(altered)
            path.write_bytes(saved)

    def test_coherently_rewritten_detached_json_cannot_claim_fresh_operation(self):
        record = json.loads(json.dumps(self.build()))
        elf = self.output/'artifacts/program-0/linked.elf'
        elf.write_bytes(b'PUBLIC FORGED ELF')
        artifact = next(a for a in record['receipt']['programs'][0]['artifacts'] if a['name']=='linked.elf')
        artifact.update(bytes=elf.stat().st_size,sha256=digest(elf.read_bytes()))
        record['execution']['stdout'] = json.dumps(record['receipt'])
        (self.output/'receipt.json').write_text(json.dumps(record['receipt']))
        (self.output/'execution.json').write_text(json.dumps(record['execution']))
        with self.assertRaises(ValueError):
            tool().recheck_baselines(record,self.build_dir,self.rom.read_bytes(),'PUBLIC-BUILD',self.started)

    def test_standalone_packer_cannot_accept_arm7_report_json_without_live_operation(self):
        record = self.build()
        report = self.root/'copied-build-report.json'
        report.write_text(json.dumps({'status':'passed','artifact_hashes':{'copied.elf':'0'*64},
                                     'arm7_baselines':record}))
        regions = self.root/'regions.json'
        regions.write_text(json.dumps(self.regions))
        output, diagnostic = self.root/'standalone.nds', self.root/'standalone-report.json'
        process = subprocess.run([sys.executable,str(ROOT/'tools/scripts/rom_roundtrip.py'),
            '--rom',str(self.rom),'--build-dir',str(self.build_dir),'--regions',str(regions),
            '--build-report',str(report),'--output',str(output),'--report',str(diagnostic)],
            capture_output=True,text=True)
        self.assertNotEqual(process.returncode,0)
        self.assertIn('live producer operation',json.loads(diagnostic.read_text())['failure'])
        self.assertFalse(output.exists())

    def test_optional_stage_variant_requires_pair_before_freshness(self):
        import verify
        self.assertTrue(hasattr(verify, 'required_stages'), 'optional ARM7 required stage variant missing')
        required = verify.required_stages(source_enabled=True, arm7_enabled=True)
        self.assertEqual(len(verify.SOURCE_STAGES), 19)
        self.assertEqual(len(required), 20)
        self.assertEqual(required[required.index('freshness')-1], 'arm7_native_baselines')
        stages = [dict(name=name,status='passed') for name in required]
        verify.require_stages(stages, source_enabled=True, arm7_enabled=True)
        with self.assertRaises(ValueError):
            verify.require_stages(stages, source_enabled=True)
        with self.assertRaises(ValueError):
            verify.require_stages([s for s in stages if s['name']!='arm7_native_baselines'],
                                  source_enabled=True, arm7_enabled=True)


if __name__ == '__main__':
    unittest.main()
