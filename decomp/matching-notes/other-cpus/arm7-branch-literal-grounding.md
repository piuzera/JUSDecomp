# ARM7 branch and literal grounding

The literal used by the [callee prefix](arm7-callee-prefix-grounding.md) contains
`0x03808430` in both exact program identities. That address is in autoload0 BSS,
so its runtime word has no original stored ROM bytes. The two newly selected
ARM spans decode atomically and join both NE outcomes at `0x037fd040`. Each
program now has 21 candidate nodes, 27 edges, and seven frontiers.

The condition-failed selection exposes three direct call targets. The
condition-passed selection adjusts `sp` and loads `lr`, then stops at its explicit
decode limit. Neither result proves execution, branch feasibility, a return,
function extent, original relocation, or source ownership. The canonical source
count remains 304, ARM7 source credit remains zero, and T10 stays open.

## Exact inputs and only added selections

The original ROM remains `/Users/djdjo/Documents/mine/rom/jus.nds`, SHA256
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.
The [checked layout](arm7-checked-layouts.json) remains SHA256
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
The frozen reachable producer remains DSD revision
`71e766e562c78d4b0ec404b3b4edbe242a8d1b0f`, executable
`/private/tmp/jus-arm7-reachable-root-cache/target/release/examples/arm7_reachable_probe`,
SHA256 `28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff`.
The source, cache, executable, and original ROM were read only.

The parent program digest is the original-ROM digest. The separate child uses
the same parent-ROM digest, `nitro_fs` path `ChildRom/JSS2Child.srl`, and program
SHA256 `1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986`.
Independent FNT traversal resolves that child to FAT file 79 at original-ROM
extent `[0x23b800,0x4464c8)`. Equal image and selected-byte digests do not merge
the identities.

The request preserves all three previous selections, the root at `0x037f8468`,
and the assumption `Grounded explicit ARM root; execution and function extent
remain unknown`. It appends only these selections, separately per exact program:

| Index | Explicit ARM extent | Bytes | Incoming guard |
| ---: | --- | ---: | --- |
| 3 | `[0x037fd044,0x037fd064)` | 32 | NE `condition_failed` from `0x037fd040` |
| 4 | `[0x037fd0c0,0x037fd0c8)` | 8 | NE `condition_passed` from `0x037fd040` |

The independently read literal `[0x037fd0cc,0x037fd0d0)` is initialized data used
by the earlier load. It is not a graph decode selection. No other ARM or Thumb
span, function extent, or recursive decode was requested.

## The literal points into BSS

Independent reads of each original NDS header, ARM7 image, module parameters,
and loader table agree with the pinned layout. Both stored ARM7 images have
SHA256 `0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`.
Autoload0 starts at stored image offset `0x1b0` and has these runtime bounds:

| Ownership | Runtime extent |
| --- | --- |
| Initialized autoload0 | `[0x037f8000,0x03808248)` |
| Autoload0 BSS | `[0x03808248,0x0380bc90)` |

The instruction at `0x037fd034` encodes `ldr r1, [pc, #0x90]`. ARM PC-relative
arithmetic selects `0x037fd034 + 8 + 0x90 = 0x037fd0cc`. The checked original
autoload mapping places that four-byte read at stored image offset `0x527c`.
Its little-endian word is `0x03808430`, and its four-byte SHA256 is
`57b0891abc6d6b61a7345b6a995c20fdeb937a1f7ca61ffa06b012074e0e73a4`.

The entire pointed word lies `0x1e8` bytes into autoload0 BSS in the same exact
program. It is neither initialized ROM-backed bytes nor unmapped memory. The
reader classifies it without converting its runtime offset to a stored image
offset, and never reads its contents as ROM. BSS ownership does not prove its
value at this candidate root. Loader execution, zeroing, and later writes remain
runtime-state questions.

The prefix encodes a load through `r1`, comparison against zero, and BNE. Its
condition-failed continuation contains `mov r0, #1` followed by a store through
`r1`. These instruction encodings describe a possible read, comparison, and
write of the BSS word. They do not establish which operations execute or which
NE outcome is feasible. The reachable probe still performs no literal or
register-value propagation; the literal evidence is a separate original-ROM read.

## Original words and LLVM evidence

The 32-byte selection starts at stored image offset `0x51f4`, with SHA256
`887a11d8e3585472da9e7b810a454d3cf15fd88c3b165c337bb221e91ecad928`.
The eight-byte selection starts at `0x5270`, with SHA256
`89ccd393f43dde6fb4ef3fc4d2c026a16034d4541dc798f74de12bcc0a90a19f`.
Each digest matches independently read parent and child bytes. LLVM ARMv4T
disassembly agrees with all ten producer instructions. All have ARM condition AL,
represented by `condition: null`.

| Address | Original little-endian word | Instruction |
| --- | --- | --- |
| `0x037fd044` | `0xe3a00001` | `mov r0, #1` |
| `0x037fd048` | `0xe5810000` | `str r0, [r1]` |
| `0x037fd04c` | `0xebffffcc` | `bl 0x037fcf84` |
| `0x037fd050` | `0xe1a01000` | `mov r1, r0` |
| `0x037fd054` | `0xe3a00001` | `mov r0, #1` |
| `0x037fd058` | `0xebffffae` | `bl 0x037fcf18` |
| `0x037fd05c` | `0xe3a00001` | `mov r0, #1` |
| `0x037fd060` | `0xebffffb1` | `bl 0x037fcf2c` |
| `0x037fd0c0` | `0xe28dd004` | `add sp, sp, #4` |
| `0x037fd0c4` | `0xe8bd4000` | `ldmia sp!, {lr}` |

Independent sign extension of each ARM BL field gives the same targets as the
probe. LLVM displays the encoded displacement before the ARM PC bias; the
producer's text includes the eight-byte bias.

| Call source | Signed displacement | Source plus PC bias and displacement | Return continuation |
| --- | ---: | --- | --- |
| `0x037fd04c` | `-0xd0` | `0x037fd04c + 8 - 0xd0 = 0x037fcf84` | `0x037fd050` |
| `0x037fd058` | `-0x148` | `0x037fd058 + 8 - 0x148 = 0x037fcf18` | `0x037fd05c` |
| `0x037fd060` | `-0x13c` | `0x037fd060 + 8 - 0x13c = 0x037fcf2c` | `0x037fd064` |

## Graph guards and seven frontiers

The earlier BNE edge 12 keeps source condition `ne` and guard
`condition_passed`, resolving to selected node 19 at `0x037fd0c0`. Edge 13 keeps
`condition_failed`, resolving to selected node 11 at `0x037fd044`. Both observations
still call their destinations `outside_selection`, because those boundaries
refer to the original 24-byte span, while the graph joins separately supplied
instruction starts.

The new selections contribute thirteen edges. Ordinary instructions retain
`always` fallthrough. Each BL records an `always` call and a separate
`call_returned` continuation. The continuations at `0x037fd050` and `0x037fd05c`
resolve to selected nodes; they preserve the return assumptions despite the
corresponding callees remaining outside the selections. All numeric targets
map to initialized autoload0 bytes of the same exact program and ARM mode.

Each graph has five observations, 21 nodes, 27 edges, 20 selected edges, seven
frontier edges, and zero mode conflicts. The root visits all 21 nodes and examines
27 edges under the retained guards. The complete node, edge, and predecessor
record is in [graph-summary.json](arm7-branch-literal-proof/graph-summary.json).
There are zero unknown-target edges in these selected graphs. Startup's unknown
`BX` remains outside this request and unresolved.

Every frontier retains reason `outside_selection`:

| Edge | Source | Transfer guard | Target | Additional root-path assumption |
| ---: | --- | --- | --- | --- |
| 2 | `0x037f846c` | `call_returned` | `0x037f8470` | Earlier root caller returns |
| 6 | `0x037fced4` | `call_returned` | `0x037fced8` | Earlier callee returns |
| 26 | `0x037fd0c4` | `always` | `0x037fd0c8` | NE passes |
| 16 | `0x037fd04c` | `always` | `0x037fcf84` | NE fails |
| 20 | `0x037fd058` | `always` | `0x037fcf18` | NE fails; call at `0x037fd04c` returns |
| 23 | `0x037fd060` | `always` | `0x037fcf2c` | NE fails; calls at `0x037fd04c` and `0x037fd058` return |
| 24 | `0x037fd060` | `call_returned` | `0x037fd064` | NE fails; all three new calls return |

The common witness from the root to BNE follows edges
`0, 1, 3, 4, 5, 7, 8, 9, 10, 11`. The NE-passed frontier appends
`12, 25, 26`. The first NE-failed call frontier appends `13, 14, 15, 16`.
Later NE-failed witnesses retain the appropriate `call_returned` edges 17 and
21. Exact witness sequences for all seven frontiers are retained in the summary.
Neither branch destination, call target, nor decode limit supplies a function
end or proves that a call returns.

## Reproduction and scope

The [request](arm7-branch-literal-proof/requests.json) SHA256 is
`c5e7b7b0911462ddd213dbf60ef25986f64896bb36288e3788743d2bcb1aad63`.
[commands.json](arm7-branch-literal-proof/commands.json) retains the exact
successful six-argument frozen-probe invocation. It returned 0 with empty stderr,
reported `inputs_unchanged: true`, and retained `source_bytes: 0` and all unknown
execution, function-extent, and relocation claims. Its complete private report
is `/private/tmp/jus-arm7-branch-worker-proof/report.json`, 370,581 bytes, SHA256
`994cadc35863bb4e0f7306a692c4a2a8792cf3064ed69a7b184d23e8de4c8e90`.

[summarize_report.py](arm7-branch-literal-proof/summarize_report.py) validates
the unchanged prior selections and root, exact identities, graph counts, NE
resolutions, every edge, and every witness before generating the compact summary.
[read_original.py](arm7-branch-literal-proof/read_original.py) independently
reads each original program, loader mapping, selected words, literal, and raw BL
fields. Its initialized-byte accessor rejects BSS reads. It sends only the two
explicit instruction spans through stdin to
`/opt/homebrew/opt/llvm/bin/llvm-mc --disassemble --triple=armv4t-none-eabi`.
[original-read.json](arm7-branch-literal-proof/original-read.json),
[llvm-condition-failed.txt](arm7-branch-literal-proof/llvm-condition-failed.txt),
and [llvm-condition-passed.txt](arm7-branch-literal-proof/llvm-condition-passed.txt)
retain the readbacks. Scoped Git attributes preserve the exact LLVM output LF
bytes. No ROM, extracted binary, source/cache change, or build output is committed.
Both scripts accept a proof-directory argument so reproduction can write results
beside the private probe report without changing the committed capsule.

## Concrete remaining source, ABI, and state barriers

The three new call targets `0x037fcf84`, `0x037fcf18`, and `0x037fcf2c` require
separate explicit finite ARM selections before this graph can inspect them.
The instruction after the first call copies `r0` to `r1`, so the later selected
path depends on that callee's returned register state. The graph has no callee
ABI, return-value, preserved-register, stack, or source-symbol evidence. BL
targets alone supply no function count or function extent.

The NE-passed selection loads `lr` rather than `pc`; no return or indirect
transfer is present in its two selected instructions. Any operation beginning
at `0x037fd0c8` needs another bounded selection. If it writes `pc` or exchanges
mode through a register, its destination will require separate register/stack
evidence and a stated mode policy. This record reads no instruction there.

The BSS word at `0x03808430` is the concrete branch-feasibility barrier. Its
runtime value depends on initialization and memory history, which a stored-ROM
read cannot recover. Original source mapping and runtime ABI interpretation
remain separate work. The selected graph proves none of these facts and does
not complete the ARM7 binary baseline or T10.
