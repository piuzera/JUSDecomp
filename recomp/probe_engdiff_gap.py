import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools" / "scripts"))
import eng_diff as ed

rep = json.loads(Path("recomp/eng_diff.json").read_text(encoding="utf-8"))

print("== header differing fields ==")
for h in rep["header"]["differing_fields"]:
    print(f"  {h['field']}: {h['stock_repr']} -> {h['english_repr']}")

print("\n== structures ==")
for k in ("arm9", "arm7"):
    s = rep[k]
    print(f"  {k}: stock {s['stock']['rom_offset']}+{s['stock']['size_raw']}"
          f" (lz={s['stock']['lz77_compressed']}, dec={s['stock']['size_decoded']})"
          f"  en {s['english']['rom_offset']}+{s['english']['size_raw']}"
          f" (lz={s['english']['lz77_compressed']}, dec={s['english']['size_decoded']})"
          f"  equal={s['content_equal_decoded']}")
fnt = rep["fnt"]
print(f"  fnt: stock {fnt['stock']['offset']:#x}+{fnt['stock']['size']}, "
      f"en {fnt['english']['offset']:#x}+{fnt['english']['size']}")
fat = rep["fat"]
print(f"  fat: stock {fat['stock']['offset']:#x}+{fat['stock']['size']}, "
      f"en {fat['english']['offset']:#x}+{fat['english']['size']}")
ban = rep["banner"]
print(f"  banner: stock {ban['stock']['offset']:#x} en {ban['english']['offset']:#x} "
      f"equal={ban['content_equal']}")

print("\n== changed nitrofs files ==")
for r in rep["files"]["changed"]:
    print(f"  {r['path']}")
    print(f"    {r.get('category','?')}: stock {r['size']['stock']} B "
          f"@ 0x{r['extent']['stock'][0]:X}, en {r['size']['english']} B "
          f"@ 0x{r['extent']['english'][0]:X} (delta {r['delta']:+d}, "
          f"{len(r['diff_runs'])} runs)")

print("\n== raw block regions (first 40) ==")
for r in rep["raw_diff_blocks"]["ranges"][:40]:
    print(f"  {r['start']} - {r['end']} ({r['bytes']:,} B)")

# ── stock gap analysis: what lives between last overlay end and first file? ──
s = ed.NdsRom(Path("rom/jus.nds"))
e = ed.NdsRom(Path("rom/jus-en.nds"))
s_ov_end = max(s.fat[i][1] for i in range(14))
s_file0 = s.fat[14][0]
e_ov_end = max(e.fat[i][1] for i in range(14))
e_file0 = e.fat[14][0]
print(f"\n== gap stock: overlays end 0x{s_ov_end:X} -> first file 0x{s_file0:X} "
      f"({s_file0 - s_ov_end:,} B)")
print(f"== gap en   : overlays end 0x{e_ov_end:X} -> first file 0x{e_file0:X} "
      f"({e_file0 - e_ov_end:,} B)")
gap = s.data[s_ov_end:s_file0]
nz = [i for i, b in enumerate(gap[:0x100000]) if b not in (0x00, 0xFF)]
print(f"stock gap first 1 MiB: {len(nz)} non-00/FF bytes")
if nz:
    print(f"  first nonzero at gap+0x{nz[0]:X} (abs 0x{s_ov_end + nz[0]:X})")
    lo, hi = min(nz), max(nz)
    print(f"  nonzero span gap+0x{lo:X}..0x{hi:X} "
          f"(abs 0x{s_ov_end + lo:X}..0x{s_ov_end + hi:X})")
# what structures sit in the gap?
for name, off, size in (("fnt", s.fnt_off, s.fnt_size), ("fat", s.fat_off, s.fat_size),
                        ("banner", s.banner_off, 0xA40)):
    print(f"  stock {name} at 0x{off:X}+{size:#x} in-gap={s_ov_end <= off < s_file0}")
