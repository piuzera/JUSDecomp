import hashlib,json,subprocess,sys,tarfile,tomllib
from pathlib import Path
S=Path(sys.argv[1]); O=Path(sys.argv[2]); metadata=Path(sys.argv[3]); expected_commit=sys.argv[4]
h=lambda b:hashlib.sha256(b).hexdigest()
def git(*a):return subprocess.check_output(['git',*a],cwd=S).decode().strip()
assert git('rev-parse','HEAD')==expected_commit
local={}
for name in subprocess.check_output(['git','ls-files','-z'],cwd=S).decode().split('\0'):
 if not name:continue
 p=S/name; assert p.is_file() and not p.is_symlink(),p
 data=p.read_bytes(); assert data==subprocess.check_output(['git','show',expected_commit+':'+name],cwd=S),name
 local[name]=h(data)
m=json.loads(metadata.read_text()); nodes={n['id']:n for n in m['resolve']['nodes']}
start=next(p['id'] for p in m['packages'] if p['manifest_path']==str(S/'lib/Cargo.toml'))
workspace=len(sys.argv)>5 and sys.argv[5]=='workspace'
closure=set(); todo=list(m['workspace_members']) if workspace else [start]
while todo:
 n=todo.pop()
 if n in closure:continue
 closure.add(n); todo+=nodes[n]['dependencies']
pins={(p['name'],p['version']):p.get('checksum') for p in tomllib.loads((S/'Cargo.lock').read_text())['package']}; rows=[]; paths=[]
def audit_git(repo,commit):
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=repo).decode().strip()==commit
 files={}; materialized={}; gitlinks={}
 stages={line.split('\t',1)[1]:line.split()[0] for line in subprocess.check_output(['git','ls-files','--stage'],cwd=repo).decode().splitlines()}
 for name,mode in stages.items():
  p=repo/name
  if mode=='160000':
   pinned=subprocess.check_output(['git','rev-parse',commit+':'+name],cwd=repo).decode().strip()
   if p.is_dir() and any(p.iterdir()):gitlinks[name]={'commit':pinned,'inventory':audit_git(p,pinned)}
   else:gitlinks[name]={'commit':pinned,'populated':False}
   continue
  assert p.is_file() and not p.is_symlink(),p
  original=subprocess.check_output(['git','show',commit+':'+name],cwd=repo)
  if mode=='120000':
   target=(p.parent/original.decode()).resolve();relative=str(target.relative_to(repo))
   original=subprocess.check_output(['git','show',commit+':'+relative],cwd=repo);materialized[name]=relative
  assert p.read_bytes()==original,(repo,name)
  files[name]=h(original)
 for opts in [('ls-files','--others','--exclude-standard','-z'),('ls-files','--others','--ignored','--exclude-standard','-z')]:
  unknown=set(filter(None,subprocess.check_output(['git',*opts],cwd=repo).decode().split('\0')))
  assert unknown<={'.cargo-ok'},(repo,unknown)
 return {'files':files,'materialized_symlinks':materialized,'gitlinks':gitlinks}
for pkg in m['packages']:
 if pkg['id'] not in closure:continue
 root=Path(pkg['manifest_path']).parent
 if not pkg['source']:
  if pkg['name'] in {'ds-decomp','ds-decomp-cli'}:continue
  assert pkg['name']=='unarm',pkg
  manifest=json.loads((S/'dependency-patches/unarm-1.9.2/manifest.json').read_text())
  base=root.parent; expected=manifest['after_files']; actual={str(p.relative_to(base)):h(p.read_bytes()) for p in base.rglob('*') if p.is_file() and '.git' not in p.relative_to(base).parts}
  assert actual==expected,(set(actual)-set(expected),set(expected)-set(actual))
  for p in base.rglob('*'):assert not p.is_symlink(),p
  paths.append({'name':pkg['name'],'version':pkg['version'],'root':str(base),'files':len(actual),'file_inventory':actual})
  continue
 if pkg['source'].startswith('git+'):
  commit=pkg['source'].rsplit('#',1)[1]; repo=Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],cwd=root).decode().strip())
  audited=audit_git(repo,commit)
  paths.append({'name':pkg['name'],'version':pkg['version'],'source':pkg['source'],'root':str(repo),'files':len(audited['files']),'git_inventory':audited})
  continue
 assert pkg['source'].startswith('registry+'),pkg['source']
 for x in [root,*root.parents]:assert not x.is_symlink(),x
 tar=root.parents[2]/'cache'/root.parent.name/(root.name+'.crate')
 digest=pins[pkg['name'],pkg['version']]; assert h(tar.read_bytes())==digest,tar
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
 assert actual-set(expected)<={'.cargo-ok','.cargo-checksum.json'},(root,actual-set(expected))
 assert set(expected)<=actual,(root,set(expected)-actual)
 for name,digest0 in expected.items():assert h((root/name).read_bytes())==digest0,(root,name)
 rows.append({'name':pkg['name'],'version':pkg['version'],'crate_sha256':digest,'files':len(expected),'source_inventory_sha256':h(json.dumps(expected,sort_keys=True,separators=(',',':')).encode()),'file_inventory':expected})
report={'result':'locked source closure and archive inventories verified','source_commit':expected_commit,'source_tree':git('rev-parse','HEAD^{tree}'),'metadata_sha256':h(metadata.read_bytes()),'scope':('workspace including CLI' if workspace else 'ds-decomp lib including test/example dev-dependencies')+'; aarch64-apple-darwin','local_files':len(local),'registry_packages':len(rows),'registry_actual_files':sum(x['files'] for x in rows),'local_source_files':local,'registry_packages_detail':rows,'local_dependencies':paths}
(O/('workspace-source-review.json' if workspace else 'source-review.json')).write_text(json.dumps(report,indent=2)+'\n'); print({k:v for k,v in report.items() if k not in ['local_source_files','registry_packages_detail','local_dependencies']});print('local dependency files',sum(x['files'] for x in paths))
