# Mods — user mod pipeline

JUS Decomp ships a **Riivolution-style mod pipeline**: the stock ROM is never
modified. Mod packs describe files that the recomp runner shadows over
gamecard reads at runtime (`[[mods.overlays]]` entries). This document covers
installing, creating, enabling, and managing mods.

Related docs: [`NEW_KOMA.md`](NEW_KOMA.md) §10 (overlay mechanics and format
research), [`NDSRECOMP.md`](NDSRECOMP.md) (runner setup).

---

## 1. Concepts

| Term | Meaning |
|---|---|
| **Mod pack** | A directory `recomp/mods/<id>/` with a `mod.toml` manifest and sources |
| **Payload** | Rebuilt game files (e.g. grown `koma.bin`) under the pack's `files/` tree, mirroring NitroFS paths |
| **Overlay** | One `[offset, file]` pair: the runner reads the host file whenever the game reads that ROM range |
| **Compose** | Turning all *enabled* packs' payloads into `recomp/game-mod.generated.toml` |

**Legal note:** packs commit only *original* assets and recipes
(`mod.toml`, `src/`, `build.py`, `README.md`). Payload binaries are always
rebuilt locally from **your own** `extract/` plus the pack's sources, so no
game data is ever redistributed. The runner's `[game].sha1` gate accepts only
the stock ROM.

## 2. Quickstart (install / enable / manage)

```cmd
:: 1. one-time setup: place your legally dumped ROM + extraction (see README)
::    rom\jus.nds  +  extract\  (ds-decomp extraction)

:: 2. list installed packs
py tools\scripts\mods_manage.py list

:: 3. enable/disable a pack
py tools\scripts\mods_manage.py enable  koma-890-jodio
py tools\scripts\mods_manage.py disable koma-890-jodio

:: 4. build payloads from your extract + the pack's sources
py tools\scripts\mods_manage.py build koma-890-jodio

:: 5. compose the runtime config (enabled packs only)
py tools\scripts\mods_manage.py compose

:: 6. play: stock ROM + overlays
recomp\play_mod.cmd            :: resume existing save
recomp\play_mod.cmd fresh      :: blank save
```

## 3. Pack anatomy

```
recomp/mods/<id>/
├── mod.toml    # [manifest] — required
├── src/        # original source assets (art, text patches...) — committed
├── build.py    # optional hook: def build(ctx) writes files/ — committed
├── files/      # GENERATED payloads (NitroFS mirror) — gitignored
└── README.md   # what the mod does (optional, recommended)
```

### Manifest reference (`mod.toml`)

```toml
[manifest]
id = "my-mod"                 # unique directory-safe id (required)
name = "My Mod"               # display name (defaults to id)
version = "0.1.0"             # semver
author = "you"                # optional
description = "..."           # optional
enabled = true                # false = installed but not composed
```

### `build.py` hook contract

If present, `mods_manage.py build` executes `build(ctx)` with:

| ctx field | Path |
|---|---|
| `ctx.files` | the pack's `files/` dir — write payloads here (pre-created) |
| `ctx.src` | the pack's `src/` dir |
| `ctx.extract` | `extract/files/` — the user's stock extraction |
| `ctx.scripts` | `tools/scripts/` (importable; also added to `sys.path`) |
| `ctx.rom` / `ctx.repo` | `rom/jus.nds` / repo root |
| `ctx.run(cmd)` | run a subprocess from the repo root, checked |

The hook may `import koma_append`, `import dtx4_mod`, etc. directly.
Example: [`../../recomp/mods/koma-890-jodio/build.py`](../../recomp/mods/koma-890-jodio/build.py).

Packs **without** `build.py` are "plain replacement" packs: their payloads are
hand-made files placed directly under `files/` (e.g. a translation's text
binaries exported by your own tooling).

## 4. Overlay rules (what payloads can do)

- **NitroFS file replacement with growth** — a `files/bin/foo.bin` payload may
  be any size up to the slack before the next FAT extent; the resolver emits
  an extra FAT-entry overlay (`_fat_<id>.bin`) so the game sees the new size.
- **Archive-internal members must keep their size** — a
  `files/<dir>/<name>.aar/<member>` payload replaces the ALAR3 member
  byte-for-byte at its resolved ROM offset. Growth inside an archive requires
  rebuilding the archive.
- **Same-size overwrites** — anything else in the ROM can be shadowed if you
  know the offset; resolution is automatic for the two cases above.
- Overlay offsets are resolved **per user ROM** by content search + FAT/ALAR3
  parsing, so packs are portable across identical dumps (sha1-gated).

## 5. Creating a mod from scratch

```cmd
mkdir recomp\mods\my-mod
copy recomp\mods\koma-890-jodio\mod.toml recomp\mods\my-mod\mod.toml
:: edit id/name/description; keep enabled = false while developing
```

Then either:

- **Simple file replacement:** put your rebuilt NitroFS file under
  `recomp\mods\my-mod\files\bin\whatever.bin` (no build.py), or
- **Recipe mod:** add `src/` assets + `build.py` that synthesizes payloads
  from `ctx.extract` — the recommended, redistributable form.

Finally: `enable my-mod` → `build my-mod` → `compose` →
`recomp\apply_overlays_check.py` (generic pre-flight) → `recomp\play_mod.cmd`.

## 6. Manager reference

```
py tools/scripts/mods_manage.py list
py tools/scripts/mods_manage.py enable   <id>
py tools/scripts/mods_manage.py disable  <id>
py tools/scripts/mods_manage.py build    [<id> ...]   :: default: all packs
py tools/scripts/mods_manage.py compose  [--rebuild]  :: enabled packs only
```

`compose` writes `recomp/game-mod.generated.toml`
(base `recomp/game-mod.toml` + enabled packs' overlays). `play_mod.cmd`
prefers it automatically and falls back to the base (no mods) otherwise.
`mods_build.py <rom> <dir> <out.toml>` remains as the low-level single-tree
resolver.

## 7. Troubleshooting

| Symptom | Fix |
|---|---|
| `rom/jus.nds not found` | Copy your legally dumped ROM to `rom/jus.nds` |
| `original content not found in ROM` | Your ROM differs from the stock dump (sha1 gate) or `extract/` is missing |
| `growth exceeds slack` | Shrink the payload or relocate content (see `NEW_KOMA.md` §9) |
| `archive members must keep the same size` | Rebuild the archive instead of growing a member |
| `no 'enabled = ...' line` | The pack's `mod.toml` lacks the line the manager toggles |
| `no payloads and no build.py` | Add `files/` content or a `build.py` hook |

## 8. Current limits

- Windows/runner only (no zip distribution yet — packs are directories;
  zip install is a known follow-up, see `TODO.md`).
- Growth is bounded by NitroFS slack; growing many files needs
  `tools/scripts/nitrofs_grow.py` (advanced).
- Mods load at gamecard-read time; RAM-only patches (per-screen injections)
  are out of scope for packs today.
