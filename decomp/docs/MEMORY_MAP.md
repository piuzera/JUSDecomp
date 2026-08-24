# Memory Map — Jump Ultimate Stars (AJUJ)

All values verified against `extract/arm9/arm9.yaml`, `extract/arm7/arm7.yaml`,
`extract/arm9/itcm.yaml`, `extract/arm9/dtcm.yaml` and `extract/arm9_overlays/overlays.yaml`
produced by `dsd 0.12.0`. Status: **confirmed** (from dsd extraction metadata).

## ROM header (extract/header.yaml)

| Field | Value |
|---|---|
| Title | `JUS` |
| Game code | `AJUJ` |
| Maker code | `01` |
| Unit code | 0 (DS) |
| ROM version | 0 |
| ROM size | 67,108,864 bytes (0x4000000, 64 MiB) |

## ARM9 main module (`extract/arm9/arm9.bin`, 656,832 bytes)

| Item | Hex | Decimal |
|---|---|---|
| Base address | `0x02000000` | 33,554,432 |
| Entry function | `0x02000800` | 33,556,480 |
| Autoload callback | `0x02000A68` | 33,557,096 |
| Build info offset | `0x0B58` | 2,904 |
| BSS start | `0x020A05C0` | 34,211,264 |
| BSS end | `0x0214CD20` | 34,917,664 |
| Encrypted | no | |
| Compressed | no | |

- SDK version field: `0x03017534` (raw value from `arm9.yaml`; NitroSDK build identifier).
- Build-info record at offset 0x0B58 contains (little-endian words):
  `0x020A9140`, `0x020A9158`, `0x020A05C0`, `0x020A05C0` —
  strongly inferred: autoload list/last pointers + BSS range (start, end aliases).

## ARM9 autoloads (static TCM sections)

| Module | Base | Size (bytes) | BSS | Source |
|---|---|---|---|---|
| ITCM | `0x01FF8000` | 31,552 (0x7B60) | 0 | `extract/arm9/itcm.bin` |
| DTCM | `0x027C0000` | 4,160 (0x1040) | 32 | `extract/arm9/dtcm.bin` |

## ARM7 module (`extract/arm7/arm7.bin`, 165,552 bytes)

| Item | Hex | Decimal |
|---|---|---|
| Base address | `0x02380000` | 37,224,448 |
| Entry function | `0x02380000` | 37,224,448 |
| Autoload callback | `0x02380158` | 37,224,792 |
| Build info | none | 0 |

No ARM7 overlays exist (`arm7_overlays: null` in `extract/config.yaml`). **Confirmed.**

## ARM9 overlay load regions

Three distinct base addresses are used by the 14 overlays (see `OVERLAYS.md` for the full table):

| Region | Base | Overlays | Region span (max end observed) |
|---|---|---|---|
| A | `0x0214CD20` | 0–9 | up to ~`0x02172A60` |
| B | `0x02172A60` | 10–11 | up to ~`0x021AC1C0` |
| C | `0x021AC1C0` | 12–13 | up to ~`0x021D5AD0` |

Note: overlay groups sharing a base address are mutually exclusive at runtime (one loaded at a
time in that region). **Strongly inferred** from the shared base addresses.

## Deck system (main-RAM BSS) — runtime-confirmed 2026-08-22

Live-probed via the runner debug server and owner-validated by deck injection
(see `DECK_INJECTION.md` / `DECK_INJECTION_STATUS.md`):

| Address | Size | Content |
|---|---|---|
| `0x020B0D6C` | 1 | deck table 1 (player) used-count |
| `0x020B0D6D` | 1 | deck table 2 (rival/received) used-count |
| `0x020B0DBC` | `0x11F8` (50 × 0x5C) | deck table 1 records |
| `0x020B1FB4` | `0xED8` (50 × 0x4C) | per-deck aux metadata |
| `0x020B2E8C` | `0x11F8` (50 × 0x5C) | deck table 2 records |
| `0x020AFEB4` | 10 | per-player selected-deck bytes |
| `0x020B0BAC` | 0x74 | Koma-unlock bitset (+ companions `0x020B0C14/18`, `0x020B0D2C/30`) |
| `0x020B02AC` | 12 | save-dirty range state |

Save mirror (64 KiB flash/EEPROM image): table 1 records at `0xB0C + slot*0x5C`,
table 1 count at `0xAB5`, table 2 count at `0xAB4`, 8-byte region headers at
`0xB04`/`0x2BD4`.

## Static library / SDK components (from ARM9 build strings) — confirmed

| String | Meaning |
|---|---|
| `[SDK+NINTENDO:BACKUP]` | NitroSDK card-backup (save) library |
| `[SDK+NINTENDO:DWC1.2.30004.060825.1845_DWC_1_2_PLUS4]` | Nintendo Wi-Fi Connection client lib |
| `[SDK+Actimagine:VX]` | Actimagine VX video codec (used by `opening.vx`) |
| `[SDK+UBIQUITOUS:CPS]` | Ubiquitous CPS (compression, used by DWCF) |
| `[SDK+UBIQUITOUS:SSL]` | SSL stack for WFC |
| `[SDK+Abiosso:libVCT 1.0.1_ec]` | Voice-chat library |
| `[SDK+NINTENDO:WiFi1.2.30000.0609050341]` | WiFi library build |

DWC-related strings also appear in overlays `ov008.bin` and `ov010.bin` — **strongly inferred**
that these overlays contain Wi-Fi / online menu code. An `NDWCSHAP` string (DWC shape/type
table) is present in ARM9.