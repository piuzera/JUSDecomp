# Feasibility and acceptance plan

These are source-grounded design checks and proposed red/green tests, not newly executed proofs.

## Locked dependency

`Cargo.lock:3351` pins unarm 1.9.2, checksum `9ea856cd3ee3abd1b585bbcdc6f8a4b356f43558fae98d76e502be868dc40e90`. `lib/Cargo.toml:22` enables arm, thumb, v4t and v5te with default features disabled. Inspected source root is `/Users/djdjo/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/unarm-1.9.2/src`.

Actual signatures in `parse.rs`:

```rust
pub fn Parser::new(mode: ParseMode, address: u32, endian: Endian,
                   flags: ParseFlags, data: &'a [u8]) -> Self;
impl Iterator for Parser<'_> { type Item = (u32, Ins, ParsedIns); }
pub struct ParseFlags { pub ual: bool, pub version: ArmVersion }
pub struct ParsedIns { pub mnemonic: &'static str, pub args: Arguments }
pub fn ParsedIns::combine_thumb_bl(&self, second: &Self) -> Self;
```

Actual ARM and Thumb signatures in `arm/disasm.rs` and `thumb/disasm.rs`:

```rust
pub fn Ins::new(code: u32, flags: &ParseFlags) -> Self;
pub fn Ins::parse(self, flags: &ParseFlags) -> ParsedIns;
pub fn Ins::defs(self, flags: &ParseFlags) -> Arguments;
pub fn Ins::uses(self, flags: &ParseFlags) -> Arguments;
pub fn Ins::is_conditional(&self) -> bool;
```

`args.rs:36` has `Argument::BranchDest(i32)`. ARM `generated.rs:6695` includes the +8 pipeline bias in its offset; Thumb `generated.rs:1740` and `1745` include +4. Compute destinations as `address.wrapping_add_signed(offset)`, without adding another pipeline bias. CPU address arithmetic wraps; byte slices use checked arithmetic. Every defs/uses call uses explicit V4T flags, never Default. Combined Thumb BL yields the second half's Ins; its raw bits cannot represent the complete four-byte instruction. Use ParsedIns for the combined branch destination and recovered instruction width from successive addresses or the validated selection end.

The parser can consume a Thumb BL prefix and return None before yielding an instruction. Checked decode_span's first-unobserved-byte tracking already rejects this. Reuse that atomic boundary. Neither Parser exhaustion nor a reported end override is sufficient.

## Interpretation rules

1. Validate all context modules against the source's complete ProgramIdentity and ARM7 CPU. Require the source identity in the context; reject duplicate regions or overlapping ownership. Resolve initialized and BSS independently. A missing mapped owner means unresolved bytes, not invalid instruction.
2. Executable declarations must name context-owned initialized ranges with nonempty evidence references. Reject conflicting overlaps. Absence is unknown executable status, never a negative executable claim. Optional declared mode remains independent of an edge's required mode. BSS cannot receive a declaration in this deliverable.
3. Decode every selected byte before returning any observation. Index every instruction start and occupied byte interval. A target into the second half of a Thumb BL is an instruction-interior target, not an analyzed instruction start.
4. ARM/Thumb B and BL use the same destination classifier and preserve current mode. B has taken edges; conditional B has a complementary not-taken fallthrough. BL has a call edge and an `IfCallReturns` continuation. Conditional BL also has a not-taken fallthrough. Neither continuation proves the call returns. Include ordinary next-instruction fallthroughs, including the external boundary after the final selected instruction, without claiming a function end.
5. For BX, unknown registers stay indirect. A matching scoped exchange fact can produce an address and mode under that evidence. Derive ARM versus Thumb from the value's low bit and apply ARMv4T alignment rules; diagnose invalid known alignment rather than silently treating it as ordinary mapped code. Match facts only to valid decoded BX instructions, source mode and identity. No address fact changes a source instruction's decode mode. No automatic cross-mode traversal occurs.
6. PC-writing instructions identified using explicit-V4T defs require conservative indirect-transfer handling. Treat exception instructions and state-restoring PC writes separately; preserve unknown destinations or modes. Unknown control effects suppress a claimed unconditional fallthrough. Conditional PC writes retain only the untaken fallthrough as unconditional interpretation of that arm. No unsupported instruction may silently be treated as an ordinary instruction.
7. Normalize address, mode and mapping once for every numeric destination. Numeric jump-table patterns are not expanded in this increment; they remain indirect observations. No observed transfer becomes a relocation, symbol, function, reachability fact or source-credit count.

The type sketch's conditional marker represents whether an edge is conditional, not its exact ARM condition predicate. Complementary edges share their source instruction, whose text retains that predicate. If consumers need symbolic path reasoning later, introduce explicit predicates then.

## Red/green fixtures

| Contract | Red fixture | Green fixture and expected result |
| --- | --- | --- |
| ISA | ARM `e12fff30`, Thumb `47d0`, Thumb `f000 e800` reject under V4T even after a valid prefix | ARM `e12fff10`, Thumb `4750` produce BX observations; separately explicit V5TE still accepts BLX |
| Span | empty/reversed, below-base, odd Thumb, non-word ARM, beyond initialized, BSS/table selection all reject without panic or partial report | legal Thumb span beginning at base+2 works; a complete ARM word works |
| Full identity | parent's source plus child's equal-byte module/context/declaration/fact rejects | equal payloads in parent, ChildRom/public.srl and ChildRom/copy.srl produce three distinct report identities |
| Complete Thumb BL | `f000` alone, valid instruction plus `f000`, `f000 4750`, or lone `f800` rejects atomically | bytes `99 f0 66 f8 50 47` yield BL at base, BX at base+4; BL width 4 and branch offset `0x990d0` |
| Mapping | initialized target with no code declaration never gets executable status; BSS never gets initialized-byte status | B and BL to the same checked target have identical ownership classification; external address has unresolved bytes |
| ARM7 range | an ARM B to a checked destination at `0x037f8468` must not hit ARM9's `0x03000000` ceiling | corresponding synthetic checked layout or grounded autoload selection accepts mapping at that address |
| Mode | ARM B to a Thumb declaration records ModeConflict; unknown BX stays unknown despite a declaration at a guessed target | scoped BX fact with odd address records Thumb target; aligned even address records ARM target; both retain evidence |
| Extent honesty | self-B followed by valid bytes must not truncate result or claim all bytes reachable | all selected bytes remain observations; outgoing edges outside selection stay external to the observation |
| Boundary | branch into second half of combined Thumb BL is not an InstructionStart | a target at the following instruction is InstructionStart |

Existing fixture support in `lib/tests/arm7_module_inputs.rs` already covers ISA separation, immutable target copy, range rejection, parent/child/path distinction, complete Thumb BL and ARM9 BLX compatibility. Its synthetic autoload base is `0x037f8000`; do not present it as the grounded real autoload0 address `0x037f8468`. Extend the synthetic fixture deliberately for that regression. Future tests must create Arm7ModuleInput through Arm7Layout::checked; no public raw-input constructor is added for convenience.

## Compatibility proof obligation

The proposed source edit boundary is one new analysis module, one export, and tests. It changes no ARM9 parser, Function/Module/Config type, CLI initializer, dependency feature or existing decoder semantics. The existing public `existing_function_parser_keeps_explicit_v5te_and_blx_support` test exercises V5TE BLX through Function::parse_function and Function::parser and is the direct baseline check. Re-run it, the existing ARM7 boundary tests and the library test suite after implementation. Compare the final diff to this boundary. Until those commands run on implemented code, this is a compatibility argument and test plan, not a passed proof.

## Red-flag screen

The public operation does more than forward decode_span: it validates context identity, extracts transfer semantics, checks destinations, reconciles modes and protects complete-consumption semantics. No caller runs those stages. Input facts remain explicit because the checked physical view cannot supply them; their provenance remains visible in results. A single analysis module owns all control-flow policy, avoiding temporal decomposition. No unarm transport types escape. The optional exchange fact list is the largest added input burden; keep it optional and exclude symbolic execution and jump-table discovery from this increment.
