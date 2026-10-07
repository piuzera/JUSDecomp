# ARM7 analysis and binary baseline design

T10 needs an explicit ARM7 path through dsd extraction, analysis, delinking, linking, and ROM reconstruction. This design keeps the existing ELF emitter and adds checked ARM7 image views and CPU identity. It grants zero source credit. ARM7 source completion remains separate from a binary baseline.

The pinned ds-decomp parent is `9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe`. Current upstream HEAD `c4080635ac38aaf9608ca23751defa9fa19cf81a` still has no ARM7 module kind and fixes analysis to ARMv5TE. An upstream upgrade alone does not provide ARM7 support. See [upstream module kinds](https://github.com/AetiasHax/ds-decomp/blob/c4080635ac38aaf9608ca23751defa9fa19cf81a/lib/src/config/module.rs#L1530) and [upstream parser policy](https://github.com/AetiasHax/ds-decomp/blob/c4080635ac38aaf9608ca23751defa9fa19cf81a/lib/src/analysis/functions.rs#L67). Production tool pins remain unchanged.

## Checked physical layout

Both ARM7 instances have identical 165,552-byte images with SHA256 `0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`. Their program identities differ:

| Program | Program SHA256 | ARM7 offset in program |
| --- | --- | --- |
| Parent ROM | `a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27` | `0x210000` |
| `ChildRom/JSS2Child.srl` | `1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986` | `0x1e1a00` |

Header load and entry addresses are both `0x02380000`. The loader's parameter block is at `0x02380198`. Its first five words are `0x023a8698`, `0x023a86b0`, `0x023801b0`, `0x023801b0`, and `0x023801b0`. They describe the table extent, payload start, and equal main BSS endpoints.

| Module | Stored offset | Initialized bytes | Runtime load address | BSS bytes |
| --- | ---: | ---: | --- | ---: |
| Startup | `0x0` | 432 | `0x02380000` | 0 |
| Autoload0 | `0x1b0` | 66,120 | `0x037f8000` | 14,920 |
| Autoload1 | `0x103f8` | 98,976 | `0x027e0000` | 6,504 |
| Layout table | `0x28698` | 24 | Metadata | 0 |

The initialized images total 165,528 bytes. The table completes the stored image, and BSS totals 21,424 bytes. Autoload0 BSS ends at `0x0380bc90`; autoload1 BSS ends at `0x027f9c08`. The table SHA256 is `43bedd33d998a1473ee2dc87eb859f5f75eb9939892c87978c1349700bd57a7f`.

The committed [arm7-autoload-scope.json](arm7-autoload-scope.json) records region hashes and loader evidence. The checked-view candidate must pin the exact sidecar bytes it consumes; the design does not use a moving sidecar hash as a verification result. ARM7's extracted `build_info: 0` is not an ARM9 module-parameter record or an SDK identity.

## Proposed interface

These interfaces and commands are proposed. The checked view owns slicing, validation, and program selection for every analysis caller.

```rust
struct ProgramIdentity {
	parent_rom_sha256: Sha256,
	program_path: String,
	program_sha256: Sha256,
}

struct Region {
	kind: RegionKind,
	stored_extent: Range<u32>,
	runtime_base: u32,
	bss_bytes: u32,
	sha256: Sha256,
}

struct Arm7Layout {
	identity: ProgramIdentity,
	image_offset: u32,
	image_sha256: Sha256,
	base: u32,
	entry: u32,
	params_offset: u32,
	regions: Vec<Region>,
	table_extent: Range<u32>,
	table_sha256: Sha256,
}

struct Arm7View<'a> { /* checked startup, ordered autoloads, table, identity */ }
impl Arm7Layout {
	fn checked<'a>(&self, parent_rom: &'a [u8]) -> Result<Arm7View<'a>, LayoutError>;
}

enum Cpu { Arm9, Arm7 }
enum ModuleKind { /* existing kinds */, Arm7, Arm7Autoload(u32) }
struct TargetPolicy { cpu: Cpu, isa: Isa, processor: Processor }
```

`checked` verifies the parent ROM hash. It selects the parent program or resolves the child through its original NitroFS path, then verifies that program hash. It checks the header's CPU image offset, size, load address, and entry. It validates the image hash, parameter words, table hash, and both 12-byte records. Checked arithmetic rejects overflow, gaps, overlaps, unaligned word-copy extents, and slices outside the image. Runtime initialized and BSS extents cannot overlap another module. Ordered payload sizes must end exactly where the table begins. The table must end exactly at the image end.

`TargetPolicy` requires `Arm7`, ARMv4T, and `arm7tdmi` for every ARM7 module. Module identity determines CPU; an ARM9 policy cannot override an ARM7 kind. Source compilation additionally requires explicit ARM or Thumb mode and independently pinned compiler and runner hashes. A binary reference baseline does not establish the original compiler or ABI.

Each `Program` represents one program and one CPU. Parent and child ARM7 contexts use separate configuration paths and symbol maps. `Arm7Autoload(0)` and `Arm7Autoload(1)` describe the loader records. They do not imply ITCM or DTCM.

Candidate usage is explicit:

```sh
dsd init --cpu arm7 --arm7-layout <pinned-layout.json> \
	--rom-config <program-config.yaml> --output-path <isolated-output>
```

Generated ARM7 configs carry the explicit target policy and checked layout identity. Existing ARM9 configurations retain their current behavior. The port does not infer CPU from a filename or destination address.

## Analysis and reuse

The startup entry is ARM. Its final `BX r1` loads `0x037f8468` from literal `0x023800f8`. Bit 0 is clear, and the destination has an ARM prologue. This proves an ARM function seed at offset `0x468` inside autoload0. Whole-region modes, function extents, and code and data partitions remain unresolved. Autoload1 has no grounded entry seed.

The dsd changes concentrate at these seams:

| Existing source | Change |
| --- | --- |
| `lib/src/rom/rom.rs`, `RomExt::get_code` | Return checked ARM7 startup or autoload bytes. ds-rom `Arm7` currently exposes only the complete image and offsets. |
| `lib/src/config/config.rs`, `ModuleKind`, `Program::from_config` | Iterate and load explicit ARM7 kinds. Preserve program identity in generated and loaded configurations. |
| `lib/src/analysis/functions.rs` and CLI analysis paths | Pass the module ISA through parsing, instruction definitions and uses, signatures, and disassembly. Enable pinned unarm 1.9.2's existing `v4t` feature. |
| `Module::analyze_arm9` and autoload analysis | Add ARM7 section discovery from checked views and grounded seeds. Do not run secure-area scans or assume ARM9 constructors, exception metadata, DS Protect, or TCM roles. |
| Relocation destination kinds, LCF generation, linked-section parsing | Add `ARM7`, `ARM7_AUTOLOAD_0`, and `ARM7_AUTOLOAD_1` names and CPU-aware relocation destinations. |
| ROM configuration and reconstruction | Reassemble the three linked initialized images in original stored order, followed by the preserved checked table. |

`DelinkObject` already emits little-endian ARM ELF objects, sections, symbols, and relocations. Reuse that implementation after module identity, byte views, modes, and relocation metadata are correct. Native linking must use ARMv4T attributes. Every parser path must receive the policy, including imported functions and CLI signatures. Changing only the first parser call leaves ARM9 assumptions active elsewhere.

## Strict acceptance

The first tests use invented images and instructions. Acceptance rejects each of these cases:

- An ARM7 kind paired with ARM946E, ARMv5TE, an omitted CPU policy, or ARM9 ELF attributes.
- A changed program, payload, table, or region hash. Identical ARM7 payloads do not authorize reuse under the other program identity.
- An out-of-bounds parameter pointer, truncated record, arithmetic overflow, overlapping destination, missing region, or incorrect physical ordering.
- A declared ARM entry with a Thumb target, or a declared Thumb entry with an ARM target. Direct ARM and Thumb calls preserve their respective modes. A statically resolved `BX` uses the target's low bit.
- ARMv5-only instructions in a known ARMv4T code extent. Literal data remains data rather than a guessed function.
- An unknown local direct call, skipped relocation analysis, or a relocation check with failed or unresolved records. No `--allow-unknown-calls` baseline bypass is accepted.
- A modified original branch word, pool target, normalized reference object, linked relocation result, selected linker input, tool, or configuration. Relocation comparison reads the live original image and actual linked artifact, not a copied success report.
- A stale module or ROM output, or a changed input during the run. Completion requires fresh artifacts and exact module and whole-program hashes.

ROM bytes contain instructions and address words, not original ELF relocation records. dsd must infer relocation records from verified ARM7 code and data metadata. The checker compares each inferred record with the original encoded target and the actual linked target. A whole image labeled opaque data can prove preservation, but cannot pass the analysis and relocation baseline.

## Implementation sequence and remaining facts

1. Add the checked layout interface and public negative fixtures in an isolated tool checkout. Return the three image views and table metadata with zero source credit. This is the smallest unaided follow-up.
2. Add explicit module kinds and target policy. Cover config reload, symbol-map identity, and ARMv4T parsing without changing ARM9 behavior.
3. Analyze startup and the grounded autoload0 ARM seed. Recover function modes and code, literal, and data extents for both autoloads. Stop at each concrete unresolved call or partition instead of inventing symbols.
4. Reuse ELF emission to delink validated extents. Generate CPU-aware LCF placement and link with pinned ARMv4T tools. Compare load addresses, initialized bytes, BSS endpoints, symbols, and every inferred relocation against the live original image.
5. Reassemble the ARM7 image from every linked initialized module plus its checked table. Require both original ARM7 bytes and whole-program hashes for separate parent and child runs. Record remaining unknowns and keep source credit zero.

Concrete blockers are the absent ARM7 views and module kinds, fixed ARMv5TE policy, unresolved function modes and partitions, and missing original compiler and ABI evidence. A complete binary baseline remains blocked on trustworthy section and relocation metadata.

Startup also copies 352 bytes from `0x023fe940` to `0x027ffa80`, then 32 bytes from `0x023fe904` to `0x027ffbe0`. Both sources are outside the stored ARM7 image. Their contents and executable status remain unresolved external RAM dependencies. They receive no speculative executable or source credit.

T10 remains open until every required non-ARM9 executable is fully source-built. Function totals, runtime executable scope, and global source coverage remain unresolved. The proprietary-container scan also remains open. Emulator smoke testing belongs to T07.
