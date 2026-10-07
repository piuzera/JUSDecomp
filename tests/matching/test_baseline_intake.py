"""Public tests: synthetic inputs only; no original game bytes."""
import hashlib
import importlib.util
import struct
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/baseline_intake.py'


class IntakeIdentityTests(unittest.TestCase):
    def test_wrong_rom_is_rejected_before_header_parsing_or_output(self):
        with tempfile.TemporaryDirectory() as directory:
            directory = Path(directory)
            rom = directory / 'wrong.nds'
            rom.write_bytes(b'public synthetic wrong ROM')
            output = directory / 'manifest.json'
            result = subprocess.run(
                [sys.executable, str(SCRIPT), '--rom', str(rom), '--output', str(output)],
                capture_output=True, text=True,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('ROM SHA1 mismatch', result.stderr)
            self.assertIn('ba58e20ee60eb81c33dcd4934a21271baa9f954a', result.stderr)
            self.assertFalse(output.exists())

    def test_wrong_rom_does_not_overwrite_existing_manifest(self):
        with tempfile.TemporaryDirectory() as directory:
            directory = Path(directory)
            rom = directory / 'wrong.nds'
            rom.write_bytes(b'public synthetic wrong ROM')
            output = directory / 'manifest.json'
            output.write_text('existing manifest', encoding='utf-8')
            result = subprocess.run(
                [sys.executable, str(SCRIPT), '--rom', str(rom), '--output', str(output)],
                capture_output=True, text=True,
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('ROM SHA1 mismatch', result.stderr)
            self.assertEqual(output.read_text(encoding='utf-8'), 'existing manifest')


def load_intake():
    spec = importlib.util.spec_from_file_location('baseline_intake', SCRIPT)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def synthetic_rom():
    data = bytearray(0x1000)
    data[:12] = b'TEST' + bytes(8)
    data[12:16] = b'TSTJ'
    data[16:18] = b'01'
    data[0x1E] = 3
    struct.pack_into('<4I', data, 0x20, 0x200, 0x02000800, 0x02000000, 16)
    struct.pack_into('<4I', data, 0x30, 0x210, 0x02380000, 0x02380000, 16)
    struct.pack_into('<2I', data, 0x48, 0x300, 24)
    struct.pack_into('<2I', data, 0x50, 0x400, 64)
    struct.pack_into('<2I', data, 0x58, 0, 0)
    struct.pack_into('<2I', data, 0x80, len(data), 0x200)
    data[0x200:0x210] = b'public ARM9 test'
    data[0x210:0x220] = b'public ARM7 test'
    struct.pack_into('<6I', data, 0x300, 0x500, 0x520, 0x520, 0x540, 0x600, 0x1000)
    for index, ident in enumerate((9, 13)):
        struct.pack_into('<8I', data, 0x400 + index * 32,
                         ident, 0x02100000, 32, 16, 0, 0, index, 0)
    child = data[0x600:0x1000]
    child[:12] = b'CHILD' + bytes(7)
    child[12:16] = b'CHLJ'
    struct.pack_into('<4I', child, 0x20, 0x200, 0x02000000, 0x02000000, 16)
    struct.pack_into('<4I', child, 0x30, 0x210, 0x02380000, 0x02380000, 16)
    child[0x200:0x210] = b'public child cpu'
    child[0x210:0x220] = b'public ARM7 test'
    data[0x600:0x1000] = child
    return bytes(data)


class IntakeInventoryTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(hasattr(load_intake(), 'inventory_rom'), 'ROM inventory API missing')

    def test_header_and_modules_are_metadata_with_zero_source_coverage(self):
        intake = load_intake()
        data = synthetic_rom()
        manifest = intake.inventory_rom(data)
        self.assertEqual(manifest['rom']['sha256'], hashlib.sha256(data).hexdigest())
        self.assertEqual(manifest['rom']['size_bytes'], 4096)
        self.assertEqual(manifest['rom']['header']['game_code'], 'TSTJ')
        self.assertEqual(manifest['rom']['header']['revision'], 3)
        self.assertEqual(manifest['modules'][0]['rom_size_bytes'], 16)
        self.assertEqual(manifest['modules'][0]['entry_address'], 0x02000800)
        self.assertEqual(manifest['modules'][1]['build_status'], 'unbuilt')
        self.assertEqual(manifest['source_coverage']['reconstructed_bytes'], 0)
        self.assertEqual(manifest['source_coverage']['percent'], 0)
        self.assertFalse(manifest['baseline_verified'])
        self.assertNotIn('public ARM9 test', str(manifest))

    def test_identical_overlay_content_preserves_distinct_ids(self):
        manifest = load_intake().inventory_rom(synthetic_rom())
        overlays = manifest['overlays']['arm9']
        self.assertEqual([item['id'] for item in overlays], [9, 13])
        self.assertEqual(overlays[0]['sha256'], overlays[1]['sha256'])
        self.assertEqual(overlays[0]['bss_size_bytes'], 16)
        self.assertEqual(manifest['overlays']['arm7'], [])

    def test_embedded_executable_is_present_and_unbuilt(self):
        manifest = load_intake().inventory_rom(
            synthetic_rom(), embedded_files=[('ChildRom/test.srl', 2)])
        child = manifest['embedded_executables'][0]
        self.assertEqual(child['path'], 'ChildRom/test.srl')
        self.assertEqual(child['file_id'], 2)
        self.assertEqual(child['build_status'], 'unbuilt')
        self.assertEqual(child['header']['game_code'], 'CHLJ')
        self.assertEqual(child['modules'][1]['sha256'], manifest['modules'][1]['sha256'])

    def test_invalid_region_is_rejected(self):
        data = bytearray(synthetic_rom())
        struct.pack_into('<I', data, 0x20, len(data))
        with self.assertRaisesRegex(ValueError, 'outside ROM'):
            load_intake().inventory_rom(bytes(data))


if __name__ == '__main__':
    unittest.main()
