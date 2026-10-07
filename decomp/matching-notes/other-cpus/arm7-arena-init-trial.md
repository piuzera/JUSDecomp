# Bounded ARM7 initializer caller trial

One frozen plain C caller hypothesis compiles and links to the complete original initializer selection in both program identities. The five actual compiler objects reproduce both original 165552-byte ARM7 images exactly, with six native loads and 21424 bytes of separate BSS. This establishes a bounded compiler and relocation correspondence. ARM7 source credit remains zero, canonical 304 stays fixed, and T06 and T10 remain open.

## Original grounding before the model

The original-only read checks the parent NDS header, FNT path `ChildRom/JSS2Child.srl`, FAT 79, both complete program identities, both ARM7 image hashes, module parameters, loader table, and initialized-region hashes against the capsule's own [checked layout](arm7-arena-init-proof/checked-layouts.json). Its SHA256 is `8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`. Only initialized bytes are accessible to the ROM reader. Reading a BSS address through that accessor rejects.

The requested finite ARM window `[0x037fd004,0x037fd0cc)` contains 50 instructions and three observed sequences. LLVM ARMv4T independently decodes each nonoverlapping selection. The [manifest](arm7-arena-init-proof/original-manifest.json) retains every original word and the separate four-byte literal.

| Observed selection | Bytes | Effect | SHA256 |
| --- | ---: | --- | --- |
| `[0x037fd004,0x037fd018)` | 20 | Load word at `0x027ffda0 + (r0 << 2)`, then `BX lr` | `d714db36568f87382608e68dc45eb84a63bfe2d98e3869d5c1562567987e0c6e` |
| `[0x037fd018,0x037fd02c)` | 20 | Load word at `0x027ffdc4 + (r0 << 2)`, then `BX lr` | `b9133a64c254987fd068341728344b7bc29c68411d2334e0744eab80a9dac262` |
| `[0x037fd02c,0x037fd0cc)` | 160 | Guarded caller sequence and epilogue | `83038b37535751d27c4d0d60b283dfd8f72b63f81fbb92549ade31979ac31f9b` |

The complete 200-byte instruction window has SHA256 `c1472773a84b47d1352f2977d06866664bc9b4cc987bc142bb7e66a27cd14fd3` in both identities. The first two sequences remain opaque original bytes in the native proof. These ownership splits do not establish original routine names, signatures, or function extents.

The earlier [selected caller evidence](arm7-callee-prefix-grounding.md) enters `0x037fd02c` from BL at `0x037fced4`, reached under the explicit root assumption at `0x037f8468`. Entry at `0x037fd004` is not assumed. The [guard and literal evidence](arm7-branch-literal-grounding.md) and [caller continuation](arm7-arena-caller-tail.md) retain the original NE and `call_returned` guards. The new original reader independently rechecks their relevant words without expanding another frontier or producing a new graph.

At `d034`, `ldr r1,[pc,#0x90]` selects `d0cc`. That separately read initialized data word is `0x03808430`, SHA256 `57b0891abc6d6b61a7345b6a995c20fdeb937a1f7ca61ffa06b012074e0e73a4`. It points `0x1e8` bytes into autoload0 BSS. Its runtime contents have no stored ROM bytes. The literal lies at ARM7-image offset 21116, or autoload0-relative offset 20684.

At `d038` the code loads that word through `r1`, and at `d03c` compares it with zero. The NE-passed branch at `d040` reaches the epilogue at `d0c0`. The condition-failed path at `d044` loads 1 and at `d048` stores 1 through the same `r1` before the calls. Prefix `0x037f` applies to all shortened addresses below.

| ID immediate | Upper getter | Upper store | Lower getter | Lower store |
| ---: | --- | --- | --- | --- |
| 1 | `d04c → cf84` | `d058 → cf18` | `d060 → cf2c` | `d06c → cf04` |
| 7 | `d074 → cf84` | `d080 → cf18` | `d088 → cf2c` | `d094 → cf04` |
| 8 | `d09c → cf84` | `d0a8 → cf18` | `d0b0 → cf2c` | `d0bc → cf04` |

Each setter call receives the preceding returned `r0` in `r1`, followed by the same immediate ID in `r0`. Every BL continuation remains conditional on `call_returned`. The epilogue adds 4 to `sp`, loads `lr`, then executes `BX lr` at `d0c8`. That destination remains unknown, as do the two preceding load sequences' BX destinations and startup's BX. BSS ownership does not establish the feasible guard path, memory history, loader execution, callee return behavior, or execution of any selected instruction.

## One frozen source and actual compiler object

The [source model](arm7-arena-init-proof/arena_init_trial.c) was frozen before compilation and independently checked against the original instructions and four accepted callee interfaces. Its SHA256 is `b014099daa3d3dc1e2a14ca39a434726946067f448ff0e92ae5c2393bb44507e`. Basename `arena_init_trial.c` and function `void arm7_arena_init_trial(void)` remain fixed.

The model declares one external nonvolatile unsigned-word guard, `hyp_arena_initialized`, with no storage definition, alias, or asserted lifetime. It returns for a nonzero guard, writes 1 otherwise, and explicitly invokes upper-store/upper-getter then lower-store/lower-getter pairs for IDs 1, 7, 8. Getters return `void *`; setters receive two unsigned words. Those declarations are the accepted trial interfaces, with pointer-to-word transfer under the ARM32 compiler. They remain hypotheses about the original ABI and ownership.

The single candidate uses current build 82 with `-proc arm7tdmi -nothumb -interworking -nostdinc -O4,s -c`. The four accepted callee sources, basenames, functions, flags, and expected objects remain exact [four-object trial](arm7-arena-cluster-trial.md) copies. Upper store alone retains its accepted build 114/O4p recipe. All exact sources, recipe argv, tools and DLL pins are owned or recorded by this capsule; no compiler or source variation was attempted.

| Actual input role | Object SHA256 |
| --- | --- |
| Lower store | `b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7` |
| Upper store | `03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf` |
| Lower getter | `9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b` |
| Upper getter | `b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1` |
| Initializer | `47a79e6c15b3191c2a1d06f8124596ee94e2e42a6defdb4bf270b5820c2b5112` |

The actual initializer object is ELF32 little-endian ARM, 1240 bytes, flags `0x02100000`. Its global function and `.text` cover 164 bytes, with ARM mapping symbol `$a` at 0 and data symbol `$d` at 160. All original instruction bytes outside relocation slots agree before linking. Its unlinked instruction SHA256 is `3ad85374b67a7b1023cdf750f5b672fee3718f1b1f7a444097c5636ee60a402d`; text SHA256 is `35ff79603ccc5afde50cdd183cf0006e3117337853b201488dcdfe8caa2bab22`.

Actual `.rela.text` contains twelve `R_ARM_PC24` records, type 1 and addend -8, at offsets 32,44,52,64,72,84,92,104,112,124,132,144. Their symbol order is upper-getter, upper-store, lower-getter, lower-store, repeated three times. Call opcode words are `0xeb000000` before linking. The separate zero guard pool at 160 has one `R_ARM_ABS32` record, type 2 and addend 0. The object also contains 12-byte `.exceptix` with its own actual ABS32 reference to `arm7_arena_init_trial`. Object evidence retains this section; the native script explicitly discards it and checks that no metadata or relocation section survives in allocated output. No object bytes or ELF flags are edited.

## Fixed native proof and controls

The agreed design extends the accepted producer with one fifth role and immutable guard binding. There are two implementation files: [reproduce.py](arm7-arena-init-proof/reproduce.py) owns compilation and replay; [init.py](arm7-arena-init-proof/init.py) owns the finite original, object, and native checks. The fixed [contract](arm7-arena-init-proof/contract.json) contains five roles and five bindings. The [design record](arm7-arena-init-proof/design.md) explains this finite extension.

| Autoload0 component | Bytes |
| --- | ---: |
| Original opaque prefix | 20228 |
| Four direct accepted compiler objects at `cf04..d004` | 256 |
| Original opaque bridge at `d004..d02c` | 40 |
| Direct initializer compiler object at `d02c..d0d0` | 164 |
| Original opaque suffix | 45432 |

All coordinates derive from the owned original mapping. LLD directly receives the five actual compiler objects and resolves the twelve caller relocations to their real callee definitions. The finite checker reads each actual input hash, map row, VMA, physical load address, function symbol, boundaries, linked instruction and pool bytes, and twelve final BL words. Explanatory relocation arithmetic never writes a link input. The five independently read absolute hypothesis bindings are SUBPRIV=`0x027f9c08`, shared WRAM=`0x0380bc90`, IRQ=`0x400`, SYS=`0x400`, guard=`0x03808430`.

Own positive native ELF SHA256 is `ce8c2d2566962edb4df29af9bccae294d135656ddca4b46fab7d85163dbc5267` for each identity. Each reconstructed 165552-byte image has original SHA256 `0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`. All six actual PT_LOADs and allocated sections, entry, flags, native section/file-offset correspondence, initialized payloads, bridge, other noncandidate bytes, and 21424 BSS match the checked finite layout. Native ELF metadata is distinct from original loader metadata; the proof does not assume original-layout file offsets equal native ELF offsets.

The actual controls pass in each identity:

- All five individual object omissions return LLD 1. Saved commands and selected input pins identify each omitted role.
- Swapping the equal-sized store selectors returns LLD 0. Actual lower-store function/map placement moves to `cf18`, and upper-store moves to `cf04`. Six actual initializer store BL destinations change accordingly. Each group's linked target sequence becomes `cf84,cf04,cf2c,cf18`. Strict readback rejects the reversed actual role placement. It stops before full swap-image comparison; no full swap-image claim is made here.
- Guard binding `0x03808434` returns LLD 0. All five supplied bindings are checked, and strict original-image comparison rejects the single changed image byte 21116.
- Initializer placement+4 returns LLD 1 through actual section and boundary checks.
- A negative-only copy with first PT_LOAD file offset 244 changed to 248 rejects the section/segment inconsistency.

## Replay and evidence closure

Run from the repository root with a new private directory:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-arena-init-proof/reproduce.py NEW_PRIVATE_DIRECTORY
```

The command prints and returns `NEW_PRIVATE_DIRECTORY/trial-proof.json`. Its keys are `candidates`, `originals`, and `programs`; each program has `positive`, `wrong_guard`, `wrong_callee`, `omitted` with five roles, `wrong_placement`, and `malformed_load`. Failed runs create no completed receipt. The committed [receipt](arm7-arena-init-proof/trial-proof.json) records own actual outputs.

Run the actual-artifact tests from the repository root:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-arena-init-proof -p 'test_*.py' -v
```

The tests use fresh private output and require no hidden fixture or earlier object. Original-reader and native behavior were each tested red before implementation. All five tests pass. [Evidence pins](arm7-arena-init-proof/evidence-pins.json) cover public source, layout, metadata, helpers, readbacks, logs, and this note; the committed Git-owned gate checks the published pins. External read-only inputs are only the original ROM and pinned compiler, runner, LLVM, clang, LLD, and DLLs. No ROM, extracted image, object, native ELF, private earlier checkout, or cache is a public replay dependency.

The remaining barrier is original source ownership and ABI evidence, plus runtime guard state, call-return and indirect-transfer feasibility. This exact finite compiler/link correspondence supplies none of those facts and establishes no original SDK version or function extent.
