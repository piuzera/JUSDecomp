import hashlib, json, struct, subprocess
from pathlib import Path

OUT = Path(__file__).resolve().parent
ROM = Path('/Users/djdjo/Documents/mine/rom/jus.nds')
LLVM = Path('/opt/homebrew/opt/llvm/bin/llvm-mc')
LAYOUT = Path('/private/tmp/jus-track-a-publish/decomp/matching-notes/other-cpus/arm7-checked-layouts.json')
digest = lambda data: hashlib.sha256(data).hexdigest()
before = {str(p): digest(p.read_bytes()) for p in (ROM, LLVM, LAYOUT)}
assert before[str(LLVM)] == '76de9d4a660f3e1f6dc8175c5d443197f953eaa4df2871406a19d789b1a34ba0'
assert before[str(ROM)] == 'a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
assert before[str(LAYOUT)] == '8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
original = ROM.read_bytes()
fat, fat_size = struct.unpack_from('<II', original, 0x48)
assert fat_size >= 80*8
lo, hi = struct.unpack_from('<II', original, fat+79*8)
assert (lo, hi) == (0x23b800, 0x4464c8)
layouts = json.loads(LAYOUT.read_bytes())
rows = []
for index, program in enumerate((original, original[lo:hi])):
    layout = layouts[index]
    assert digest(program) == layout['identity']['program_sha256']
    stored, entry, base, count = struct.unpack_from('<IIII', program, 0x30)
    assert [stored, entry, base, count] == [layout[k] for k in ('image_offset','entry','base','image_bytes')]
    image = program[stored:stored+count]
    assert digest(image) == layout['image_sha256']
    table, table_end, load_start = struct.unpack_from('<III', image, 0x198)
    assert digest(image[table-base:table_end-base]) == layout['table_sha256']
    runtime, size, bss = struct.unpack_from('<III', image, table-base)
    assert runtime == 0x037f8000 and size == 66120 and bss == 14920
    spans = []
    for first, last in [(0x037fd070,0x037fd0c0),(0x037fd0c0,0x037fd0cc)]:
        assert runtime <= first < last <= runtime+size
        off = load_start-base+first-runtime
        payload = image[off:off+last-first]
        words = struct.unpack('<'+'I'*(len(payload)//4), payload)
        if first == 0x037fd070:
            for case, arena_id in enumerate((7,8)):
                seq = words[case*10:(case+1)*10]
                for at in (0,3,5,8):
                    assert seq[at] == 0xe3a00000 | arena_id
                assert seq[2] == seq[7] == 0xe1a01000
                for at, target in zip((1,4,6,9),(0x037fcf84,0x037fcf18,0x037fcf2c,0x037fcf04)):
                    word = seq[at]
                    assert word >> 24 == 0xeb
                    immediate = word & 0xffffff
                    signed = immediate - (1<<24) if immediate & (1<<23) else immediate
                    address = first+(case*10+at)*4
                    assert address+8+signed*4 == target
        else:
            assert words == (0xe28dd004,0xe8bd4000,0xe12fff1e)
        argv = [str(LLVM),'--disassemble','--triple=armv4t-none-eabi']
        proc = subprocess.run(argv,input=' '.join(f'0x{b:02x}' for b in payload)+'\n',text=True,capture_output=True,check=True)
        assert proc.stderr == ''
        output = f'program-{index}-{first:08x}-llvm.txt'
        (OUT/output).write_text(proc.stdout)
        spans.append({'start':first,'end':last,'stored_image_offset':off,'sha256':digest(payload),'words':[f'{w:08x}' for w in words],'llvm_stdout_sha256':digest(proc.stdout.encode()),'llvm_stdout_file':output})
    literal_off = load_start-base+0x037fd0cc-runtime
    assert struct.unpack_from('<I',image,literal_off)[0] == 0x03808430
    rows.append({'identity':layout['identity'],'spans':spans,'excluded_following_literal':{'address':0x037fd0cc,'value':0x03808430}})
after = {str(p):digest(p.read_bytes()) for p in (ROM,LLVM,LAYOUT)}
assert before == after
(OUT/'original-read.json').write_text(json.dumps({'status':'passed','programs':rows,'input_sha256_before':before,'input_sha256_after':after,'source_credit_bytes':0},indent=2)+'\n')
print('Independent original 20-word caller body and three-word epilogue pass for both identities.')
