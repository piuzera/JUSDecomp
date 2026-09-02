# JUS Online Test Guide (release 0.3.1, 2026-09-02)

Jump! Ultimate Stars **WiFi Battle (WiFiバトル)** online bring-up — validated
same-machine on 2026-08-25: **distinct friend codes, room created + joined,
no error 80430**. Online play runs at ~60 fps. This package is for the
two-PC and overseas validation passes.

## What changed in this build (vs the previous PC-B zip)

- **Online FPS fix (2026-08-25): live-overlay promotion is now ON in the
  online launchers AND the GUI launcher.** Root cause of the 60 → ~35 fps
  drop: the WFC/DWC network stack (ARM9 ov008/ov010 + ARM7 wifi driver) runs
  RAM-resident on the Tier-3 interpreter until promoted, and the online
  launchers never enabled promotion (offline `live` mode did — hence clean
  offline battles). `run_jus_online.cmd` / `run_jus.sh online` now
  auto-promote into the shared `recomp\live-cache`; `run_jus_2p.cmd` uses
  per-instance caches (`live-cache-2p-a/-b`) so two same-machine runners
  don't race. The `.cmd` launchers also prepend `C:\msys64\ucrt64\bin` to
  PATH (the shard compiler needs `gcc`) and use a 20 s auto-cooldown.
  **Owner-validated 2026-08-25:** first fixed session 35 → ~45 fps; a
  warm-cache second session holds ~50–60 fps in the online lobby/battle
  (ARM7 wifi driver + ARM9 WFC pages promoted to native; cache persists
  across sessions and improves cumulatively).
- **GUI launcher (0.2.1):** the beginner-friendly `JUSDecomp.exe` now also
  enables live-overlay promotion in online mode, persists the WFC profile
  (`--firmware-state-path` under the user dir) so friend codes survive
  relaunches, and defaults **Online mode (Wiimmfi)** to on. The release
  bundle ships a **pre-seeded** `app/live-cache` (every ROM overlay page
  compiled to native by `tools/scripts/live_preseed.py` at package time), so
  players boot fully native with no in-session convergence wait.
- **Peer-unicast relay fix** (`--wfc-peer-unicast on`, default): relayed Wiimmfi
  NATNEG peer frames are delivered unicast-to-self (the receiving console's
  MAC) instead of broadcast. This resolves the Session-2 match-completion
  stall (80430).
- **`wiilink` provider** added: `--wfc-provider wiilink` points guest DNS at
  WiiLink24's DS service (167.235.229.36) for A/B testing against the default
  Kaeru/Wiimmfi route (178.62.43.212).
- Launchers: `run_jus_online.cmd` (single machine), `run_jus_2p.cmd` (two
  instances on one machine).

## Friend codes (important facts)

- The friend-code UID derives from the **NDS console (live MAC) + Gamecart
  identity**.
- Each machine/instance generates a distinct console identity
  (`generated-identity.bin` is NOT shipped; first launch creates it), so two
  machines get distinct friend codes **even with the same shipped
  never-online save**.
- On each machine, still complete **WiFi Battle → profile registration** so
  that machine's save is claimed by its console (registration rewrites the
  save's console identity — verified).
- Do **not** hand-patch save bytes to change the identity; that corrupts the
  save (the game re-initializes it).

## Two PCs on the same network

Machine A:
```
run_jus_online.cmd --instance-index 0 --player-name A --wfc-peer-host <B-LAN-IP>
```
Machine B:
```
run_jus_online.cmd --instance-index 1 --player-name B --wfc-peer-host <A-LAN-IP>
```
- `--wfc-peer-host` tunnels only the NATNEG peer frames host-to-host; the
  lobby/matchmaking still goes through Wiimmfi.
- The first peer frame pops the Windows "Allow access" alert for inbound UDP
  27610–27625 — click it on **both** machines. Allow the runner outbound
  (UDP 53 + TCP to the WFC service).

## World-wide (two networks)

```
run_jus_online.cmd --instance-index 0 --player-name YourName
```
on each machine (different instance indices optional; different saves per
machine recommended). NATNEG punches through each side's router via the
public path through Slirp.

## If a match still stalls

- Both launchers write captures: `recomp\cap-2p-a.pcap` / `cap-2p-b.pcap`
  (or add `--net-capture-out FILE.pcap` to `run_jus_online.cmd`).
- Share the `.pcap` files + each machine's console log lines (`[wfc_peer]`
  forwarded/received, `[network] WFC DNS provider`) with the developers.
- A/B the provider: add `--wfc-provider wiilink` to isolate server-side vs
  game-side.

## Files

| Path | Purpose |
|---|---|
| `run_jus_online.cmd` | single-machine online launch (world-wide or `--wfc-peer-host` for same-network) |
| `run_jus_2p.cmd` | two instances on one machine (debug/harness) |
| `recomp\game.toml` | cartridge/save config (EEPROM 64 KiB, JUS hash gate) |
| `decomp\docs\NDSRECOMP.md` | full bring-up write-up incl. Session-3 result |
