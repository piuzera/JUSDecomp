"""Full-ROM checks use an invented NDS layout and payloads, never game bytes."""
import hashlib
import importlib.util
import struct
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/rom_roundtrip.py'


def hashes(data):
    return {'sha1': hashlib.sha1(data).hexdigest(), 'sha256': hashlib.sha256(data).hexdigest()}


def fixture():
    rom = bytearray(b'\xff' * 0x1000)
    rom[:0x200] = bytes(0x200)
    rom[:12] = b'PUBLIC TEST\0'
    struct.pack_into('<4I', rom, 0x20, 0x200, 0x02000000, 0x02000000, 164)
    struct.pack_into('<4I', rom, 0x30, 0x300, 0x02380000, 0x02380000, 16)
    struct.pack_into('<2I', rom, 0x40, 0x780, 21)
    struct.pack_into('<2I', rom, 0x48, 0x700, 128)
    struct.pack_into('<2I', rom, 0x50, 0x400, 448)
    struct.pack_into('<2I', rom, 0x58, 0, 0)
    struct.pack_into('<2I', rom, 0x80, 0xa20, 0x200)
    rom[0x200:0x280] = bytes(range(128))
    struct.pack_into('<9I', rom, 0x210, 0x0200008c, 0x020000a4,
                     0x02000080, 0x02000080, 0x02000100, 0,
                     0x03017534, 0xdec00621, 0x2106c0de)
    rom[0x280:0x288] = b'ITCMTEST'
    rom[0x288:0x28c] = b'DTCM'
    struct.pack_into('<6I', rom, 0x28c, 0x01ff8000, 8, 0, 0x027c0000, 4, 0)
    rom[0x300:0x310] = b'PRESERVED ARM7!!'
    overlays = []
    for ident in range(14):
        start = 0x800 + ident * 32
        payload = bytes([ident]) * 32
        rom[start:start + 32] = payload
        struct.pack_into('<8I', rom, 0x400 + ident * 32,
                         ident, 0x02100000, 32, 0, 0, 0, ident, 0)
        struct.pack_into('<2I', rom, 0x700 + ident * 8, start, start + 32)
        overlays.append({'id': ident, 'base': '0x02100000', 'bytes': 32,
                         'bss_bytes': 0, 'file_id': ident, 'flags': '0x00000000',
                         'compressed': False, 'rom_offset': hex(start), 'hashes': hashes(payload)})
    struct.pack_into('<4I', rom, 0x770, 0xa00, 0xa10, 0xa10, 0xa20)
    struct.pack_into('<IHH', rom, 0x780, 8, 14, 1)
    rom[0x788:0x795] = b'\x05a.bin\x05b.bin\0'
    rom[0xa00:0xa10] = b'ASSET A PRESERVE'
    rom[0xa10:0xa20] = b'ASSET B PRESERVE'
    regions = {'rom': {'bytes': len(rom), 'hashes': hashes(rom)}, 'regions': {
        'arm9': {'rom_offset': '0x200', 'stored_bytes': 164,
                 'module_params': {'offset': '0x10', 'compressed_static_end': '0x0'},
                 'main': {'rom_offset': '0x200', 'base': '0x02000000', 'bytes': 128,
                          'bss_bytes': 128, 'hashes': hashes(rom[0x200:0x280])},
                 'autoloads': [
                     {'kind': 'ITCM', 'rom_offset': '0x280', 'base': '0x01ff8000',
                      'bytes': 8, 'bss_bytes': 0, 'hashes': hashes(rom[0x280:0x288])},
                     {'kind': 'DTCM', 'rom_offset': '0x288', 'base': '0x027c0000',
                      'bytes': 4, 'bss_bytes': 0, 'hashes': hashes(rom[0x288:0x28c])}]},
        'arm9_overlays': overlays}}
    return bytes(rom), regions


class RomRoundtripTests(unittest.TestCase):
    def setUp(self):
        self.original, self.regions = fixture()

    def tool(self):
        self.assertTrue(SCRIPT.exists(), 'full-ROM roundtrip implementation missing')
        sys.path.insert(0, str(ROOT / 'tools/scripts'))
        spec = importlib.util.spec_from_file_location('rom_roundtrip', SCRIPT)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        return module

    def altered(self, offset):
        result = bytearray(self.original)
        result[offset] ^= 1
        return bytes(result)

    def test_exact_whole_rom_passes_with_preserved_binaries_zero_source(self):
        result = self.tool().verify_repacked_rom(self.original, self.original, self.regions)
        self.assertEqual(result['status'], 'passed')
        self.assertEqual(result['rom']['sha256'], hashes(self.original)['sha256'])
        self.assertEqual(result['preserved_source_bytes'], 0)
        self.assertEqual(result['arm9_modules_checked'], 17)

    def test_header_mutation_fails_header_check(self):
        with self.assertRaisesRegex(ValueError, 'header'):
            self.tool().verify_repacked_rom(self.original, self.altered(0), self.regions)

    def test_overlay_id_mutation_fails_overlay_table_check(self):
        with self.assertRaisesRegex(ValueError, 'overlay table'):
            self.tool().verify_repacked_rom(self.original, self.altered(0x400), self.regions)

    def test_fat_reordering_fails_filesystem_ordering_check(self):
        changed = bytearray(self.original)
        changed[0x770:0x780] = self.original[0x778:0x780] + self.original[0x770:0x778]
        with self.assertRaisesRegex(ValueError, 'filesystem ordering'):
            self.tool().verify_repacked_rom(self.original, changed, self.regions)

    def test_fnt_reordering_fails_filesystem_ordering_check(self):
        changed = bytearray(self.original)
        changed[0x788:0x794] = self.original[0x78e:0x794] + self.original[0x788:0x78e]
        with self.assertRaisesRegex(ValueError, 'filesystem ordering'):
            self.tool().verify_repacked_rom(self.original, changed, self.regions)

    def test_overlay_compression_flag_fails_compression_check(self):
        with self.assertRaisesRegex(ValueError, 'compression encoding'):
            self.tool().verify_repacked_rom(self.original, self.altered(0x41f), self.regions)

    def test_arm9_compression_pointer_fails_compression_check(self):
        with self.assertRaisesRegex(ValueError, 'compression encoding'):
            self.tool().verify_repacked_rom(self.original, self.altered(0x224), self.regions)

    def test_executable_byte_fails_arm9_payload_check(self):
        for offset in (0x200, 0x280, 0x288, 0x800, 0x920, 0x9a0):
            with self.subTest(offset=offset), self.assertRaisesRegex(ValueError, 'ARM9 executable'):
                self.tool().verify_repacked_rom(self.original, self.altered(offset), self.regions)

    def test_original_autoload_table_cannot_be_normalized(self):
        with self.assertRaisesRegex(ValueError, 'autoload table'):
            self.tool().verify_repacked_rom(self.original, self.altered(0x28c), self.regions)

    def test_preserved_arm7_assets_and_padding_each_have_checks(self):
        for offset, message in ((0x300, 'ARM7'), (0xa00, 'asset'), (0xfff, 'padding')):
            with self.subTest(offset=offset), self.assertRaisesRegex(ValueError, message):
                self.tool().verify_repacked_rom(self.original, self.altered(offset), self.regions)

    def module_files(self, directory):
        directory.mkdir()
        data = [('arm9.bin', 0x200, 128), ('itcm.bin', 0x280, 8), ('dtcm.bin', 0x288, 4)]
        data += [(f'arm9_ov{i:03}.bin', 0x800 + i * 32, 32) for i in range(14)]
        for name, offset, size in data:
            (directory / name).write_bytes(self.original[offset:offset + size])

    def test_rebuild_reads_and_records_all_linked_modules_including_stubs(self):
        with tempfile.TemporaryDirectory() as directory:
            module_dir = Path(directory) / 'modules'
            self.module_files(module_dir)
            rebuilt, writes = self.tool().rebuild_rom(self.original, module_dir, self.regions)
            self.assertEqual(rebuilt, self.original)
            self.assertEqual(len(writes), 17)
            self.assertEqual([w['module'] for w in writes][-5:], ['OV009', 'OV010', 'OV011', 'OV012', 'OV013'])
            (module_dir / 'arm9_ov009.bin').unlink()
            with self.assertRaisesRegex(ValueError, 'missing.*OV009'):
                self.tool().rebuild_rom(self.original, module_dir, self.regions)

    def test_wrong_linked_payload_fails_before_repack_success(self):
        with tempfile.TemporaryDirectory() as directory:
            module_dir = Path(directory) / 'modules'
            self.module_files(module_dir)
            (module_dir / 'arm9.bin').write_bytes(self.altered(0x200)[0x200:0x280])
            with self.assertRaisesRegex(ValueError, 'linked.*ARM9'):
                self.tool().rebuild_rom(self.original, module_dir, self.regions)

    def test_copied_success_report_without_actual_artifacts_cannot_roundtrip(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            rom = root / 'original.nds'
            rom.write_bytes(self.original)
            tool = self.tool()
            stages = getattr(tool.build_verifier, 'SOURCE_MODULE_STAGES', tool.build_verifier.SOURCE_STAGES)
            report = {'status': 'passed', 'source_build': {'status': 'passed', 'accepted_units': 1},
                      'artifact_hashes': {'native-link/linked.elf': '0' * 64}, 'started_ns': 1,
                      'stages': [{'name': name, 'status': 'passed', 'exit_status': 0} for name in stages]}
            output = root / 'repacked.nds'
            with self.assertRaisesRegex(ValueError, 'actual|artifact|source'):
                tool.roundtrip_rom(rom, root / 'copied-build', self.regions, report, output)
            self.assertFalse(output.exists())

    def test_copied_success_hash_cannot_hide_changed_actual_build_file(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            rom = root / 'original.nds'
            rom.write_bytes(self.original)
            build = root / 'build'
            native = build / 'native-link'
            native.mkdir(parents=True)
            artifact = native / 'linked.elf'
            artifact.write_bytes(b'public original artifact')
            expected = hashes(artifact.read_bytes())['sha256']
            artifact.write_bytes(b'public changed artifact')
            tool = self.tool()
            stages = getattr(tool.build_verifier, 'SOURCE_MODULE_STAGES', tool.build_verifier.SOURCE_STAGES)
            report = {'status': 'passed', 'source_build': {'status': 'passed', 'accepted_units': 1},
                      'artifact_hashes': {'native-link/linked.elf': expected}, 'started_ns': 1,
                      'stages': [{'name': name, 'status': 'passed', 'exit_status': 0} for name in stages]}
            output = root / 'repacked.nds'
            with self.assertRaisesRegex(ValueError, 'actual build artifact.*changed'):
                tool.roundtrip_rom(rom, build, self.regions, report, output)
            self.assertFalse(output.exists())


if __name__ == '__main__':
    unittest.main()
