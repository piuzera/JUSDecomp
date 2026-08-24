"""build.py — materialize the koma-890 payload files from the user's own
extract/ (stock game data) plus this pack's original source assets.

Hook contract (see tools/scripts/mods_manage.py and decomp/docs/MODS.md):
define a single function `build(ctx)` that writes the NitroFS-mirror payload
tree under `ctx.files`. Never commit anything under files/: it is rebuilt
locally and gitignored.
"""
from __future__ import annotations


def build(ctx):
    # 1) koma.bin / komatxt.bin — append record 890 (Jodio) with the validated
    #    recipe from tools/scripts/koma_append.py (see decomp/docs/NEW_KOMA.md
    #    §10 for the format research behind it).
    from koma_append import build_koma, build_komatxt  # noqa: E402

    bin_dir = ctx.files / "bin"
    bin_dir.mkdir(parents=True, exist_ok=True)
    stock_koma = (ctx.extract / "bin" / "koma.bin").read_bytes()
    stock_komatxt = (ctx.extract / "bin" / "komatxt.bin").read_bytes()
    (bin_dir / "koma.bin").write_bytes(build_koma(stock_koma))
    (bin_dir / "komatxt.bin").write_bytes(build_komatxt(stock_komatxt))
    print(f"  bin/koma.bin    {len(stock_koma)} -> "
          f"{len((bin_dir / 'koma.bin').read_bytes())} bytes")
    print(f"  bin/komatxt.bin {len(stock_komatxt)} -> "
          f"{len((bin_dir / 'komatxt.bin').read_bytes())} bytes")

    # 2) koma/koma.aar/koma/dt_01.dtx — paint the owner art onto a copy of the
    #    stock donor slot (dt_01, donated from cheat-only hidden koma 871).
    #    paint-png preserves the file size exactly (ALAR3 members cannot grow).
    # dsd extraction replaces dots in filenames with underscores:
    # NitroFS koma/koma.aar -> extract/files/koma/koma_aar_out/
    stock_dtx = ctx.extract / "koma" / "koma_aar_out" / "koma" / "dt_01.dtx"
    out_dtx = ctx.files / "koma" / "koma.aar" / "koma" / "dt_01.dtx"
    out_dtx.parent.mkdir(parents=True, exist_ok=True)
    ctx.run(["py", str(ctx.scripts / "dtx4_mod.py"), "paint-png",
             str(stock_dtx), str(ctx.src / "custom01.png"), str(out_dtx)])
    if out_dtx.stat().st_size != stock_dtx.stat().st_size:
        raise SystemExit("[!] dt_01.dtx size changed — archive members must "
                         "keep their size")
    print(f"  koma/dt_01.dtx  painted from src/custom01.png "
          f"({out_dtx.stat().st_size} bytes)")
