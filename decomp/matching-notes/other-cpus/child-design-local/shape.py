"""Design sketch only. Not a production module and not importable authority."""
from dataclasses import dataclass
from pathlib import Path
from typing import Literal, Mapping


@dataclass(frozen=True)
class _FileEvidence:
    path: Path
    sha256: str
    size: int


@dataclass(frozen=True)
class _Program:
    parent_sha256: str
    path: Literal['ChildRom/JSS2Child.srl']
    file_id: Literal[79]
    program_sha256: str
    start: int
    end: int
    cpu: Literal['arm9']
    isa: Literal['armv5te']
    processor: Literal['arm946e']


@dataclass(frozen=True)
class ChildPayload:
    """Returned only after recheck; buffer equals the captured stored ARM9 slice."""
    identity: _Program
    rom_offset: int
    program_start: int
    program_end: int
    data: bytes
    image_path: Path  # Retained whole rebuilt child, not a loose payload file.
    image_sha256: str  # Whole source file digest, independently captured.
    image_slice_offset: int
    sha256: str  # Slice digest.
    elf_path: Path
    elf_sha256: str
    source_bytes: Literal[0]


@dataclass(frozen=True)
class _Capture:
    """All nested data immutable; no saved JSON deserializer produces this."""
    build_id: str
    started_ns: int
    output: Path
    program: _Program
    inputs: tuple[_FileEvidence, ...]
    artifacts: tuple[_FileEvidence, ...]
    report_json: str
    # Includes command evidence, checked row, validated tool roles, and proof
    # results encoded in the captured report. Parsed copies are never authority.
    rebuilt_child: _FileEvidence
    stored_arm9_sha256: str
    stored_arm9_bytes: int


class ChildOperation:
    """Opaque live result; only build_child's successful execution issues one.

    No public constructor, load/from_report, public mutation, or pickle support.
    Production implementation uses a private factory seal checked by the packer,
    frozen private capture and slots, following existing ARM7 ownership. Python
    privacy is a misuse guard; arbitrary hostile code in-process is out of scope.
    The packer requires the concrete operation, not duck-typed recheck objects.
    """
    __slots__ = ('__capture',)

    @property
    def report(self) -> dict:
        """Fresh detached audit copy. Mutating it cannot alter capture."""
        raise NotImplementedError

    @property
    def input_hashes(self) -> dict[str, str]:
        """Fresh detached copy for the parent freshness snapshot union."""
        raise NotImplementedError

    def recheck(self, record: Mapping, build_dir: Path, original: bytes,
                build_id: str, started_ns: int) -> ChildPayload:
        """Compare report first, then recheck closure and return validated bytes.

        Calls the same private proof checker used at issuance. Recompute actual
        proof from captured paths; compare to capture and independent pins.
        Never accept caller-provided native paths, expected hashes or bypasses.
        """
        raise NotImplementedError


def build_child(*, original: Path, output: Path, root: Path,
                build_id: str, started_ns: int,
                native_tools: Mapping, analyzer: Path, analyzer_approval: Path,
                encoder: Path, codec_approval: Path) -> ChildOperation:
    """Fresh strict analysis through exact child encoding, reference-only.

    native_tools is the existing verifier's tool record; parse and validate
    clang/lld roles internally. It cannot replace the separate analyzer role.
    Approval paths are untrusted inputs until validated against reviewed pins.
    Build and capture expected closure before execution; append produced files
    only when independently checked, then freeze. Every failure raises without
    issuing an operation. Failure output may remain for diagnostics; retries
    require a new build/output directory. No resume from partial artifacts.
    """
    raise NotImplementedError


def _check_child_proof(capture: _Capture, original: bytes) -> ChildPayload:
    """Private invariant owner, used both before issuance and on every recheck.

    Check exact file inventory and live digests before parsers open artifacts.
    Reuse verify_link_record with source_build=None; add map binding.
    Verify expanded images, canonical ELF section/BSS geometry and originals'
    35092 relocation slots, and retain codec status unchanged.
    Return only the checked compressed slice, never a whole-child write.
    """
    raise NotImplementedError


# Existing rom_roundtrip functions gain only child_operation=None:
# roundtrip_rom(..., arm7_operation=None, child_operation=None)
# _verify_build(..., arm7_operation=None, child_operation=None)
# rebuild_rom(..., arm7_operation=None, child_operation=None)
# The audit child record comes from the existing verified_build report.
# rebuild_rom needs that record passed alongside its existing ARM7 record.
# No independent public recheck wrapper or generic producer registry is added.
