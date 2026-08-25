# Online FPS — root cause, fixes, and next-session notes

Status: **DONE (owner-validated 2026-08-25)** — online play now runs at ~60 fps
almost all the time. One cosmetic issue remains (micro-stutters, documented
below). **Shipped in the public 0.2.1 release (2026-08-25):** the fix is now
wired into the GUI launcher (`JUSDecomp.exe`) as well as the `.cmd`/`.sh`
launchers, the WFC profile persists across relaunches, online mode is on by
default, and the release bundle ships a pre-seeded `app/live-cache` (every
overlay page compiled to native by `tools/scripts/live_preseed.py` at package
time) so players boot fully native with no in-session convergence wait. This
file is the handoff for the next session.

## TL;DR

The online FPS drop (60 → ~35) was **not** the emulated WiFi hardware. It was
the **guest WFC/DWC network stack running on the Tier-3 interpreter** because
the online launchers never enabled live-overlay promotion (offline `live` mode
did — hence clean offline battles). Fixes:

1. Enabled live-overlay auto-promotion in all three online launchers.
2. Fixed two launch blockers (missing runtime DLLs; `gcc` not on PATH).
3. Built an **offline pre-seed tool** that compiles every ROM overlay page to
   native ahead of time, so sessions boot fully native with no convergence
   wait.

Result: ~35 → ~60 fps online.

## Root cause (evidence)

Live-probed with the debug server (`NDS_PROFILE_SCHED=1` +
[`recomp/online_perf_probe.py`](../recomp/online_perf_probe.py)) during a real
WiFi Battle:

- **WiFi device model ruled out**: `wifi_ns` stayed ~0.03 ms/1000 rounds the
  whole session.
- The drop is the **guest WFC/DWC stack on the Tier-3 interpreter**:
  - Lobby/matchmaking phase: ARM9 scheduler time ×2.7 (1.2 → 3.1–3.4
    ms/1000 rounds), dispatch cache-hit halved (9% → 4.5%), Tier-3 ARM9
    insns 300–410 M/s, emu time 8 → 28 ms/frame.
  - Battle phase: periodic ~25× ARM7 bursts (wifi driver/DWC TX-RX).
- Why: ov008 (WFC online) / ov010 (comm services) are ARM9 overlays; the ARM7
  wifi driver is WRAM-resident. All are RAM-resident code that runs on the
  Tier-3 interpreter until live-overlay promotes it. The online launchers
  passed **no** live-overlay flags.

## Fixes

### 1. Launchers now enable live-overlay promotion
- [`recomp/run_jus_online.cmd`](../recomp/run_jus_online.cmd)
- [`recomp/run_jus_2p.cmd`](../recomp/run_jus_2p.cmd) — **per-instance caches**
  (`live-cache-2p-a/-b`) so two same-machine runners don't race on
  `live-index.json` / the gcc DLL outputs.
- [`recomp/run_jus.sh`](../recomp/run_jus.sh) `online`

Flags added: `--live-overlay-enable --live-overlay-auto
--live-overlay-activation-delay-ms 15000 --live-overlay-auto-delay-ms 15000
--live-overlay-auto-cooldown-ms 20000` + the `compile_live_shards.py` command
+ cache dir. The 15 s activation delay is required — the 90 s `--interactive`
default is too late for the online flow.

### 2. Launch blockers fixed
- **Missing runtime DLLs**: the freshly rebuilt `build-mingw\nds_runner.exe`
  was missing `SDL2.dll`, `libgcc_s_seh-1.dll`, `libstdc++-6.dll`,
  `libwinpthread-1.dll` (exit `0xC0000139`). Restored from the known-good
  `recomp/pcb-staging` copy. **If a rebuild ever drops them again, copy from
  `recomp/pcb-staging/JUS Decomp/tools/ndsrecomp/runner/build-mingw/`.**
- **`gcc` not on PATH**: `compile_live_shards.py --gcc gcc` needs gcc on PATH;
  a plain `.cmd` doesn't have it (MSYS bash does). Both `.cmd` launchers now
  prepend `C:\msys64\ucrt64\bin` when present.

### 3. Offline pre-seed — [`tools/scripts/live_preseed.py`](../tools/scripts/live_preseed.py)
Compiles **all** ROM overlay pages to native ahead of time so every session
boots fully native (no convergence wait, no overlay-swap bank rejection).

How it works:
1. Parses the ROM's ARM9 overlay table (`0x50`) + FAT (`0x48`) for each
   overlay's RAM address/size/ROM extent.
2. Takes each overlay's full 4096-byte RAM pages (skips partial first/last
   pages — their resident bytes aren't fully the overlay).
3. Derives function entry points from the dsd symbol tables
   (`decomp/arm9/overlays/<ov>/symbols.txt`).
4. Synthesizes the schema-3 tier3-coverage manifest and runs the existing
   `compile_live_shards.py` once into a staging cache
   (`recomp/live-cache-preseed`).
5. Copies the produced DLLs into every live cache. The runner discovers banks
   by scanning the cache dir (`live_overlay.cpp rescan_cache`), so DLLs on
   disk are all it needs — and running instances pick them up on their next
   rescan.

Usage (repo root):
```
python tools/scripts/live_preseed.py                 # all overlays -> all caches
python tools/scripts/live_preseed.py --overlays 8,10 # just WFC + comm
python tools/scripts/live_preseed.py --dry-run       # list pages, compile nothing
```
Re-runs are cheap (staging index dedupes).

**Full run (2026-08-25): 328 pages → 328 DLLs, 0 failed**, all 14 overlays +
every region-A/B content variant. Seeded into: `live-cache` (413 DLLs total),
`live-cache-2p-a` (624), `live-cache-2p-b` (616). The recompiler's finder
expands each page's dsd entry set into a full dependency closure (e.g. 80
entries → 403 functions on page `0x02159000`).

## Validation (owner-run, 4 sessions)

| session | online FPS | notes |
|---|---|---|
| before any fix | ~35 | WFC/DWC on interpreter |
| live-overlay + gcc PATH fix | ~45 | ARM7 wifi driver native; ARM9 overlay churn remains |
| warm cache + 20s cooldown | ~50–60 | ARM7 cache-hit 68–72%, ARM9 27–34% |
| **fully pre-seeded** | **~60 almost all the time** | every overlay page native from boot |

## Remaining: micro-stutters (documented, not blocking)

**Symptom (owner):** occasional micro-stutters at random intervals, each
sub-second, minor gameplay impact. Not the old 60→35 drop.

**Likely causes to investigate next session (in order):**
1. **Background shard compilation / cache rescan.** The runner periodically
   `rescan_cache()`s and the auto-promotion worker compiles new pages
   (`compile_live_shards.py` → `gcc`). Even with the pre-seed, any page not
   covered (e.g. a code path the pre-seed's dsd entry set missed, or a
   runtime-generated page) triggers a compile on the emulation thread's
   schedule. Check `live_overlay_status` (`busy`, `runs_started`) at the
   moment of a stutter; if `busy:true` correlates, the fix is to (a) limit
   the compiler's CPU (jobserver to 1 core) and/or (b) pre-seed the missing
   pages.
2. **Scheduler round granularity.** The scheduler runs at a fixed 64-cycle
   round cap (`kIterCap` in `scheduler.cpp`) ≈ 8,750 rounds/frame. Per-frame
   budget: ARM9 ~10.5 ms, ARM7 ~5.7 ms, devices ~4.4 ms. A correctness-checked
   raise of `kIterCap` (with A/B validation of the ARM9/ARM7 IPCSYNC
   handshake) would cut the fixed per-round overhead — the last structural
   lever.
3. **Host-side hiccups** (audio queue underruns, SDL present, GC/allocator
   pauses). `frontend_stats` (`underruns`, `max_emu_ms`) + the exit-time
   `nds_profile_report` distinguish these from guest-side causes.

**How to measure:** run with `NDS_PROFILE_SCHED=1` and
[`recomp/online_perf_probe.py`](../recomp/online_perf_probe.py) sampling
`frontend_stats`/`profile`/`static_coverage`/`dispatch_stats`; correlate the
stutter timestamps with `live_overlay_status.busy` and `frontend_stats`
underruns.

## Tooling added this session
- [`recomp/online_perf_probe.py`](../recomp/online_perf_probe.py) — samples
  the debug server's perf counters and diffs per window → CSV.
- [`recomp/analyze_perf.py`](../recomp/analyze_perf.py) — timeline view of the
  probe CSVs.
- [`recomp/pe_imports.py`](../recomp/pe_imports.py) — dump a PE's subsystem +
  imported DLLs (used to diagnose the missing-DLL launch failure).
- [`recomp/query_live.py`](../recomp/query_live.py) — compact
  `live_overlay_status` summary.
- [`tools/scripts/live_preseed.py`](../tools/scripts/live_preseed.py) — the
  offline pre-seed tool.

## Related docs
- [`decomp/docs/NDSRECOMP.md`](NDSRECOMP.md) — Session 4 (full write-up).
- [`decomp/docs/TODO.md`](TODO.md) — online-fps items.
- [`recomp/ONLINE_TEST.md`](../recomp/ONLINE_TEST.md) — release-package notes.
