import hashlib,json,subprocess,tarfile,tomllib
from pathlib import Path
S=Path('/private/tmp/jus-arm7-reachable-root-dsd')
O=Path('/private/tmp/jus-arm7-reachable-root-proof')
h=lambda b:hashlib.sha256(b).hexdigest()
git=lambda *a:subprocess.check_output(['git',*a],cwd=S).decode().strip()
local={}
for name in subprocess.check_output(['git','ls-files','-z'],cwd=S).decode().split('\0'):
 if not name:continue
 p=S/name; assert p.is_file() and not p.is_symlink(),p
 data=p.read_bytes(); assert data==subprocess.check_output(['git','show','HEAD:'+name],cwd=S),name
 local[name]=h(data)
subprocess.run(['python3','dependency-patches/unarm-1.9.2/prepare.py','--check-only'],cwd=S,check=True,stdout=subprocess.DEVNULL)
assert not subprocess.check_output(['git','ls-files','--others','--exclude-standard','-z'],cwd=S), 'untracked local source'
ignored=set(filter(None,subprocess.check_output(['git','ls-files','--others','--ignored','--exclude-standard','-z'],cwd=S).decode().split('\0')))
assert all(name.startswith('local-deps/unarm/') for name in ignored),ignored
m=json.loads((O/'metadata.json').read_text()); nodes={n['id']:n for n in m['resolve']['nodes']}
start=next(p['id'] for p in m['packages'] if p['manifest_path']==str(S/'lib/Cargo.toml'))
closure=set(); todo=[start]
while todo:
 n=todo.pop()
 if n in closure:continue
 closure.add(n); todo+=nodes[n]['dependencies']
lock=tomllib.loads((S/'Cargo.lock').read_text()); pins={(p['name'],p['version']):p.get('checksum') for p in lock['package']}; rows=[]
for pkg in m['packages']:
 if pkg['id'] not in closure or not pkg['source']:continue
 assert pkg['source'].startswith('registry+'),pkg['source']
 root=Path(pkg['manifest_path']).parent
 for x in [root,*root.parents]:assert not x.is_symlink(),x
 tar=root.parents[2]/'cache'/root.parent.name/(root.name+'.crate')
 assert h(tar.read_bytes())==pins[pkg['name'],pkg['version']],tar
 expected={}
 with tarfile.open(tar,'r:gz') as f:
  for member in f:
   if member.isdir():continue
   assert member.isfile(),member.name
   parts=Path(member.name).parts; assert parts[0]==root.name and '..' not in parts
   name='/'.join(parts[1:]); assert name and name not in expected
   expected[name]=h(f.extractfile(member).read())
 actual=set()
 for p in root.rglob('*'):
  assert not p.is_symlink(),p
  if p.is_file():actual.add(str(p.relative_to(root)))
 assert actual-set(expected)<={'.cargo-ok','.cargo-checksum.json'},root
 for name,digest in expected.items():assert h((root/name).read_bytes())==digest,name
 rows.append({'name':pkg['name'],'version':pkg['version'],'crate_sha256':pins[pkg['name'],pkg['version']],'files':len(expected),'source_inventory_sha256':h(json.dumps(expected,sort_keys=True,separators=(',',':')).encode())})

report={'source_commit':git('rev-parse','HEAD'),'source_tree':git('rev-parse','HEAD^{tree}'),'local_source_files':local,'local_source_count':len(local),'prepared_unarm_source_count':47,'registry_packages':rows,'registry_actual_files':sum(x['files'] for x in rows)}
(O/'source-audit.json').write_text(json.dumps(report,indent=2)+'\n')
print({'source_commit':report['source_commit'],'local_files':len(local),'unarm_files':47,'registry_packages':len(rows),'registry_files':report['registry_actual_files']})
