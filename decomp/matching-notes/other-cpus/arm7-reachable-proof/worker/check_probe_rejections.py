import copy,hashlib,json,subprocess,sys
from pathlib import Path
p=Path(__file__).resolve().parent
sha=lambda path:hashlib.sha256(Path(path).read_bytes()).hexdigest()
argv=json.loads((p/'commands.json').read_text())[0]
argv[0]=str(Path(sys.argv[1]).resolve());argv[6]=sha(argv[0])
requests=json.loads(Path(argv[4]).read_text())
cases=[]
for index,name in [(3,'wrong-layout-pin'),(5,'wrong-request-pin'),(6,'wrong-producer-pin')]:
    command=argv.copy();command[index]='0'*64;cases.append((name,command))
mutations={
 'empty-programs': lambda r: [],
 'duplicate-program': lambda r: [r[0],r[0]],
 'unknown-field': lambda r: [dict(r[0],grant_credit=True)],
 'empty-selection': lambda r: [dict(r[0],selections=[])],
 'empty-roots': lambda r: [dict(r[0],roots=[])],
 'absent-root-selection': lambda r: [dict(r[0],roots=[dict(r[0]['roots'][0],selection=999)])],
 'interior-root': lambda r: [dict(r[0],roots=[dict(r[0]['roots'][0],address=r[0]['roots'][0]['address']+2)])],
 'empty-assumption': lambda r: [dict(r[0],roots=[dict(r[0]['roots'][0],assumption=' ')])],
 'detached-report': lambda r: json.loads((p/'calls-report.json').read_text()),
}
for name,mutate in mutations.items():
    request=p/f'negative-{name}.json';request.write_text(json.dumps(mutate(copy.deepcopy(requests)))+'\n')
    command=argv.copy();command[4]=str(request);command[5]=sha(request);cases.append((name,command))
results=[]
for name,command in cases:
    run=subprocess.run(command,capture_output=True,text=True)
    assert run.returncode!=0,(name,run.stdout)
    assert not run.stdout,(name,'published partial result')
    results.append(dict(name=name,returncode=run.returncode,stderr=run.stderr.strip()))
(p/'probe-rejections.json').write_text(json.dumps(results,indent=2)+'\n')
print(f'PASS: {len(results)} probe rejections; zero partial success reports')
