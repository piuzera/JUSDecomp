# Other executable bootstrap: T10 remains open

This bootstrap verifies preserved original bytes and fresh extraction. The preserved-scope verifier grants no linked baseline or source promotion; the separate candidate experiments below establish child ARM9 binary evidence. `residual-executables.json` imports the exact T01 inventory and records its SHA256. Source credit is zero, and the global coverage percentage remains unknown.

Current accepted evidence extends this bootstrap: the canonical 21-stage
reconstruction consumes fresh child ARM9 and paired native ARM7 outputs and
reproduces the original parent and child ROM hashes. ARM7 outputs still preserve
opaque original initialized bytes and earn zero source credit. See the
[physical baseline](arm7-physical-baseline/README.md),
[checked graph](arm7-reachable.md), and
[callee prefix grounding](arm7-callee-prefix-grounding.md).
Original ARM7 function ownership and relocations remain unresolved; T10 stays open.

| Program | CPU | Stored bytes | Remaining source work |
| --- | --- | ---: | --- |
| Parent ROM | ARM7 | 165,552 | Entire executable; sections, functions, relocations and ABI unresolved |
| `ChildRom/JSS2Child.srl` | ARM9 | 1,955,956 | Entire executable; candidate native baseline and binary roundtrip only |
| `ChildRom/JSS2Child.srl` | ARM7 | 165,552 | Entire executable; sections, functions, relocations and ABI unresolved |

The two ARM7 payloads are byte-identical. They remain separate program instances with separate program hashes and CPU identities. ARM7 stored ranges are recorded as offsets within the executable, without inferring expanded RAM sections or BSS.

The child ARM9 expands to 2,628,408 bytes: main 2,624,320, ITCM 3,968, DTCM 96, and a 24-byte autoload table. Its main BSS is 105,760 bytes, and DTCM BSS is 32 bytes. These values come from the original module parameters and autoload table. The inventory retains the SDK word `0x03017534`; no ARM7 SDK version is inferred from it.

Fresh pinned dsd extraction reproduces both ARM7 hashes and the child ARM9 modules. dsd clears the child's `compressed_static_end` word during extraction. The comparison restores only that documented word from pinned metadata; every other module byte must match. Both the raw extracted hash and the compared original-domain hash are retained.

The original pinned dsd revision `9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe` supports ARM7 ROM extraction, but its analysis and delink model supports only ARM9. Its `ModuleKind` has no ARM7 variant, and its function parser fixes the ISA to ARMv5TE. Exact source files and line references are in the ledger. Original strict child ARM9 initialization fails: the call at `0x020ae19e` targets `0x02000822`, where no function was found. No relaxed unknown-call analysis was used.

The candidate [dsd repair](dsd-child-swi.patch) passes strict child initialization and establishes a [child ARM9 native reference baseline](child-arm9-native-baseline.json). All three initialized images, load bases, BSS boundaries, symbols and 35,092 relocations pass. [Reproduction instructions](child-baseline.md) describe this separate patched-tool experiment. Production tool pins remain unchanged. The candidate [child compression roundtrip](child-rom-roundtrip.json) now reproduces every original stored ARM9 byte and the whole child hash from the three native reference images. [Reproduction instructions](child-roundtrip.md) distinguish this preserved-layout packer from the generic ROM builder, which fails on the empty filesystem. The later paired ARM7 physical baseline is accepted for native byte-preserving reconstruction; original function/source/relocation ownership remains unresolved, and every executable in this scope still has zero source credit.

`cpu-policy-probes.json` records independent selection of `arm7tdmi` and ARMv4T with the pinned compiler and runner. The invented `public_cpu_probe.c` compiles in both explicit ARM and Thumb modes. This proves compiler target support, with zero original source credit. Original ARM7 compiler, ABI, SDK signatures and link metadata remain unresolved.

## Reproduce preserved-scope checks

Set `ROM` to the private original ROM, `DSD` to the pinned dsd executable, and `BUILD` to a fresh ignored build directory. Run from the repository root:

```sh
python3 -m unittest discover -s tests/matching -p test_other_executables.py
python3 tools/scripts/other_executables.py --rom "$ROM" --inventory decomp/matching-notes/baseline-t01/executable-regions.json --output "$BUILD/scope.json"
"$DSD" rom extract --rom "$ROM" --output-path "$BUILD/parent"
"$DSD" rom extract --rom "$BUILD/parent/files/ChildRom/JSS2Child.srl" --output-path "$BUILD/child"
"$DSD" init --rom-config "$BUILD/child/config.yaml" --output-path "$BUILD/child-analysis" --build-path "$BUILD/child-build"
```

The last command exits with status 1 at the unresolved child call. The standalone scope command does not run extraction or grant verification-pipeline credit. Its input inventory is trusted pinned metadata supplied by the caller. `verify_extracted_payload` compares actual fresh ARM7 bytes; `verify_extracted_arm9_modules` compares the child module files. `probe_cpu_compiler` checks actual compiler, runner and source hashes before and after compilation, requires explicit CPU and instruction mode, and inspects the resulting ELF functions.

T10 still requires original ARM7 function and relocation ownership, independent original compiler matching, source promotion of every residual interval, and recursive executable discovery in proprietary asset containers. Remaining function and symbol counts are unknown, not zero. Emulator smoke testing belongs to T07 and was not run here.

The root repeated extraction and CPU probes at producer `a2ffe1df8a3da44084978f6d481110bdb3049900`.
`fresh-scope.json`, `fresh-extraction-checks.json`, `fresh-cpu-probes.json`
and `strict-child-init.log` record these runs. The independent review is
in `../header-dependencies/review.json`. T10 remains open.

`arm7-autoload-scope.json` recovers physical ARM7 placement from the actual
startup loader. The 432-byte startup copies 66,120 and 98,976 initialized bytes
to `0x037f8000` and `0x027e0000`, then clears 14,920 and 6,504 BSS bytes.
The 24-byte table completes the original 165,552-byte stored image.
Function modes and code/data boundaries remain unresolved; this inventory
earns zero source or linked-baseline credit.

The observed ARM7 entry seed is `0x037f8468` in autoload0, reached by an
ARM-state startup branch. Autoload1 mappings and all code/data partitions remain
unresolved. Startup also copies 352 bytes from `0x023fe940` to `0x027ffa80` and
32 bytes from `0x023fe904` to `0x027ffbe0`. These sources lie outside the stored
image; their contents and executable status are unresolved RAM dependencies.
They grant no autoload or source credit.
