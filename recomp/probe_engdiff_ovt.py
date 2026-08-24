import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools" / "scripts"))
import eng_diff as ed

s = ed.NdsRom(Path("rom/jus.nds"))
e = ed.NdsRom(Path("rom/jus-en.nds"))
for rom, name in ((s, "stock"), (e, "english")):
    d = rom.data
    print(f"== {name}: ovt_off {rom.ovt_off:#x} size {rom.ovt_size} "
          f"({rom.ovt_size // 24} raw entries)")
    for i in range(rom.ovt_size // 24):
        o = rom.ovt_off + i * 24
        vals = struct.unpack_from("<6I", d, o)
        print(f"  [{i:2d}] id={vals[0]:3d} ram={vals[1]:#010x} "
              f"size={vals[2]:7d} bss={vals[3]:6d} sinit={vals[4]:#x}.."
              f"{vals[5]:#x}")
    print("  FAT[0..15]:")
    for i in range(16):
        st, en_ = rom.fat[i]
        print(f"    [{i:2d}] 0x{st:08X}-0x{en_:08X} ({en_ - st} B)")
