"""Public compiler probes for the bounded T06 class experiment."""
import os
import importlib.util
import subprocess
import tempfile
import unittest
from pathlib import Path
from test_source_build import fixture, module

ROOT = Path(__file__).resolve().parents[2]
PROBES = ROOT / 'decomp/matching-notes/pilot-t06/class'


def producer():
    spec = importlib.util.spec_from_file_location('class_probe', PROBES / 'reproduce.py')
    tool = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(tool)
    return tool


class ClassPilotFixtures(unittest.TestCase):
    def test_inventory_preserves_duplicate_physical_sections(self):
        script = PROBES / 'reproduce.py'
        self.assertTrue(script.is_file(), 'class probe evidence producer missing')
        spec = importlib.util.spec_from_file_location('class_probe', script)
        tool = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(tool)
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'public.o'
            data = fixture(extra=True).replace(b'.unexpected\0', b'.text\0' + bytes(6))
            path.write_bytes(data)
            result = tool.inventory(path)
            texts = [item for item in result['allocated_sections'] if item['name'] == '.text']
            self.assertEqual([item['size'] for item in texts], [24, 5])
            self.assertEqual(len({item['index'] for item in texts}), 2)
            self.assertEqual(result['relocations'][0]['target_section_index'], 1)

    def test_reference_trials_are_explicit_and_do_not_claim_link_promotion(self):
        tool = producer()
        self.assertTrue(hasattr(tool, 'run_reference_trials'), 'bounded reference trials missing')

    @unittest.skipUnless(all(os.environ.get(name) for name in
                           ('JUS_CLASS_MWCC', 'JUS_CLASS_WIBO', 'JUS_CLASS_REFERENCE_DIR',
                            'JUS_CLASS_BOUND_REFERENCE_DIR')),
                         'set tools and original/bound complete private reference TUs')
    def test_real_reference_rejects_names_extent_and_changed_call_destination(self):
        tool = producer()
        self.assertTrue(hasattr(tool, 'run_reference_trials'), 'bounded reference trials missing')
        with tempfile.TemporaryDirectory() as directory:
            report = tool.run_reference_trials(Path(os.environ['JUS_CLASS_REFERENCE_DIR']),
                      Path(os.environ['JUS_CLASS_BOUND_REFERENCE_DIR']), Path(os.environ['JUS_CLASS_MWCC']),
                      Path(os.environ['JUS_CLASS_WIBO']), Path(directory))
            self.assertEqual(report['status'], 'passed', report)
            self.assertEqual(report['source_credit'], 0)
            self.assertEqual(report['promotion_status'], 'pending_full_pipeline_review')
            self.assertEqual(report['matched']['accepted_units'], 1)
            self.assertEqual(report['changed_call']['accepted_units'], 0)
            self.assertIn('relocation identities', report['changed_call']['failure'])
            self.assertEqual(report['matched']['units'][0]['reference']['sha256'],
                             report['changed_call']['units'][0]['reference']['sha256'])
            self.assertNotEqual(report['matched']['units'][0]['compiled']['sha256'],
                                report['changed_call']['units'][0]['compiled']['sha256'])
            self.assertTrue('bridge' in report, 'original-identity ABI bridge experiment missing')
            self.assertEqual(report['bridge']['status'], 'passed', report['bridge'])
            self.assertEqual(report['bridge']['accepted_units'], 1)
            self.assertEqual(report['bridge']['units'][0]['checks']['functions'][0]['name'],
                             'func_0206d010')

    def test_public_shape_probe_declares_real_cpp_members_and_layout_assertions(self):
        source = PROBES / 'shape.cpp'
        self.assertTrue(source.is_file(), 'public constructor/destructor shape probe missing')
        text = source.read_text()
        self.assertIn('virtual ~PublicBase', text)
        self.assertIn('PublicDerived::PublicDerived', text)
        self.assertIn('PublicDerived::~PublicDerived', text)
        self.assertIn('sizeof(PublicDerived) == 0x84', text)
        self.assertIn('T06_EXPECT_MEMBER_OFFSET', text)

    def test_single_member_probe_has_explicit_opaque_layout(self):
        source = PROBES / 'single_member.cpp'
        self.assertTrue(source.is_file(), 'bounded single-member ABI probe missing')
        text = source.read_text()
        self.assertIn('PublicAbi* PublicAbi::Destroy()', text)
        self.assertIn('unknown_04_7f', text)
        self.assertIn('sizeof(PublicAbi) == 0x84', text)

    def test_actual_abi_entry_preserves_unknown_layout_and_base_call(self):
        source = PROBES / 'common_effect_destroy.cpp'
        self.assertTrue(source.is_file(), 'bounded CommonEffect ABI entry missing')
        text = source.read_text()
        self.assertIn('CommonEffectAbi* CommonEffectAbi::Destroy()', text)
        self.assertIn('func_02015ed8(this)', text)
        self.assertIn('sizeof(CommonEffectAbi) == 0x84', text)
        self.assertIn('unknown_82_83', text)

    @unittest.skipUnless(os.environ.get('JUS_CLASS_MWCC') and os.environ.get('JUS_CLASS_WIBO'),
                         'set explicit local pinned tools for the real compiler probe')
    def test_pinned_compiler_enforces_layout_and_emits_member_object(self):
        source = PROBES / 'shape.cpp'
        self.assertTrue(source.is_file(), 'public constructor/destructor shape probe missing')
        with tempfile.TemporaryDirectory() as directory:
            command = [os.environ['JUS_CLASS_WIBO'], os.environ['JUS_CLASS_MWCC'],
                       '-c', '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc']
            positive = subprocess.run([*command, '-o', str(Path(directory) / 'good.o'), str(source)],
                                      capture_output=True, text=True)
            self.assertEqual(positive.returncode, 0, positive.stdout + positive.stderr)
            self.assertTrue((Path(directory) / 'good.o').is_file())
            negative = subprocess.run([*command, '-DT06_EXPECT_MEMBER_OFFSET=0x7c',
                                       '-o', str(Path(directory) / 'bad.o'), str(source)],
                                      capture_output=True, text=True)
            self.assertNotEqual(negative.returncode, 0, 'wrong member offset compiled successfully')
            self.assertFalse((Path(directory) / 'bad.o').exists())

    @unittest.skipUnless(os.environ.get('JUS_CLASS_MWCC') and os.environ.get('JUS_CLASS_WIBO'),
                         'set explicit local pinned tools for the real compiler probe')
    def test_actual_member_has_one_twenty_byte_function_and_original_call_identity(self):
        gate = module()
        with tempfile.TemporaryDirectory() as directory:
            destination = Path(directory) / 'actual.o'
            command = [os.environ['JUS_CLASS_WIBO'], os.environ['JUS_CLASS_MWCC'],
                       '-c', '-proc', 'arm946e', '-Cpp_exceptions', 'off', '-nostdinc',
                       '-O2', '-o', str(destination), str(PROBES / 'common_effect_destroy.cpp')]
            completed = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(completed.returncode, 0, completed.stdout + completed.stderr)
            elf, symbols, sections = gate._object(destination)
            self.assertEqual(set(sections), {'.text'})
            self.assertEqual(gate._functions(elf, symbols), {'_ZN15CommonEffectAbi7DestroyEv': {
                'name': '_ZN15CommonEffectAbi7DestroyEv', 'offset': 0, 'size': 20,
                'mode': 'arm', 'section': '.text'}})
            self.assertEqual(gate._relocations(elf, symbols, sections), [{
                'section': '.text', 'offset': 8, 'type': 1,
                'symbol': 'func_02015ed8', 'addend': -8}])


if __name__ == '__main__':
    unittest.main()
