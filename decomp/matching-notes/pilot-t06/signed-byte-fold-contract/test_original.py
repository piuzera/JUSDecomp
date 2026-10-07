"""Actual original object boundary controls; require a fresh explicit output."""
import importlib.util
import os
import shutil
import struct
import sys
import tempfile
import unittest
from pathlib import Path
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[4]
sys.path.insert(0, str(ROOT / 'tools/scripts'))
from native_link import Elf32
CAPSULE = Path(__file__).resolve().parent
ORIGINAL = Path(os.environ['JUS38_ORIGINAL_OUTPUT'])


def gate(paths):
    implementation = CAPSULE / 'check_original.py'
    if not implementation.exists():
        # Actual ELF parser baseline accepts self-consistent changed originals.
        return [Elf32(p.read_bytes()) for p in paths]
    spec = importlib.util.spec_from_file_location('hash_original', implementation)
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    return module.inspect_objects(paths)


class OriginalControls(unittest.TestCase):
    def test_fresh_original_inventory_passes(self):
        gate(sorted((ORIGINAL / 'delinks').glob('*.o')))

    def test_actual_changed_original_objects_reject(self):
        source = ORIGINAL / 'delinks/_dsd_gap@main_5.o'
        data = source.read_bytes(); elf = Elf32(data); symbols = elf.symbols()
        index = next(i for i, s in enumerate(symbols) if elf.symbol_name(s) == 'func_020326b0')
        function = symbols[index]; section = elf.sections[function[5]]
        first_rela = next(s for s in elf.sections if s[1] == 4 and any(elf.symbol_name(symbols[info >> 8]) == 'func_020326b0' for _, info, _ in struct.iter_unpack('<IIi', elf.content(s))))
        offset = next(i for i, (_, info, _) in enumerate(struct.iter_unpack('<IIi', elf.content(first_rela))) if elf.symbol_name(symbols[info >> 8]) == 'func_020326b0')
        changes = {}
        changed = bytearray(data); changed[section[4] + function[1] + 8] ^= 1; changes['instruction'] = bytes(changed)
        changed = bytearray(data); struct.pack_into('<I', changed, elf.sections[elf.sym_index][4] + index * 16 + 8, 40); changes['extent40'] = bytes(changed)
        changed = bytearray(data); old_addend = struct.unpack_from('<i', changed, first_rela[4] + offset * 12 + 8)[0]; struct.pack_into('<i', changed, first_rela[4] + offset * 12 + 8, old_addend + 4); changes['incoming_addend'] = bytes(changed)
        changed = bytearray(data); info = struct.unpack_from('<I', changed, first_rela[4] + offset * 12 + 4)[0]; other = next(i for i, s in enumerate(symbols) if elf.symbol_name(s) == 'func_0202c4ac'); struct.pack_into('<I', changed, first_rela[4] + offset * 12 + 4, (other << 8) | (info & 255)); changes['incoming_target'] = bytes(changed)
        with tempfile.TemporaryDirectory() as directory:
            for name, content in changes.items():
                with self.subTest(change=name):
                    self.assertNotEqual(content, data, 'mutation must actually change original bytes')
                    paths = sorted((ORIGINAL / 'delinks').glob('*.o'))
                    altered = Path(directory) / source.name; altered.write_bytes(content)
                    paths[paths.index(source)] = altered
                    with self.assertRaises(ValueError): gate(paths)
        self.assertEqual(source.read_bytes(), data)


if __name__ == '__main__': unittest.main()
