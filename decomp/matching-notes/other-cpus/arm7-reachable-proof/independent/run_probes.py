from pathlib import Path
import hashlib,subprocess,json
P=Path('/private/tmp/jus-arm7-reachable-review-proof');binary=Path('/private/tmp/jus-arm7-reachable-review-cache/target/release/examples/arm7_reachable_probe');h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();layout=Path('/private/tmp/jus-track-a/decomp/matching-notes/other-cpus/arm7-checked-layouts.json');commands=[]
assert h(binary)=='28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff'
for case in ['calls','startup']:
 req=P/f'{case}-requests.json';command=[str(binary),'/Users/djdjo/Documents/mine/rom/jus.nds',str(layout),h(layout),str(req),h(req),h(binary)];a=subprocess.run(command,capture_output=True);b=subprocess.run(command,capture_output=True);assert a.returncode==b.returncode==0,(a.stderr,b.stderr);assert a.stdout==b.stdout; (P/f'{case}-report.json').write_bytes(a.stdout);commands.append(command);print(case,'sha256',h(P/f'{case}-report.json'),'repeat identical')
(P/'probe-commands.json').write_text(json.dumps(commands,indent=2)+'\n')
