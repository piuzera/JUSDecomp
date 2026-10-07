import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

HERE = Path(__file__).resolve().parent

class OriginalGrounding(unittest.TestCase):
    def test_finite_split_calls_and_separate_bss_literal(self):
        self.assertTrue((HERE / "init.py").exists(), "finite original reader is missing")
        spec = importlib.util.spec_from_file_location("init_proof", HERE / "init.py")
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        with tempfile.TemporaryDirectory() as directory:
            rows = module.read_original(Path(directory))
        self.assertEqual(len(rows), 2)
        self.assertNotEqual(rows[0]["identity"], rows[1]["identity"])
        for row in rows:
            self.assertEqual([(w["start"], w["end"]) for w in row["windows"]],
                             [(0x037fd004, 0x037fd018), (0x037fd018, 0x037fd02c), (0x037fd02c, 0x037fd0cc)])
            self.assertEqual(row["guard"], {"load_source": 0x037fd034, "literal_address": 0x037fd0cc,
                                           "target": 0x03808430, "mapping": "autoload0_bss", "bss_offset": 0x1e8,
                                           "branch_source": 0x037fd040, "condition": "ne", "passed": 0x037fd0c0,
                                           "failed": 0x037fd044, "write_source": 0x037fd048})
            self.assertEqual([c["source"] for c in row["calls"]],
                             [0x037fd04c,0x037fd058,0x037fd060,0x037fd06c,0x037fd074,0x037fd080,
                              0x037fd088,0x037fd094,0x037fd09c,0x037fd0a8,0x037fd0b0,0x037fd0bc])
            self.assertEqual([c["target"] for c in row["calls"]], [0x037fcf84,0x037fcf18,0x037fcf2c,0x037fcf04] * 3)
            self.assertEqual([c["id"] for c in row["calls"]], [1] * 4 + [7] * 4 + [8] * 4)
            self.assertEqual([c["argument_from_return"] for c in row["calls"]], [False,True,False,True] * 3)
            self.assertEqual(row["unknown_bx_sources"], [0x037fd014,0x037fd028,0x037fd0c8])
            with self.assertRaisesRegex(AssertionError, "initialized"):
                module.read_initialized(row["image"], row["layout"]["regions"][1], 0x03808430, 4)


class NativeInitializer(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.available = (HERE / 'reproduce.py').exists()
        if cls.available:
            import sys
            sys.path.insert(0, str(HERE))
            import reproduce
            cls.temp = tempfile.TemporaryDirectory()
            cls.root = Path(cls.temp.name) / 'replay'
            cls.receipt = json.loads(reproduce.replay(cls.root).read_text())

    @classmethod
    def tearDownClass(cls):
        if cls.available:
            cls.temp.cleanup()

    def ready(self):
        self.assertTrue(self.available, 'actual five-object native replay is missing')

    def test_actual_call_relocations_and_both_complete_images(self):
        self.ready()
        rows = self.receipt['candidates']
        self.assertEqual([r['role'] for r in rows], ['lower_store','upper_store','lower_getter','upper_getter','initializer'])
        self.assertEqual([r['elf']['object_sha256'][:8] for r in rows], ['b0bd6f1c','03aebe3e','9704c69a','b392c58e','47a79e6c'])
        init = rows[-1]
        rels = init['elf']['relocations']
        self.assertEqual([(r['offset'],r['type'],r['addend']) for r in rels],
                         [(o,1,-8) for o in (32,44,52,64,72,84,92,104,112,124,132,144)] + [(160,2,0)])
        self.assertEqual(init['elf']['discarded_section_relocations'][0]['symbol'], 'arm7_arena_init_trial')
        for program in self.receipt['programs']:
            positive = program['positive']
            self.assertEqual(positive['native_command']['returncode'], 0)
            self.assertEqual(positive['image_sha256'], '0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139')
            self.assertEqual(positive['image_bytes'], 165552)
            self.assertEqual(len(positive['segments']), 6)
            self.assertEqual(positive['BSS_bytes'], 21424)
            self.assertEqual(positive['image_mismatch_offsets'], [])
            self.assertTrue(positive['noncandidate_bytes_unchanged'])
            self.assertEqual([c['map_vma'] for c in positive['candidates']], [0x037fcf04,0x037fcf18,0x037fcf2c,0x037fcf84,0x037fd02c])
            self.assertEqual([c['map_bytes'] for c in positive['candidates']], [20,20,88,128,164])
            self.assertEqual([c['target'] for c in positive['initializer_calls']], [0x037fcf84,0x037fcf18,0x037fcf2c,0x037fcf04] * 3)
            self.assertEqual(positive['observed_bindings']['guard'], 0x03808430)

    def test_actual_wrong_guard_and_callee_outputs_are_rejected(self):
        self.ready()
        for program in self.receipt['programs']:
            guard = program['wrong_guard']
            self.assertEqual(guard['native_command']['returncode'], 0)
            self.assertEqual(guard['observed_bindings']['guard'], 0x03808434)
            self.assertEqual(guard['image_mismatch_offsets'], [21116])
            self.assertIn('original image mismatch', guard['strict_rejection'])
            callee = program['wrong_callee']
            self.assertEqual(callee['native_command']['returncode'], 0)
            self.assertEqual([c['target'] for c in callee['actual_initializer_calls']], [0x037fcf84,0x037fcf04,0x037fcf2c,0x037fcf18] * 3)
            self.assertTrue(callee['strict_rejection'])
            self.assertNotEqual(callee['linked_elf_sha256'], program['positive']['linked_elf_sha256'])

    def test_actual_wrong_placement_and_malformed_segment_reject(self):
        self.ready()
        for program in self.receipt['programs']:
            self.assertNotEqual(program['wrong_placement']['returncode'], 0)
            self.assertTrue(program['malformed_load']['rejected'])
            self.assertEqual(program['malformed_load']['wrong_offset'], program['malformed_load']['old_offset'] + 4)

    def test_each_actual_omitted_input_rejects(self):
        self.ready()
        roles = ['lower_store','upper_store','lower_getter','upper_getter','initializer']
        for program in self.receipt['programs']:
            self.assertEqual(list(program['omitted']), roles)
            for role, omission in program['omitted'].items():
                self.assertNotEqual(omission['returncode'], 0)
                self.assertNotIn(role + '.o', omission['input_sha256'])
                self.assertEqual(len(omission['input_sha256']), len(program['input_sha256']) - 1)

if __name__ == "__main__":
    unittest.main()
