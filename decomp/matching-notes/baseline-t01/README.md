# T01 pinned baseline results

The owner-authorized native baseline passes all 17 ARM9 module checks, symbol
checks, and direct original-ROM byte, load-address, and BSS comparisons.
The [native result](native-results.json) records the successful LLVM replacement
for the unavailable private Metrowerks linker. No reconstructed source coverage
or full-ROM reconstruction is claimed.

The first run below stopped before linking because Metrowerks was unavailable.
Its module check returned 1. Those failed-run logs remain as historical evidence.

The source pin is `6a061e3897f10a8800bf7ec9afde82fa8c9dbe1b`. The owned remote is
<https://github.com/drj613/JUSDecomp>, whose parent is `piuzera/JUSDecomp`.
Work is on `track-a/matching`. Upstream remains a separate read-only remote.

## Inputs and original-run results

The owner-supplied ROM is AJUJ revision 0, 67,108,864 bytes, with SHA-1
`ba58e20ee60eb81c33dcd4934a21271baa9f954a`. This matches upstream's required
identity. [The intake manifest](../../rom-manifest.json) records stored regions.
[The executable inventory](executable-regions.json) adds main and autoload
boundaries, all overlay records, and Download Play scope.

| Stage | Exit code | Evidence |
|---|---:|---|
| Extract original ROM | 0 | [extract.log](extract.log), [command](extract-result.json) |
| Delink reference ELF objects | 0 | [delink.log](delink.log) |
| Generate linker script | 0 | [lcf.log](lcf.log) |
| Generate objdiff configuration | 0 | [objdiff.log](objdiff.log) |
| Link | Not run | Missing `mwldarm.exe` and Windows-tool runner |
| Check all modules with `-f` | 1 | [check-modules.log](check-modules.log), [command](check-result.json) |
| Extract embedded child for independent inventory comparison | 0 | [child-extract.log](child-extract.log) |

[Generation commands](generation-results.json) and [artifact hashes](artifact-hashes.json)
record this run. The native dsd binary's release digest and observed version are
in [toolchain.lock.json](../../toolchain.lock.json). This macOS asset has not been
compared with the Windows binary that produced upstream's reported result.

There are 15 reference objects for 17 modules. Overlays 9 and 13 are separate
32-byte zero stubs. Their constructor terminator and alignment come from the
linker script; absence of a gap object does not remove either check target.
Reference objects and linked objects count as zero reconstructed source.

## Executable scope

The ARM9 project declares main, ITCM, DTCM, and overlays 0 through 13.
All 17 pass the native linked checks. The initial Metrowerks run above had no
linked output.

ARM7 occupies 165,552 bytes and has no overlays. Its internal section boundaries
remain unknown. `ChildRom/JSS2Child.srl`, NitroFS file 79, is an embedded
Download Play executable. It contains compressed ARM9 code with its own main,
ITCM, and DTCM regions, plus an ARM7 program identical to the parent ARM7.
The child has no overlays. Its programs remain outside the ARM9 build.

The NitroFS scan checked direct NDS executable files. Proprietary containers have
not been recursively classified for further executable payloads. Full source
completion requires resolving that inventory gap.

## Native replacement

The exact original-baseline input missing is the owner-supplied `mwldarm.exe`,
preferably `1.2/sp2p3`, with its version and SHA-256. A tested Windows executable
runner is also required. No `mwccarm` compiler is needed for this binary baseline.
Local searches found no linker or compiler archive. The owner confirmed that
the private linker is unavailable.

The owner authorized a Unix or macOS alternative and autonomous continuation.
Bead `jus-bjry.12` records the LLVM experiment. The integrator ran the adapter at
`b0a0243`, all 11 public tests, `dsd check modules -f`, and `dsd check symbols -f`.
Both dsd checks exited 0. All 2,141,728 initialized bytes, load addresses, and BSS
extents also matched direct slices of the pinned original ROM.

The changed linker is pinned in [toolchain.lock.json](../../toolchain.lock.json).
The unavailable Metrowerks binary has not been reproduced. The native ELF keeps
standard Thumb symbol mode bits. A separate `dsd-check.elf` changes section names
and function-address parity for dsd's old checker; it preserves linked payloads.
The initial raw-native symbol check failure is retained in
[native-symbol-result.json](native-symbol-result.json).

[native.md](native.md) describes the adapter and its checker view.
[native-reproduce.md](native-reproduce.md) gives the verified commands.
