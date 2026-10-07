# Original signed-byte fold contract

This records new arithmetic and read-order ground for original ARM9/main `func_020326b0`. Saved Loop Atlas, the owner's reuse note, the query listings and existing pilot contracts did not record this exact recurrence. Accepted36 already established the full44 extent/SHA, signed-byte reads, NUL termination, a16-bit accumulator, no calls and no NULL guard. Those facts are inherited and rechecked here.

For stable readable bytes terminated by NUL, start with `h=0`. For each consumed nonzero byte `b`:

```text
s = b if b <128 else b-256
h_next = h XOR ((s OR (h <<1)) AND 0xffff)
```

At `020326c8`, the routine reads a signed byte and tests zero. If nonzero, `020326b8` rereads that same position and advances the pointer by one. At `020326bc`, it ORs the body byte with the old accumulator shifted left1. The left16 shift at `020326c0` and logical right16 operand at `020326c4` isolate the OR result's low16 before XORing the old accumulator. Stable input of length n causes2n+1 byte loads; the terminal NUL is read once, with no suffix read. Stability is a prediction precondition, not recovered const/volatile or ownership semantics.

Incoming `r0` supplies the readable byte pointer. No additional incoming data argument or stack value is consumed; LR supplies the return target and must permit normal return. The routine writes no memory and uses no stack. `r0` returns the zero-extended accumulator in0..65535; `r1=0` and `r2=h` at normal return. Registers `r3` through `r12`, SP and LR remain unchanged. The final zero comparison leaves N=0,Z=1,C=1,V=0. Original SDK identity, source language and type names remain unestablished.

These are derived mathematical predictions, **not measurements of original runtime**:

| Input bytes (hex, including NUL) | Predicted return |
| --- | --- |
| `00` | `0000` |
| `41 42 00` | `0083` |
| `80 00` | `ff80` |
| `80 41 00` | `00c1` |
| `ff ff 00` | `0000` |
| `41 00 42` | `0041` |

An independent per-bit Boolean form agrees on66,300 one-step cases and all10 stored vectors. Concrete refuters distinguish signed/unsigned bytes (`80 00`), OR/addition/XOR (`41 42 00`), and omitted truncation. Neither Python calculation executes original instructions or proves original caller input validity.

Fresh original DSD evidence contains62 named target call relocations in nine objects, belonging to42 region-qualified containing functions:59 `R_ARM_PC24`/addend-8 and3 `R_ARM_THM_PC22`/addend-4. Every loaded branch decodes to `020326b0`. The saved query reported60 branch rows plus17 main caller summaries (77 mixed references); it omitted Thumb BLX ov001 `02154ad8` and ov005 `0215fca6`. Counts per object and every actual site/owner/relocation/loaded instruction are retained in [contract.json](contract.json).

The full44 helper has no pool and no RELA **within its extent**. Its containing original main gap object has six allocated sections and many unrelated relocations. Section inventory includes NOBITS `.bss`, which has no initialized file payload. Full helper raw-object bytes equal loaded ROM bytes, SHA `f307aadf611ab3217668d354c5250bed2ec4ca914b6cee852afbcbd62cc638c0`; containing object SHA is `248e6844754b8c07c9d8b037ca7c01600dfc7566ec61a168aab69c8d238696c3`.

Reproduce from a committed checkout, supplying the owner ROM and pinned DSD binary with a fresh absolute output:

```sh
python3 decomp/matching-notes/pilot-t06/signed-byte-fold-contract/check_original.py --rom /path/to/jus.nds --dsd /path/to/dsd-macos-arm64 --output /private/tmp/jus38-fresh
JUS38_ORIGINAL_OUTPUT=/private/tmp/jus38-fresh python3 decomp/matching-notes/pilot-t06/signed-byte-fold-contract/test_original.py -v
```

The checker validates its finite57-file repository closure and two owned runtime files before repository imports, validates actual ROM/DSD identity/version, freshly extracts/delinks all17 modules, checks all15 original object identities, full44/section/RELA geometry, all62 original loaded branch destinations, predictions, and input/artifact freshness. It exclusively publishes a checked ordinary-file `readback.json`. There is no cached ELF or main analysis checkout runtime dependency. Python standard library, macOS and DSD runtime libraries are external runtime assumptions. Root's existing47-file Git-LF/checkout-CRLF ownership gate separately verifies committed provenance; these pins do not replace it.

Actual original-copy positive and four changed-object controls pass: helper instruction, extent44→40, incoming addend and incoming target. Nine CLI/input controls reject wrong ROM, wrong DSD, wrong actual-input pins, `-O`/`-OO`, existing output and a broken output symlink. Evidence retains the behavior-red/green logs and independent static/incoming reviews. The initial addend test accidentally wrote the existing Thumb addend-4; that case was not a mutation red. It was corrected to old_addend+4, every case now asserts changed bytes, and the real parser baseline was rerun before final boundary checks. The initial broad register wording was also narrowed to data arguments, explicitly retaining LR's return role.

This is static original-only research. No emulator, instruction interpreter, target C/C++, compiler trial, source promotion, ARM7 or canonical change was performed. ARM9 source remains304, ARM7 zero and the global denominator unknown. The stopped initializer model is unchanged. A later source trial requires a separate reviewed scope/design/release; this contract alone does not establish original ABI/source binding.
