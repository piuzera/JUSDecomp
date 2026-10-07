# Checked ARM7 module inputs and instruction policy

Approved bounded experiment, grounded in exact tool source
`0ef447312649db7412ddd98fe0b2b23beb5bd196`. No production pin, function boundary, linked baseline, or source-credit
change is included. The physical adapter and fixed-V4T span decoder are
implemented separately from all existing analyzer/config paths.

## Caller and interface

The next caller starts with an already checked view. It obtains three physical
module inputs for this ROM: Startup, Autoload(0), and Autoload(1). The table
remains separate loader metadata. No ARM9 autoload classification is reused.

```rust
let view = independently_pinned_layout.checked(&actual_parent_bytes)?;
for input in view.module_inputs() {
    record_physical_input(input.identity(), input.initialized(), input.bss());
}
// Explicit observation at a grounded ARM seed, not a function declaration:
let startup = view.module_inputs().next().unwrap();
let observation = startup.decode_span(InstructionMode::Arm, 0x02380000..0x02380008)?;
```

Implemented types and signatures, with bodies omitted:

```rust
// lib/src/rom/arm7_modules.rs; all fields private, no Deserialize/default/constructor.
pub struct Arm7ModuleIdentity<'a> {
    program: &'a ProgramIdentity, // parent hash + exact selector + program hash
    cpu: Cpu,                    // construction always Arm7
    region: Arm7RegionKind,       // Startup or Autoload(original ordered index)
}

pub struct Arm7ModuleInput<'a> {
    identity: Arm7ModuleIdentity<'a>,
    bytes: &'a [u8],
    initialized: Range<u32>,
    bss: Range<u32>,
}

impl Arm7View<'_> {
    pub fn module_inputs(&self) -> impl Iterator<Item = Arm7ModuleInput<'_>>;
}
impl Arm7ModuleInput<'_> {
    pub fn identity(&self) -> &Arm7ModuleIdentity<'_>;
    pub fn initialized(&self) -> Range<u32>;
    pub fn bss(&self) -> Range<u32>;
    pub fn bytes(&self) -> &[u8];
    pub fn target(&self) -> TargetPolicy; // Arm7/ArmV4T/Arm7Tdmi, immutable internal policy
    pub fn decode_span(
        &self, mode: InstructionMode, runtime_span: Range<u32>,
    ) -> Result<Vec<(u32, unarm::Ins, unarm::ParsedIns)>, DecodeSpanError>;
}
```

Identity serialization includes the complete program selector and both hashes,
CPU, and region. No name/address/hash-only shortcut is an identity. Parent and
child inputs remain distinct even with identical bytes and runtime addresses.
The input is constructed only through immutable checked `Arm7View` state;
there is no conversion from `ModuleOptions`, arbitrary bytes, or an ARM9 kind.
No `InstructionMode` default or automatic ARM/Thumb inference is supplied.

`decode_span` privately creates unarm flags with `ArmVersion::V4T`, little
endian and `ual: false`. It does not expose a mutable `unarm::Parser` (whose
public flags permit switching ISA after construction). It checks nonempty,
ordered, aligned (ARM four bytes, Thumb two bytes), initialized-only bounds before slicing; BSS, table,
neighbor-region and overflow spans reject. It returns an atomic result and
checks that every requested byte produced a complete instruction, including
combined Thumb BL. Truncated BL cannot silently yield an empty successful
iterator. `Opcode::Illegal` rejects with its address. This is instruction
observation only: valid decoded instructions do not establish executable
region coverage, function extents, symbols, branch targets, or relocations.

Reuse the existing explicit `InstructionMode::{Arm, Thumb}` and required
`TargetPolicy` description. Add the already available `v4t` feature to the
locked unarm 1.9.2 dependency alongside current `arm`, `thumb`, and `v5te`.
Do not replace `ArmVersion::V5Te` in any existing path or use the dependency's
default version for this adapter. ARM9 behavior remains verified separately.

## Grounded ownership and existing call sites

The graph indexes the pinned source and predates the checked-view additions.
It identified the definitions and call paths below. Several snippets were
stale after the SWI repair; current isolated source reads established the
actual implementation and line references.

| Current seam | Checked fact | Consequence for this step |
|---|---|---|
| `lib/src/rom/arm7.rs`, `Arm7Layout::checked` | Constructs private validated views with program identity and physical loader regions | Sole adapter intake; no second ROM parser or repeated layout checker |
| `lib/src/config/module.rs:134`, `ModuleOptions`; `:144`, `Module::new` | Requires sections, relocations and symbol map; immediately calls `import_functions` | Cannot honestly construct an analyzed ARM7 Module from physical layout alone |
| `lib/src/config/module.rs:470`, `import_functions` | Calls `Function::parse_function` for imported symbols | Physical module inputs must not imply known functions |
| `lib/src/config/module.rs:1428`, `ModuleKind` | ARM9 main, ARM9 overlay and ARM9 autoload kinds; no program or CPU scope | Keep physical ARM7 identity separate now; do not disguise it as Unknown ARM9 autoload |
| `lib/src/config/config.rs:99`, `Config::load_module` | Loads config sections/relocations then calls `RomExt::get_code` and `Module::new` | Later explicit ARM7 config/analysis integration requires a separate reviewed step |
| `lib/src/rom/rom.rs:29`, `RomExt::get_code` | Every current match reads ARM9 main/overlays/autoloads | No ARM7 adapter route through this method |
| `cli/src/config/program.rs:45`, `Program::from_config` | Explicitly loads main as `ModuleKind::Arm9` | No existing CLI call-site wiring in this bounded adapter |
| `lib/src/config/symbol.rs:29`, `SymbolMaps`; `lib/src/config/relocations.rs:491`, `RelocationModule` | Keys are module/program-local; no complete program identity | Future maps must be scoped to a selected program/CPU; no cross-program merged ledger now |
| `lib/src/analysis/functions.rs:64`, `PARSE_FLAGS`; `:591`, `Function::parser` | Fixed V5TE; used by parse/find functions and main/ctor helper paths | New span decoder must explicitly choose V4T rather than reuse these paths |
| `cli/src/analysis/functions.rs:36`; `cli/src/analysis/signature.rs:82` | Disassembly and signatures separately create V5TE parsers | Later analyzer policy threading must cover these consumers too |
| `lib/src/analysis/functions.rs:933` | Branch destination validation accepts `0x01ff8000..0x03000000` | Cannot analyze recovered ARM7 code at `0x037f8468` through current analyzer; not changed here |

Graph inbound traces: `Module::new <- Config::load_module <- Program::from_config`,
CLI disassembly/fix/signature/delink flows; `Function::parser <- CtorRange` and
`MainFunction` helpers `<- Module::analyze_arm9`. Current `Init::run` also
constructs ARM9 main, overlays and ARM9 autoload modules before cross-reference
analysis. None becomes an ARM7 caller by adding this adapter.

The adapter belongs beside checked program extraction in `rom`, before the
analyzed `config::Module` seam. This keeps program/CPU identity and physical
ownership available without requiring fictional Code/Data sections. The
only new experimental caller is a metadata probe. Actual analyzer integration
will later place explicit target policy on analyzed modules and thread it
through all parser consumers; this step does not create that migration.

## Test-first acceptance

Public invented fixtures must exercise the same `checked -> module_inputs ->
decode_span` path used by the private metadata probe:

1. Exactly Startup/Autoload(0)/Autoload(1), correct initialized and BSS ranges;
   table excluded; no invented mode or function metadata.
2. Parent and embedded child with identical ARM7 bytes retain distinct full
   identities. A second embedded path with identical program bytes remains a
   separate program instance. Ordered autoload indices cannot collide with
   startup or be relabeled as ARM9 ITCM/DTCM.
3. ARM and Thumb v4T fixture instructions decode with explicit modes. A v5-only
   ARM BLX register instruction (`0xe12fff30`, existing unarm V5TE fixture)
   must not be accepted by the ARM7 span decoder; the legacy V5TE decoder must
   continue to accept it. Verify the actual V4T result in the red test before
   relying on a mnemonic. Include Thumb BL/BLX version separation.
   Exact public version vectors from the locked unarm tests (little endian):

   | Mode | Bytes | V4T | Explicit legacy V5TE |
   |---|---|---|---|
   | ARM BX r0 | `10 ff 2f e1` | accept | accept |
   | ARM BLX r0 | `30 ff 2f e1` | reject as Illegal | accept |
   | Thumb BX r10 | `50 47` | accept | accept |
   | Thumb BLX r10 | `d0 47` | reject as Illegal | accept |
   | Thumb BLX immediate | `00 f0 00 e8` | reject | accept combined instruction |
   | Thumb BL | `99 f0 66 f8` | accept combined instruction | accept combined instruction |
   | Truncated Thumb BL prefix | `00 f0` | reject incomplete span | legacy parser behavior recorded separately |

   V4T rejection must be observed in red tests through the actual locked
   parser, rather than asserted from the label of an opcode.

4. Unaligned, reversed, empty, overflow, BSS, table, neighboring-region and
   partly out-of-range requests reject without panics or partial output.
   A trailing Thumb BL prefix rejects as incomplete rather than disappearing.
5. ARM9 CPU/ISA/processor mutations fail at checked intake; inputs cannot
   expose a setter or arbitrary-flag parameter that silently changes V4T.
6. Existing 29 library/checked-view tests stay green, including reserved
   overlay IDs and decoded-name alias preflight regressions. Existing ARM9
   parser tests and strict parent/child ARM9 init proofs retain their policy.

Actual private proof uses the same independently pinned sidecar
SHA256 `8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
Both selected programs must produce the exact prior region hashes/ranges,
program identity, and zero source credit with unchanged input files. Observe
only explicitly grounded short ARM spans at startup and autoload0's known
`0x037f8468` seed; publish addresses, lengths, policy and counts/hashes, never
ROM bytes or private instruction payloads. No autoload1 mode or entry is
invented. Decoding these observations is not an ARM7 binary baseline.

## Smallest implementation scope and deferred facts

Recommended scope: one new `rom/arm7_modules.rs`, its module declaration, one
new integration test file, the single unarm feature addition, and an optional
metadata-only example adjustment. No `ModuleKind`, `Config`, `Program`, section,
symbol, relocation, function analysis, existing ARM9 parser, or production pin
changes. A descriptor-only alternative would repeat existing checked-view
metadata and leave the ISA declaration unproved; the bounded decoder supplies
a real CPU-policy test while preserving this small scope.

Next steps after this adapter require grounded ARM7 section/function metadata,
CPU-scoped analyzer policy including valid ARM7 RAM branch targets, and
program-scoped symbol/relocation ownership before actual linking. Startup
external RAM sources `0x023fe940` and `0x023fe904` remain unresolved. Known ARM
seeds do not establish function extents, autoload-wide modes, code/data split,
original SDK/ABI/compiler identity, or source matching. T10 stays open.

The completed experiment adds exact-consumption tests for combined Thumb BL
followed by BX, and typed rejection at the first unobserved trailing BL byte.
Fresh parent/child strict ARM9 initialization preserves all 51 parent and 9
child symbols/relocations/delinks metadata hashes; generated config.yaml is
excluded from this comparison because output/build paths intentionally differ.
