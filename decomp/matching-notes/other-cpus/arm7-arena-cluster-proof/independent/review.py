"""Independent frozen .32 package closure and actual-artifact comparison."""
import copy,hashlib,importlib.util,json,pathlib,subprocess
ROOT=pathlib.Path('/private/tmp/jus-arm7-arena-cluster-independent')
SCRATCH=pathlib.Path('/private/tmp/jus-arm7-arena-cluster-independent-proof')
PROOF=ROOT/'decomp/matching-notes/other-cpus/arm7-arena-cluster-proof'
sha=lambda b:hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.run(['git',*args],cwd=ROOT,check=True,capture_output=True).stdout
assert git('rev-parse','HEAD').decode().strip()=='bb99a28f1dfc3ae2a9d554fa3494e80d6fdcf80f'
assert git('status','--porcelain')==b''
base='8b282d5'
changed=git('diff','--name-status',base,'HEAD').decode().splitlines()
assert len(changed)==35 and all(line.startswith('A\tdecomp/matching-notes/other-cpus/arm7-arena-cluster') for line in changed)
for line in changed:
 path=line.split('\t')[1]
 assert sha((ROOT/path).read_bytes())==sha(git('show','HEAD:'+path))
PUB=json.loads((PROOF/'trial-proof.json').read_text())
FRESH=json.loads((SCRATCH/'public-replay/trial-proof.json').read_text())
OWN=json.loads((SCRATCH/'native-01/result.json').read_text())
a,b=copy.deepcopy(PUB),copy.deepcopy(FRESH)
for x in (a,b):
 for c in x['candidates']:
  argv=c['compile_command']['argv'];argv[9]=pathlib.Path(argv[9]).name;argv[11]=pathlib.Path(argv[11]).name
assert a==b
assert FRESH['status']=='actual_four_MW_arena_cluster_exact_original_images'
assert FRESH['source_credit_bytes']==0 and FRESH['original_names_types_ABI_extent_version_ownership_established'] is False
assert FRESH['inputs_unchanged'] and FRESH['checked_layout_sha256']=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
expect=[('lower_store','1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362','b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7','build82_O4s',20,0,0),('upper_store','a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb','03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf','build114_O4p',20,0,0),('lower_getter','fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537','9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b','build82_O4s',80,8,2),('upper_getter','342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e','b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1','build82_O4s',108,20,3)]
for c,(role,source,obj,recipe,code,pool,relocs) in zip(FRESH['candidates'],expect,strict=True):
 assert (c['role'],c['source_sha256'],c['elf']['object_sha256'],c['recipe'],c['elf']['instruction_bytes'],c['elf']['pool_bytes'],len(c['elf']['relocations']))==(role,source,obj,recipe,code,pool,relocs)
 assert sha((PROOF/c['source']).read_bytes())==source
spec=importlib.util.spec_from_file_location('own_cluster',SCRATCH/'cluster.py');mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
metadata=[]
for i,(pub,own) in enumerate(zip(FRESH['programs'],OWN['programs'],strict=True)):
 assert pub['identity']==own['identity']
 pos=pub['positive'];ownpos=own['positive']
 assert pos['linked_elf_sha256']=='dbf07694b3d6b50643c1a348dfe0b93844cd7ff46345ff0fcf1ccbaaef54efca'
 assert ownpos['elf_sha256']=='c24aed47166192ebef56a5ec52a206df372a6fcdd98ab71d2ac074faeef88384'
 assert pos['image_sha256']==ownpos['image_sha256']=='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
 assert pos['image_bytes']==ownpos['image_bytes']==165552 and pos['BSS_bytes']==ownpos['BSS_bytes']==21424
 assert pub['wrong_shared_wram']['image_mismatch_offsets']==own['wrong_shared_WRAM']['mismatch_offsets']==[20784,20908]
 assert pub['wrong_shared_wram']['derived_mismatch_offsets']==[20784,20908]
 assert all(v['returncode']==1 for v in pub['omitted'].values())
 assert all(v==1 for v in own['omitted_roles'].values())
 assert pub['swapped_stores']['native_command']['returncode']==0 and pub['swapped_stores']['strict_role_rejection']
 assert own['swapped_stores_rejected_by']=='strict_actual_role_readback'
 assert pub['malformed_load']['rejected'] and own['malformed_load_rejected']
 pubelf=SCRATCH/f'public-replay/native/program-{i}/positive.elf';ownelf=SCRATCH/f'native-01/program-{i}/positive.elf'
 ah,asec,asym,aseg=mod.parse_elf(pubelf.read_bytes());bh,bsec,bsym,bseg=mod.parse_elf(ownelf.read_bytes())
 assert ah==bh and aseg==bseg
 alloc=lambda sections,data:[(s['name'],s['vma'],s['size'],s['flags'],sha(data[s['offset']:s['offset']+s['size']]) if s['type']==1 else None) for s in sections if s['flags']&2 and s['size']]
 assert alloc(asec,pubelf.read_bytes())==alloc(bsec,ownelf.read_bytes())
 pa={s['name']:s['value'] for s in asym};oa={s['name']:s['value'] for s in bsym}
 for public,ownrole,addr,size in [('lower_store','lowstore',0x037fcf04,20),('upper_store','upperstore',0x037fcf18,20),('lower_getter','lowgetter',0x037fcf2c,88),('upper_getter','highgetter',0x037fcf84,128)]:
  assert pa[f'__{public}_start']==oa[f'__{ownrole}_start']==addr
  assert pa[f'__{public}_end']==oa[f'__{ownrole}_end']==addr+size
 assert len(pubelf.read_bytes())==167412 and len(ownelf.read_bytes())==167396
 metadata.append({'identity':i,'public_elf_sha256':sha(pubelf.read_bytes()),'independent_elf_sha256':sha(ownelf.read_bytes()),'equal_allocated_sections_and_six_loads':True,'different_linker_marker_names':True})
receipt={'status':'accepted_no_flags','public_worker_commit':'d23908f92146c45eb83cafb297d55deb01c7cb0a','independent_cherry_commit':git('rev-parse','HEAD').decode().strip(),'new_git_blobs':35,'git_head_pins':34,'published_receipt_sha256':sha((PROOF/'trial-proof.json').read_bytes()),'fresh_public_replay_receipt_sha256':sha((SCRATCH/'public-replay/trial-proof.json').read_bytes()),'independent_native_receipt_sha256':sha((SCRATCH/'native-01/result.json').read_bytes()),'programs':metadata,'source_credit_bytes':0,'remaining_boundary':'original names, types, ABI, extent, version, and source ownership unproved'}
(SCRATCH/'final-review.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
