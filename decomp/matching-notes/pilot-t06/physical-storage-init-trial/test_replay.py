"""Actual-original artifact boundary tests; no compiler or fabricated processes."""
import importlib.util
import os
import struct
import sys
import tempfile
import unittest
from pathlib import Path

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / 'tools/scripts'))
from native_link import Elf32
from source_build import compare_objects

CAPSULE = Path(__file__).resolve().parent
REFERENCE = Path(os.environ['JUS37_REFERENCE'])


def mutations(data):
    elf = Elf32(data)
    symbols = elf.symbols()
    ident = next(i for i, s in enumerate(symbols) if elf.symbol_name(s) == 'func_0202c4ac')
    sym_offset = elf.sections[elf.sym_index][4] + ident * 16
    text_index = symbols[ident][5]
    text = elf.sections[text_index]
    rela_index = next(i for i, s in enumerate(elf.sections) if s[1] == 4 and s[7] == text_index)
    rela = elf.sections[rela_index]
    changes = {}
    changed = bytearray(data); struct.pack_into('<I', changed, sym_offset + 8, 84); changes['extent84'] = bytes(changed)
    changed = bytearray(data); struct.pack_into('<I', changed, sym_offset + 4, 1); changes['thumb_mode'] = bytes(changed)
    changed = bytearray(data); changed[text[4] + 8] ^= 1; changes['instruction'] = bytes(changed)
    changed = bytearray(data); struct.pack_into('<I', changed, elf.sh_offset + text_index * 40 + 20, 96); changes['pool_extent'] = bytes(changed)
    changed = bytearray(data); struct.pack_into('<I', changed, rela[4] + 4, (next(i for i,s in enumerate(symbols) if elf.symbol_name(s)=='data_02098708') << 8) | 1); changes['helper_symbol'] = bytes(changed)
    changed = bytearray(data); struct.pack_into('<i', changed, rela[4] + 8, -4); changes['helper_addend'] = bytes(changed)
    changed = bytearray(data); changed[text[4] + 84] ^= 1; changes['pool_placeholder'] = bytes(changed)
    # A new actual allocated section points to four existing file bytes. No fixture ELF is substituted.
    headers = [list(s) for s in elf.sections]
    headers.append([headers[4][0], 1, 2, 0, text[4], 4, 0, 0, 4, 0])
    changed = bytearray(data); changed += bytes((-len(changed)) % 4); new_offset = len(changed)
    changed += b''.join(struct.pack('<10I', *s) for s in headers)
    struct.pack_into('<I', changed, 32, new_offset); struct.pack_into('<H', changed, 48, len(headers)); changes['extra_allocated'] = bytes(changed)
    return changes


def gate(path):
    implementation = CAPSULE / 'replay.py'
    if not implementation.exists():
        # Red baseline executes the real existing comparator, which trusts its reference.
        return compare_objects(path, path, ['func_0202c4ac'])
    spec = importlib.util.spec_from_file_location('jus37_replay', implementation)
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    return module.require_reference(path)


class OriginalBoundaryTests(unittest.TestCase):
    def test_original_copy_is_supported(self):
        self.assertTrue(REFERENCE.is_file(), 'Run fresh original preflight first')
        gate(REFERENCE)

    def test_selfconsistent_wrong_reference_is_rejected(self):
        data = REFERENCE.read_bytes()
        with tempfile.TemporaryDirectory() as directory:
            for name, changed in mutations(data).items():
                with self.subTest(mutation=name):
                    path = Path(directory) / (name + '.o'); path.write_bytes(changed)
                    with self.assertRaises(ValueError):
                        gate(path)
        self.assertEqual(REFERENCE.read_bytes(), data)


if __name__ == '__main__':
    unittest.main()
