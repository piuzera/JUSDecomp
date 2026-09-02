# General FPS work

Status: implementation pass completed 2026-09-02. This work is deliberately
offline/ranked-agnostic: it improves the normal runner and adds measurements
needed to find machine-specific bottlenecks without changing guest timing.

## Measure gameplay, not the intro

JUS plays an FMV during startup. Aggregate FPS and phase totals from process
launch include decoding that video and are not a gameplay benchmark. Use the
rolling 600-presented-frame fields from `frontend_stats` after entering a
normal match:

- `work_p50_ticks`, `work_p95_ticks`, `work_p99_ticks`, `work_max_ticks`
- `deadline_misses`, `slow_frames_32ms`, `underruns`
- `renderer_compute`, `renderer_demoted`, `renderer_soft_threaded`

`recomp/online_perf_probe.py` converts those ticks to milliseconds and also
reports scheduler phases, overlay activity, and network queue/drop counters.
The DS frame deadline is 560,190 system cycles / 33,513,982 Hz, or about
16.715 ms (59.826 FPS).

Example offline capture while playing a match:

```sh
NDS_PROFILE_SCHED=1 recomp/run_jus.sh live
python3 recomp/online_perf_probe.py --port 19842 --interval 5 --out offline.csv
```

## Implemented changes

- Cached live banks are synchronously loaded and validated before boot. Their
  dispatch tables are registered as one batch, producing one sorted-index
  rebuild and one cache epoch change per CPU instead of one per library.
- Live-overlay management now runs once per frontend frame at the existing
  safe boundary, not once per 64-cycle scheduler round. Native per-bank hit
  telemetry is sampled and weighted instead of calling the overlay layer on
  every cached dispatch.
- Successful live-bank lookups no longer rebuild expensive rejection detail.
  Background compilers run below the game process priority on Windows and
  Linux.
- The scheduler retains the exact next LCD, SPU, and RTC deadlines and calls
  fixed/dynamic device catch-up functions only when an event is due. Event
  order and guest timestamps are unchanged. In the measured gameplay run this
  reduced sampled scheduler host cost from 4.530 to 3.215 ms per 1,000 rounds
  (about 29%); sampled display cost fell from 1.621 to 0.652 ms per 1,000.
- The direct-mapped static dispatch cache keeps identity and negative-hit
  fields in its first cache line, avoiding a second-line fetch for definitive
  Tier-3 misses.
- `frontend_stats`, `live_overlay_status`, and `net_state` expose compact
  pacing/renderer/queue telemetry. The probe computes rates from the interval
  between samples rather than the time taken to issue each query.

## Validation

- Linux Release build succeeds.
- MinGW/Windows Release cross-build succeeds.
- All 14 runner tests pass.
- A 50,000,000-cycle dual-CPU headless smoke run completes normally.
- A 4,800-frame interactive run using a temporary copy of the real save
  completed with active match input; a post-scheduler-change 3,000-frame run
  also completed normally. The real save was not modified.

Do not raise the 64-cycle scheduler cap without a separate correctness pass.
It controls ARM9/ARM7 rendezvous ordering and can move IPC synchronization
writes even when it appears to be only a performance knob.
