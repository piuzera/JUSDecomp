from pathlib import Path
import importlib.util,json,os,subprocess,hashlib
root=Path(__file__).resolve().parents[3]; bundle=root/'dependency-patches/unarm-1.9.2'; out=root/'target/branch-repair'; checkout=out/'unarm-ignored-build-probe'
if not checkout.exists():
 subprocess.run(['git','clone','--no-hardlinks',str(root/'local-deps/unarm'),str(checkout)],check=True,capture_output=True)
spec=importlib.util.spec_from_file_location('prepare_unarm',bundle/'prepare.py'); module=importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
build=checkout/'disasm/build.rs'; exclude=checkout/'.git/info/exclude'
if not build.exists():
 module.prepare(checkout,bundle)
 build.write_text('fn main() { compile_error!("unpinned build script must be rejected"); }\n')
 with exclude.open('a') as f:f.write('\n/disasm/build.rs\n')
try:
 report=module.prepare(checkout,bundle,check_only=True)
 acceptance={'accepted':True,'report':report}
except ValueError as error:
 acceptance={'accepted':False,'error':str(error)}
environment=os.environ.copy(); environment['CARGO_HOME']=str(out/'cargo-home'); environment['CARGO_TARGET_DIR']=str(out/'ignored-build-probe-target')
command=['cargo','metadata','--manifest-path',str(checkout/'disasm/Cargo.toml'),'--format-version','1','--no-deps','--locked','--offline']
metadata=subprocess.run(command,env=environment,text=True,capture_output=True,check=True)
package=next(p for p in json.loads(metadata.stdout)['packages'] if p['name']=='unarm')
custom=[t['src_path'] for t in package['targets'] if 'custom-build' in t['kind']]
assert custom==[str(build)],custom
proof={'case':'ignored unpinned disasm/build.rs on actual prepared upstream1.9.2','upstream_commit':subprocess.check_output(['git','-C',str(checkout),'rev-parse','HEAD'],text=True).strip(),'check_only':acceptance,'cargo_metadata_command':command,'custom_build_targets':custom,'build_script_sha256':hashlib.sha256(build.read_bytes()).hexdigest(),'build_script_executed':False}
print(json.dumps(proof,indent=2))

assert not proof["check_only"]["accepted"], "unpinned ignored build script accepted"
