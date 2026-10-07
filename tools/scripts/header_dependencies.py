#!/usr/bin/env python3
"""Strict dependency capture for pinned MW Windows compilers under Wibo.

Accept one make rule, Windows separators, Z: host paths, CRLF continuations and
backslash-escaped spaces. Other drives, UNC paths, make variables/comments and
multiple rules are unsupported. Include order is manifest order; consumed order
must agree between -M preflight and -MD compilation. This gate awards no credit.
"""
import hashlib
import json
import os
import re
import subprocess
from pathlib import Path


def sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def _digest(value):
    return hashlib.sha256(json.dumps(value,sort_keys=True,separators=(',',':')).encode()).hexdigest()


def _tokens(text):
    tokens, token = [], []
    index = 0
    while index < len(text):
        char = text[index]
        if char == '\\' and index + 1 < len(text) and text[index + 1] in ' \t':
            token.append(text[index + 1]); index += 2; continue
        if char.isspace():
            if token: tokens.append(''.join(token));token=[]
        else:
            if char in '$#\x00"\'':
                raise ValueError('unsupported/ambiguous make dependency token')
            token.append(char)
        index += 1
    if token: tokens.append(''.join(token))
    return tokens


def _path(token, root):
    token = token.replace('\\','/')
    if token.startswith('//'):
        raise ValueError('UNC dependency paths are unsupported')
    if re.match(r'^[A-Za-z]:',token):
        if not token.startswith('Z:/'):
            raise ValueError('only explicit Wibo Z: host drive is supported')
        token = token[2:]
    if ':' in token:
        raise ValueError('ambiguous dependency drive/path')
    path = Path(token)
    return (path if path.is_absolute() else root / path).resolve()


def parse_dependencies(text: str, root: Path, target: Path, source: Path) -> list[Path]:
    """Parse exactly one rule and return ordered canonical source/header paths."""
    root,target,source = Path(root).resolve(),Path(target).resolve(),Path(source).resolve()
    text = text.replace('\r\n','\n')
    if '\r' in text:
        raise ValueError('malformed dependency line endings')
    text = re.sub(r'\\\n[ \t]*',' ',text).strip()
    if not text or '\n' in text:
        raise ValueError('dependency output requires exactly one rule')
    separators = list(re.finditer(r':(?=\s)',text))
    if len(separators) != 1:
        raise ValueError('missing/ambiguous dependency rule delimiter')
    split = separators[0].start()
    targets, files = _tokens(text[:split]), _tokens(text[split+1:])
    if len(targets) != 1 or _path(targets[0],root) != target:
        raise ValueError('dependency target differs from fresh object')
    paths = [_path(token,root) for token in files]
    if not paths or paths[0] != source or len(paths) != len(set(paths)):
        raise ValueError('missing source or duplicate/ambiguous dependencies')
    if any(not path.is_relative_to(root) for path in paths):
        raise ValueError('dependency escapes declared project root')
    return paths


def _declared_path(root, name, *, directory=False):
    if not isinstance(name,str) or not name or any(c in name for c in '\\:$#\n\r\t\x00'):
        raise ValueError('unsupported declared dependency path')
    relative = Path(name)
    if relative.is_absolute() or '..' in relative.parts or str(relative) != name:
        raise ValueError('dependency path must be canonical relative to project root')
    path = root / relative
    if any(part.is_symlink() for part in [path,*path.parents] if part != root and part.is_relative_to(root)):
        raise ValueError('symlink dependency/include paths are unsupported')
    if not path.resolve().is_relative_to(root) or not (path.is_dir() if directory else path.is_file()):
        raise ValueError('declared dependency/include path missing or outside root')
    return path.resolve()


def validate_context(unit: dict):
    """Reject command overrides; header locations belong to structured fields."""
    flags = unit.get('flags')
    if not isinstance(flags,list) or not all(isinstance(flag,str) and flag for flag in flags) or '-nostdinc' not in flags:
        raise ValueError('dependency capture must disable ambient include paths with -nostdinc')
    for flag in flags:
        if flag == '-I-':
            continue
        if flag.startswith(('@','-I','-ir','-isystem','-prefix','-include','-stdinc','-trigraphs','-gccdep','-nogccdep','-M','-make','-o','-precompile','-env')) or flag in ('-i','-c','-E','-S','-codegen','-nocodegen'):
            raise ValueError('header/dependency/output command override must be declared structurally')
    if not isinstance(unit.get('headers'),dict) or not isinstance(unit.get('include_paths'),list) or not isinstance(unit.get('forced_headers',[]),list):
        raise ValueError('declared headers/include/forced context missing or malformed')
    if len(unit['include_paths']) != len(set(unit['include_paths'])) or len(unit.get('forced_headers',[])) != len(set(unit.get('forced_headers',[]))):
        raise ValueError('duplicate include/forced header context is ambiguous')


def capture_and_compile(unit: dict, root: Path, source: Path, destination: Path,
                        compiler: Path, runner: Path, environment: dict) -> dict:
    """Run fresh -M then -MD, recording exact dependencies and immutable inputs.

    No fallback and no accepted-source accounting. Failure retains stages already
    run. Caller still validates compiler/ABI/DLL pins and raw object equivalence.
    """
    result = {'schema_version':1,'status':'failed','source_credit':0,'stages':[],'policy':'mw_make_preflight_and_compile'}
    try:
        root,source,destination = Path(root).resolve(),Path(source).resolve(),Path(destination).absolute()
        compiler,runner = Path(compiler).absolute(),Path(runner).absolute()
        validate_context(unit)
        if any(key.upper().startswith(('MWC','MWARM')) for key in environment):
            raise ValueError('ambient MW compiler environment is forbidden')
        if not source.is_relative_to(root) or not source.is_file():
            raise ValueError('source is outside declared project root or missing')
        source = _declared_path(root,str(source.relative_to(root)))
        depfile = destination.with_suffix('.d')
        if destination.exists() or destination.is_symlink() or depfile.exists() or depfile.is_symlink():
            raise ValueError('object/dependency output exists; require fresh files')
        includes = [_declared_path(root,name,directory=True) for name in unit['include_paths']]
        headers = {name:_declared_path(root,name) for name in unit['headers']}
        forced = [_declared_path(root,name) for name in unit.get('forced_headers',[])]
        if any(path not in headers.values() for path in forced):
            raise ValueError('forced header is not declared with exact hash')
        if any(path == source for path in headers.values()):
            raise ValueError('source cannot be declared as a header')
        allowed_roots = [source.parent,*includes,*[path.parent for path in forced]]
        if any(not any(path.is_relative_to(directory) for directory in allowed_roots) for path in headers.values()):
            raise ValueError('header is outside declared source/include/forced roots')
        for name,path in headers.items():
            if b'\x00' in path.read_bytes():
                raise ValueError('binary/precompiled header dependencies are outside the text-header scope')
            expected = unit['headers'][name]
            if not isinstance(expected,str) or not re.fullmatch('[0-9a-f]{64}',expected) or sha256(path) != expected:
                raise ValueError('declared header hash mismatch before preflight')
        bound = [source,*headers.values(),compiler,runner]
        before = {str(path):sha256(path) for path in bound}
        context = {'cpu':unit['cpu'],'flags':list(unit['flags']),'include_paths':list(unit['include_paths']),
                   'forced_headers':list(unit.get('forced_headers',[])),'headers':dict(unit['headers'])}
        context_hash,environment_hash = _digest(context),_digest(environment)
        result.update(include_paths=context['include_paths'],forced_headers=context['forced_headers'],flags=context['flags'],
                      context_sha256=context_hash,environment_sha256=environment_hash,
                      before_sha256={str(path.relative_to(root)):before[str(path)] for path in [source,*headers.values()]},
                      tools_sha256={'compiler':before[str(compiler)],'runner':before[str(runner)]})
        command = [str(runner),str(compiler),'-c','-proc',unit['cpu'],*context['flags']]
        for directory in includes: command += ['-i',str(directory)]
        for path in forced: command += ['-include','Z:'+path.as_posix()]
        command += ['-o',str(destination),str(source)]
        destination.parent.mkdir(parents=True,exist_ok=True)

        def immutable():
            if any(sha256(Path(path)) != digest for path,digest in before.items()):
                raise ValueError('source/header/tool changed during dependency capture or compilation')
            current = {'cpu':unit['cpu'],'flags':unit['flags'],'include_paths':unit['include_paths'],
                       'forced_headers':unit.get('forced_headers',[]),'headers':unit['headers']}
            if _digest(current) != context_hash or _digest(environment) != environment_hash:
                raise ValueError('compiler context/environment changed during build')
            for name in headers:_declared_path(root,name)
            for name in context['include_paths']:_declared_path(root,name,directory=True)

        def run(name,mode):
            argv = [*command[:2],mode,'-gccdepends',*command[2:]]
            completed = subprocess.run(argv,cwd=root,env=environment,capture_output=True,text=True)
            result['stages'].append({'name':name,'command':argv,'returncode':completed.returncode,
                                     'stdout':completed.stdout,'stderr':completed.stderr})
            immutable()
            if completed.returncode:
                raise ValueError(f'compiler {name} failed')
            return completed

        preflight = run('dependency_preflight','-M')
        if destination.exists() or depfile.exists():
            raise ValueError('preflight unexpectedly generated object/dependency files')
        consumed = parse_dependencies(preflight.stdout,root,destination,source)
        if set(consumed[1:]) != set(headers.values()):
            raise ValueError('compiler consumed undeclared headers or did not consume every declared header')
        result['ordered_dependencies'] = [str(path.relative_to(root)) for path in consumed]
        result['preflight_record_sha256'] = hashlib.sha256(preflight.stdout.encode()).hexdigest()
        completed = run('compilation','-MD')
        if not destination.is_file() or destination.is_symlink() or not depfile.is_file() or depfile.is_symlink():
            raise ValueError('compiler did not produce fresh object and dependency files')
        text = depfile.read_text()
        if parse_dependencies(text,root,destination,source) != consumed:
            raise ValueError('compiled dependencies differ from ordered preflight dependencies')
        immutable()
        result.update(status='passed',command=result['stages'][1]['command'],stdout=completed.stdout,stderr=completed.stderr,
                      exit_status=completed.returncode,compiled={'path':str(destination),'sha256':sha256(destination)},
                      dependency_file={'path':str(depfile),'sha256':sha256(depfile)},
                      compile_record_sha256=hashlib.sha256(text.encode()).hexdigest(),
                      after_sha256={str(path.relative_to(root)):sha256(path) for path in [source,*headers.values()]},
                      input_hashes=before)
    except (ValueError,OSError,KeyError,TypeError) as exc:
        result['failure'] = str(exc)
    return result
