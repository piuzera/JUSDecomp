import unittest

from run import build_link_script, split_autoload0


class LinkRecipeTests(unittest.TestCase):
    def test_split_preserves_all_nonleaf_bytes(self):
        original = bytes(i % 256 for i in range(66120))
        prefix, leaf, suffix = split_autoload0(original)
        self.assertEqual((len(prefix), len(leaf), len(suffix)), (20248, 20, 45852))
        self.assertEqual(prefix + leaf + suffix, original)

    def test_script_selects_real_object_and_rejects_wrong_size(self):
        baseline = (
            ".arm7.autoload0 58687488  : AT(37224880) "
            "{ autoload0.o(.arm7.autoload0) } :p4\n"
            'ASSERT(SIZEOF(.arm7.autoload0) == 66120, "size")\n'
            ".arm7.bss.autoload0 58753608 (NOLOAD) : AT(58753608) "
            "{ autoload0.o(.arm7.bss.autoload0) } :p5\n"
        )
        result = build_link_script(baseline)
        self.assertIn("compiled.o(.text)", result)
        self.assertIn("ASSERT(__leaf_end - __leaf_start == 20", result)
        self.assertIn("prefix.o(.arm7.autoload0.prefix)", result)
        self.assertIn("suffix.o(.arm7.autoload0.suffix)", result)
        self.assertNotIn("autoload0.o(.arm7.autoload0)", result)
        self.assertIn("bss0.o(.arm7.bss.autoload0)", result)
        self.assertNotIn("autoload0.o(.arm7.bss.autoload0)", result)


if __name__ == "__main__":
    unittest.main()
