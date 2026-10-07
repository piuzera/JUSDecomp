"""Public synthetic checks for the bounded dsd 0.12 native linker experiment."""
import importlib.util
import hashlib
import json
import struct
import shutil
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

SCRIPT = Path(__file__).resolve().parents[2] / 'tools/scripts/native_link.py'


def module():
    spec = importlib.util.spec_from_file_location('native_link', SCRIPT)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def fixture():
    # dsd-like interleaved global/local table with a Thumb function, RELA ABS32,
    # and legacy PC24 BL relocation; all bytes here are invented.
    names = b'\0.text\0.data\0.symtab\0.strtab\0.rela.data\0.shstrtab\0.rela.text\0'
    strings = b'\0thumb_func\0$t\0'
    sym = b''.join(struct.pack('<IIIBBH', *s) for s in (
        (0, 0, 0, 0, 0, 0), (0, 0, 0, 3, 0, 1),
        (1, 0, 4, 0x10, 0, 1), (12, 0, 0, 0, 0, 1)))
    contents = [b'', struct.pack('<I', 0xEB000000), bytes(4), sym, strings,
                struct.pack('<IIi', 0, (2 << 8) | 2, 0), names,
                struct.pack('<IIi', 0, (2 << 8) | 1, -8)]
    fields = [(0,0,0,0,0,0), (1,1,6,0,0,4), (7,1,3,0,0,4),
              (13,2,0,4,4,16), (21,3,0,0,0,1), (29,4,0,3,2,12),
              (40,3,0,0,0,1), (50,4,0,3,1,12)]
    data = bytearray(52)
    headers = []
    for content, (name, kind, flags, link, info, entry) in zip(contents, fields):
        data += bytes((-len(data)) % 4)
        headers.append((name, kind, flags, 0, len(data), len(content), link, info, 4, entry))
        data += content
    offset = len(data)
    for header in headers:
        data += struct.pack('<10I', *header)
    struct.pack_into('<16sHHIIIIIHHHHHH', data, 0,
                     b'\x7fELF\x01\x01\x01' + bytes(9), 1, 40, 1, 0, 0, offset,
                     0, 52, 0, 0, 40, len(headers), 6)
    return bytes(data)


def branch_fixture(mode='arm', target=None, definition='destination', binding=1,
                   target_binding=1, mapping=True):
    """Invented split-object calls and return bodies, with legacy NOTYPE labels."""
    strings=bytearray(b'\0')
    def name(value):
        offset=len(strings);strings.extend(value.encode()+b'\0');return offset
    symbols=[(0,0,0,0,0,0)]
    if mapping:symbols.append((name('$a' if mode=='arm' else '$t'),0,0,0,0,1))
    if target:
        symbols.append((name('caller'),0,4,0x12,0,1))
        ident=len(symbols);symbols.append((name(target),0,0,target_binding<<4,0,0))
        text=struct.pack('<I',0xEB000000) if mode=='arm' else struct.pack('<HH',0xF000,0xF800)
        rela=struct.pack('<IIi',0,(ident<<8)|(1 if mode=='arm' else 10),-8 if mode=='arm' else -4)
    else:
        symbols.append((name(definition),0,4,binding<<4,0,1))
        text=struct.pack('<I',0xE12FFF1E) if mode=='arm' else struct.pack('<HH',0x4770,0x46C0)
        rela=b''
    contents=[b'',text,b''.join(struct.pack('<IIIBBH',*s) for s in symbols),bytes(strings),rela,b'']
    specs=[('',0,0,0,0,0),('.text',1,6,0,0,4),('.symtab',2,0,3,len(symbols),16),
           ('.strtab',3,0,0,0,1),('.rela.text',4,0,2,1,12),('.shstrtab',3,0,0,0,1)]
    names=bytearray(b'\0');offsets=[]
    for spec in specs:offsets.append(len(names));names.extend(spec[0].encode()+b'\0')
    contents[5]=bytes(names);data=bytearray(52);headers=[]
    for offset,content,spec in zip(offsets,contents,specs):
        data+=bytes((-len(data))%4);_,kind,flags,link,info,entry=spec
        headers.append((offset,kind,flags,0,len(data),len(content),link,info,4,entry));data+=content
    shoff=len(data)
    for header in headers:data+=struct.pack('<10I',*header)
    struct.pack_into('<16sHHIIIIIHHHHHH',data,0,b'\x7fELF\x01\x01\x01'+bytes(9),1,40,1,0,0,shoff,0,52,0,0,40,len(headers),5)
    return bytes(data)


class NativeLinkTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(SCRIPT.exists(), 'native linker adapter missing')

    def test_normalizes_symbol_partition_thumb_and_rela_references(self):
        tool = module()
        normalized = tool.normalize_object(fixture())
        elf = tool.Elf32(normalized)
        symbols = elf.symbols()
        self.assertEqual(elf.sections[3][7], 3)
        self.assertTrue(all(symbol[3] >> 4 == 0 for symbol in symbols[:3]))
        self.assertEqual(symbols[3][1], 1)
        self.assertEqual(symbols[3][3] & 15, 2)
        self.assertEqual(struct.unpack_from('<IIi', normalized, elf.sections[5][4]),
                         (0, (3 << 8) | 2, 0))
        self.assertEqual(struct.unpack_from('<IIi', normalized, elf.sections[7][4]),
                         (0, (3 << 8) | 28, -8))

    def split_trial(self, root, caller_mode, target_mode, *, overrides=False, local=False, unused=False,
                    definition_override=False, weak=False):
        lld=shutil.which('ld.lld');clang='/opt/homebrew/opt/llvm/bin/clang'
        if not lld or not Path(clang).is_file():self.skipTest('native LLVM ARM tools unavailable')
        objects=root/'objects';objects.mkdir()
        caller=branch_fixture(caller_mode,target='destination',target_binding=2 if weak else 1)
        (objects/'caller.o').write_bytes(branch_fixture('arm',target='stale_reference') if overrides else caller)
        definition=branch_fixture(target_mode,binding=2 if weak else 1)
        (objects/'destination.o').write_bytes(branch_fixture('thumb') if definition_override else definition)
        selected=['caller.o(.text)','destination.o(.text)']
        if local:
            (objects/'local.o').write_bytes(branch_fixture('thumb',binding=0));selected.append('local.o(.text)')
        if unused:(objects/'unused.o').write_bytes(b'not an ELF; unselected input')
        lcf=root/'test.lcf';lcf.write_text('MEMORY {\n ARM9 : ORIGIN = 0x02000000 > build/arm9.bin\n}\nSECTIONS {\n .arm9 : { ARM9_TEXT_START = .; '+ ' '.join(selected)+' ARM9_BSS_START = .; } > ARM9\n}\n')
        args=[sys.executable,str(SCRIPT),'--lcf',str(lcf),'--objects',str(objects),'--output',str(root/'out'),'--lld',lld,'--clang',clang]
        replacements={}
        if overrides:
            compiled=root/'compiled.o';compiled.write_bytes(caller);replacements['caller.o']=str(compiled)
        if definition_override:
            compiled=root/'compiled-definition.o';compiled.write_bytes(definition);replacements['destination.o']=str(compiled)
        if replacements:
            mapping=root/'overrides.json';mapping.write_text(json.dumps(replacements));args+=['--source-objects',str(mapping)]
        return subprocess.run(args,capture_output=True,text=True),caller

    def test_actual_split_thumb_caller_to_arm_notype_definition(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);result,_=self.split_trial(root,'thumb','arm')
            self.assertEqual(result.returncode,0,result.stderr)
            sys.path.insert(0,str(SCRIPT.parent))
            try:from relocation_check import _decode_branch
            finally:sys.path.pop(0)
            target,mode,call=_decode_branch(10,(root/'out/arm9.bin').read_bytes()[:4],0x02000000)
            self.assertEqual((target,mode,call),(0x02000004,'a',True))
            tool=module()
            for name,raw in [('caller.o',branch_fixture('thumb',target='destination')),
                             ('destination.o',branch_fixture('arm'))]:
                normalized=tool.Elf32((root/'out/objects'/name).read_bytes());original=tool.Elf32(raw)
                self.assertEqual(normalized.content(normalized.sections[1]),original.content(original.sections[1]))

    def test_actual_split_arm_caller_to_thumb_notype_definition(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);result,_=self.split_trial(root,'arm','thumb')
            self.assertEqual(result.returncode,0,result.stderr)
            sys.path.insert(0,str(SCRIPT.parent))
            try:from relocation_check import _decode_branch
            finally:sys.path.pop(0)
            target,mode,call=_decode_branch(1,(root/'out/arm9.bin').read_bytes()[:4],0x02000000)
            self.assertEqual((target,mode,call),(0x02000004,'t',True))

    def test_external_typing_does_not_leak_to_same_named_local(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);result,_=self.split_trial(root,'thumb','arm',local=True)
            self.assertEqual(result.returncode,0,result.stderr)
            tool=module();global_elf=tool.Elf32((root/'out/objects/destination.o').read_bytes())
            local_elf=tool.Elf32((root/'out/objects/local.o').read_bytes())
            global_symbol=next(s for s in global_elf.symbols() if global_elf.symbol_name(s)=='destination')
            local_symbol=next(s for s in local_elf.symbols() if local_elf.symbol_name(s)=='destination')
            self.assertEqual(global_symbol[3]&15,2)
            self.assertEqual((local_symbol[3]&15,local_symbol[1]),(0,0))

    def test_cross_typing_inventory_uses_override_bytes_and_excludes_unused_refs(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);result,caller=self.split_trial(root,'thumb','arm',overrides=True,unused=True)
            self.assertEqual(result.returncode,0,result.stderr)
            tool=module();elf=tool.Elf32((root/'out/objects/destination.o').read_bytes())
            symbol=next(s for s in elf.symbols() if elf.symbol_name(s)=='destination')
            self.assertEqual(symbol[3]&15,2)
            record=json.loads((root/'out/link-inputs.json').read_text())
            self.assertEqual([r['filename'] for r in record['objects']],['caller.o','destination.o'])
            self.assertEqual(record['objects'][0]['compiled_sha256'],hashlib.sha256(caller).hexdigest())

    def test_external_definition_mode_comes_from_selected_source_override(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);result,_=self.split_trial(root,'thumb','arm',definition_override=True)
            self.assertEqual(result.returncode,0,result.stderr)
            tool=module();elf=tool.Elf32((root/'out/objects/destination.o').read_bytes())
            symbol=next(s for s in elf.symbols() if elf.symbol_name(s)=='destination')
            self.assertEqual((symbol[3]&15,symbol[1]),(2,0))
            record=json.loads((root/'out/link-inputs.json').read_text())['objects'][1]
            self.assertEqual(record['kind'],'source')
            self.assertEqual(record['compiled_sha256'],hashlib.sha256(branch_fixture('arm')).hexdigest())

    def test_weak_external_branch_and_weak_notype_definition_are_supported(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);result,_=self.split_trial(root,'thumb','arm',weak=True)
            self.assertEqual(result.returncode,0,result.stderr)
            tool=module();elf=tool.Elf32((root/'out/objects/destination.o').read_bytes())
            symbol=next(s for s in elf.symbols() if elf.symbol_name(s)=='destination')
            self.assertEqual((symbol[3]>>4,symbol[3]&15,symbol[1]),(2,2,0))

    def test_ambiguous_external_definition_is_rejected_before_guessing(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);references=root/'refs';references.mkdir();output=root/'out';output.mkdir()
            for name,value in {'caller.o':branch_fixture('thumb',target='destination'),
                               'a.o':branch_fixture('arm'),'b.o':branch_fixture('thumb',binding=2)}.items():
                (references/name).write_bytes(value)
            with self.assertRaisesRegex(ValueError,'ambiguous'):
                module().prepare_objects('caller.o(.text) a.o(.text) b.o(.text)',references,output,{})
            self.assertEqual(list(output.iterdir()),[])

    def test_external_notype_definition_requires_known_instruction_mapping(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);references=root/'refs';references.mkdir();output=root/'out';output.mkdir()
            (references/'caller.o').write_bytes(branch_fixture('thumb',target='destination'))
            (references/'destination.o').write_bytes(branch_fixture('arm',mapping=False))
            with self.assertRaisesRegex(ValueError,'mode'):
                module().prepare_objects('caller.o(.text) destination.o(.text)',references,output,{})
            self.assertEqual(list(output.iterdir()),[])

    def test_translates_after_as_max_end_with_bss_and_distinct_overlays(self):
        lcf = '''MEMORY {
 ARM9 : ORIGIN = 0x02000000 > build/arm9.bin
 OV000 : ORIGIN = AFTER(ARM9) > build/ov0.bin
 OV001 : ORIGIN = AFTER(ARM9) > build/ov1.bin
 SPACE : ORIGIN = AFTER(ARM9, OV000, OV001)
}
KEEP_SECTION { .init, .ctor, .exceptix }
SECTIONS {
 __CODE_HI = ADDR(SPACE);
 .arm9 : { ALIGNALL(4); a.o(.text) WRITEW(0); ARM9_BSS_START = .; a.o(.bss) } > ARM9
 .ov000 : { ALIGNALL(4); OV000_BSS_START = .; WRITEW(0); } > OV000
 .ov001 : { ALIGNALL(4); OV001_BSS_START = .; WRITEW(0); } > OV001
}'''
        translated, outputs = module().translate_lcf(lcf, Path('/public/objects'))
        self.assertIn('LONG(0)', translated)
        self.assertIn('SUBALIGN(4)', translated)
        self.assertIn('ADDR(.arm9) + SIZEOF(.arm9)', translated)
        self.assertIn('MAX(', translated)
        self.assertIn('.ov000', translated)
        self.assertIn('.ov001', translated)
        self.assertEqual(len(outputs), 3)

    def test_cli_links_rela_fixture_and_emits_elf_section_bytes(self):
        lld = shutil.which('ld.lld')
        clang = '/opt/homebrew/opt/llvm/bin/clang'
        if not Path(clang).exists():
            clang = shutil.which('clang')
        if not lld or not clang:
            self.skipTest('native LLVM ARM tools unavailable')
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            objects = root / 'objects'
            objects.mkdir()
            (objects / 'a.o').write_bytes(fixture())
            lcf = root / 'test.lcf'
            lcf.write_text("""MEMORY {
 ARM9 : ORIGIN = 0x02000000 > build/arm9.bin
 OV000 : ORIGIN = AFTER(ARM9) > build/ov0.bin
 OV001 : ORIGIN = AFTER(ARM9) > build/ov1.bin
}
SECTIONS {
 .arm9 : { ALIGNALL(4); ARM9_TEXT_START = .; a.o(.text) a.o(.data) . = ALIGN(16); ARM9_BSS_START = .; . += 32; ARM9_BSS_END = .; } > ARM9
 .ov000 : { ALIGNALL(4); WRITEW(0x11111111); OV000_BSS_START = .; } > OV000
 .ov001 : { ALIGNALL(4); WRITEW(0x22222222); OV001_BSS_START = .; } > OV001
}
""")
            # A relative output path reproduces the real pipeline invocation.
            result = subprocess.run([sys.executable, str(SCRIPT), '--lcf', str(lcf),
                                     '--objects', str(objects), '--output', 'out',
                                     '--lld', lld, '--clang', clang],
                                    cwd=root, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            binary = (root / 'out/arm9.bin').read_bytes()
            self.assertEqual(len(binary), 16)
            self.assertEqual(binary[8:], bytes(8))
            self.assertEqual(struct.unpack_from('<I', binary, 4)[0], 0x02000001)
            self.assertEqual((root / 'out/ov0.bin').read_bytes(), bytes.fromhex('11111111'))
            self.assertEqual((root / 'out/ov1.bin').read_bytes(), bytes.fromhex('22222222'))
            modules = json.loads((root / 'out/modules.json').read_text())
            self.assertEqual(modules[1]['address'], 0x02000030)
            raw = module().Elf32((root / 'out/linked.elf').read_bytes())
            view = module().Elf32((root / 'out/dsd-check.elf').read_bytes())
            self.assertIn('.arm9', [raw.section_name(s) for s in raw.sections])
            self.assertIn('ARM9', [view.section_name(s) for s in view.sections])
            raw_function = next(s for s in raw.symbols() if raw.symbol_name(s) == 'thumb_func')
            view_function = next(s for s in view.symbols() if view.symbol_name(s) == 'thumb_func')
            self.assertEqual(raw_function[1], 0x02000001)
            self.assertEqual(view_function[1], 0x02000000)
            input_record = root / 'out/link-inputs.json'
            self.assertTrue(input_record.is_file(), 'actual linker input record missing')
            provenance = json.loads(input_record.read_text())
            self.assertEqual(provenance['returncode'], 0)
            self.assertEqual(provenance['command'][0], lld)
            self.assertEqual(len(provenance['inputs']), 2)
            for item in provenance['inputs']:
                selected = Path(item['path'])
                self.assertIn(item['path'], provenance['command'])
                self.assertEqual(item['sha256'], hashlib.sha256(selected.read_bytes()).hexdigest())
            reference = provenance['objects'][0]
            self.assertEqual(reference['reference_sha256'], hashlib.sha256(fixture()).hexdigest())
            self.assertEqual(Path(reference['source']), (objects / 'a.o').resolve())
            self.assertEqual(reference['normalized'], provenance['inputs'][0]['path'])

    def source_trial(self, root, overrides=None, unused=False, ambiguous=False):
        if not Path('/opt/homebrew/opt/llvm/bin/clang').is_file() or not (shutil.which('ld.lld') or Path('/opt/homebrew/opt/lld/bin/ld.lld').is_file()):
            self.skipTest('native LLVM ARM tools unavailable')
        objects = root / 'objects'
        objects.mkdir()
        nested = objects / 'src'
        nested.mkdir()
        (nested / 'a.o').write_bytes(fixture())
        if ambiguous:
            (objects / 'a.o').write_bytes(fixture())
        if unused:
            # Invalid ELF must never be loaded when the LCF does not select it.
            (objects / 'unused.o').write_bytes(b'not an ELF')
        lcf = root / 'test.lcf'
        lcf.write_text("""MEMORY {
 ARM9 : ORIGIN = 0x02000000 > build/arm9.bin
}
SECTIONS {
 .arm9 : { ARM9_TEXT_START = .; a.o(.text) a.o(.data) ARM9_BSS_START = .; } > ARM9
}
""")
        args = [sys.executable, str(SCRIPT), '--lcf', str(lcf), '--objects',
                str(objects), '--output', str(root / 'out'), '--lld',
                shutil.which('ld.lld') or '/opt/homebrew/opt/lld/bin/ld.lld',
                '--clang', '/opt/homebrew/opt/llvm/bin/clang']
        if overrides is not None:
            mapping = root / 'source-objects.json'
            mapping.write_text(json.dumps(overrides))
            args += ['--source-objects', str(mapping)]
        return subprocess.run(args, capture_output=True, text=True)

    def test_source_override_owns_linked_bytes_and_map(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            compiled = bytearray(fixture())
            elf = module().Elf32(compiled)
            # Invent a distinct B instruction: prove the selected object changed.
            struct.pack_into('<I', compiled, elf.sections[1][4], 0xEA000000)
            (root / 'compiled.o').write_bytes(compiled)
            result = self.source_trial(root, {'a.o': 'compiled.o'}, unused=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            linked = (root / 'out/arm9.bin').read_bytes()
            self.assertEqual(linked[3], 0xEA)
            record = json.loads((root / 'out/link-inputs.json').read_text())
            self.assertEqual(len(record['objects']), 1)
            item = record['objects'][0]
            self.assertEqual(item['kind'], 'source')
            self.assertEqual(item['compiled'], str((root / 'compiled.o').resolve()))
            self.assertEqual(item['compiled_sha256'], hashlib.sha256(compiled).hexdigest())
            self.assertEqual(item['reference_sha256'], hashlib.sha256(fixture()).hexdigest())
            self.assertEqual(Path(item['normalized']).read_bytes(), module().normalize_object(compiled))
            link_map = Path(record['link_map']['path'])
            self.assertEqual(record['link_map']['sha256'], hashlib.sha256(link_map.read_bytes()).hexdigest())
            self.assertIn(item['normalized'] + ':(.text)', link_map.read_text())
            self.assertEqual(len(record['inputs']), 2)

    def test_missing_source_override_fails_without_reference_fallback(self):
        with tempfile.TemporaryDirectory() as tmp:
            result = self.source_trial(Path(tmp), {'a.o': 'missing.o'})
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('missing.o', result.stderr)

    def test_lcf_selection_ignores_unused_reference_objects(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            result = self.source_trial(root, unused=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            record = json.loads((root / 'out/link-inputs.json').read_text())
            self.assertEqual([item['filename'] for item in record['objects']], ['a.o'])
            self.assertEqual(record['objects'][0]['kind'], 'reference')

    def test_unused_source_override_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            result = self.source_trial(Path(tmp), {'unused.o': 'missing.o'})
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('unused source override', result.stderr)

    def test_ambiguous_reference_basename_is_rejected_even_with_source_override(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'compiled.o').write_bytes(fixture())
            result = self.source_trial(root, {'a.o': 'compiled.o'}, ambiguous=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('needs one reference; found 2', result.stderr)

    def test_stale_normalized_object_is_not_a_link_input(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            objects = root / 'out/objects'
            objects.mkdir(parents=True)
            (objects / 'stale.o').write_bytes(b'not an ELF')
            result = self.source_trial(root)
            self.assertEqual(result.returncode, 0, result.stderr)
            record = json.loads((root / 'out/link-inputs.json').read_text())
            self.assertFalse(any(Path(item['path']).name == 'stale.o' for item in record['inputs']))

    def test_dsd_check_view_changes_only_known_names_and_function_mode_bits(self):
        tool = module()
        self.assertTrue(hasattr(tool, 'dsd_check_view'), 'dsd diagnostic view missing')
        native = bytearray(tool.normalize_object(fixture()))
        elf = tool.Elf32(native)
        names_section = elf.sections[6]
        native[names_section[4] + 1:names_section[4] + 6] = b'.arm9'
        # Add an odd data address: this must survive the function-only mode edit.
        symtab = elf.sections[3]
        struct.pack_into('<IIIBBH', native, symtab[4] + 16, 0, 5, 4, 1, 0, 2)
        original = bytes(native)
        view = tool.dsd_check_view(original, [{'section': '.arm9', 'region': 'ARM9'}])
        raw_elf, view_elf = tool.Elf32(original), tool.Elf32(view)
        self.assertEqual(raw_elf.section_name(raw_elf.sections[1]), '.arm9')
        self.assertEqual(view_elf.section_name(view_elf.sections[1]), 'ARM9')
        self.assertEqual(raw_elf.symbols()[3][1], 1)
        self.assertEqual(view_elf.symbols()[3][1], 0)
        self.assertEqual(view_elf.symbols()[1][1], 5)
        self.assertEqual(raw_elf.sections, view_elf.sections)
        for index in (1, 2, 4, 5, 7):
            self.assertEqual(raw_elf.content(raw_elf.sections[index]),
                             view_elf.content(view_elf.sections[index]))
        changed = {i for i, (a, b) in enumerate(zip(original, view)) if a != b}
        allowed = set(range(names_section[4] + 1, names_section[4] + 7))
        allowed.add(symtab[4] + 3 * 16 + 4)
        self.assertTrue(changed <= allowed)

    def test_rejects_unknown_mw_directive(self):
        with self.assertRaisesRegex(ValueError, 'unsupported'):
            module().translate_lcf('MEMORY {\n ARM9 : ORIGIN = 0x02000000 > build/arm9.bin\n} SECTIONS { .arm9 : { UNKNOWN(); ARM9_BSS_START = .; } > ARM9 }', Path('/public'))


if __name__ == '__main__':
    unittest.main()
