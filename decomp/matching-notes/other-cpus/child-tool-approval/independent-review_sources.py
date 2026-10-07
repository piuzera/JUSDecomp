import hashlib,json,subprocess,tarfile,tomllib
from pathlib import Path
S=Path('/private/tmp/jus-child-codec-review-source'); O=Path('/private/tmp/jus-child-codec-review-proof'); R=Path('/private/tmp/jus-child-codec-approval')
h=lambda b:hashlib.sha256(b).hexdigest()
git=lambda *a:subprocess.check_output(['git',*a],cwd=S).decode().strip()
assert git('rev-parse','HEAD')=='9f6c1b11c8f4b384ffcdc75b2c6d863cd371dcfe'
assert git('rev-parse','HEAD^{tree}')=='1d0ccf3e5ccc8f6530fb6181dd526b698eeb99bc'
local={}
for name in subprocess.check_output(['git','ls-files','-z'],cwd=S).decode().split('\0'):
 if not name:continue
 p=S/name; assert p.is_file() and not p.is_symlink(); data=p.read_bytes()
 assert data==subprocess.check_output(['git','show','HEAD:'+name],cwd=S),name
 local[name]=h(data)
extra='lib/examples/t10_compression_probe.rs'
local[extra]=h((S/extra).read_bytes()); assert local[extra]=='9baf8ab864540b9eaca6b7916f57074459ce89b5b95bb98d62bfa2c3180783c6'
for args in [('ls-files','--others','--exclude-standard','-z'),('ls-files','--others','--ignored','--exclude-standard','-z')]:
 unknown=set(filter(None,subprocess.check_output(['git',*args],cwd=S).decode().split('\0')))
 assert unknown<={extra},unknown
assert local['Cargo.lock']=='836cf74bb237bf4ca61295c586af6a09564fb8e2620405ff8b863639c97907e2'
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
rootaudit=json.loads((R/'decomp/matching-notes/other-cpus/child-tool-approval/source-audit.json').read_text())
assert local==rootaudit['local_source_files']
assert len(rows)==116 and sum(x['files'] for x in rows)==6352
assert {x['name']:(x['version'],x['source_inventory_sha256']) for x in rows}=={x['name']:(x['version'],x['source_inventory_sha256']) for x in rootaudit['registry_packages']}
for role in ['analyzer','codec']:
 a=json.loads((R/f'decomp/matching-notes/other-cpus/child-tool-approval/{role}-approval.json').read_text())
 for name,digest in a['source_artifacts'].items():assert h((R/name).read_bytes())==digest,name
assert h((R/'decomp/matching-notes/other-cpus/child-tool-approval/LICENSE.ds-rom').read_bytes())=='6868b9ef46509224c823cc2f80d2d0bbd37086f89bb3ce2a570c0b04f0bb4a7b'
report={'result':'source closure and manifest pins verified','local_files':len(local),'registry_packages':len(rows),'registry_actual_files':sum(x['files'] for x in rows),'local_source_files':local,'registry_packages_detail':rows}
(O/'source-review.json').write_text(json.dumps(report,indent=2)+'\n'); print({k:v for k,v in report.items() if k not in ['local_source_files','registry_packages_detail']})
