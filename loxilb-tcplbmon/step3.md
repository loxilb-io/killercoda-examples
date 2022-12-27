

Validate LoxiLB monitoring Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-tcplbmon
server1 UP
server2 UP
server3 UP
server1
server2
server3
server1
server2
server3
server1
server2
server3
server1
server2
server3
SCENARIO-tcplbmon p1 [OK]

server2
server3
server2
server3
server2
SCENARIO-tcplbmon [OK]
./validation.sh: line 78: 24244 Killed                  $hexec l3ep1 node ./server1.js
./validation.sh: line 78: 24245 Killed                  $hexec l3ep2 node ./server2.js
./validation.sh: line 78: 24246 Killed                  $hexec l3ep3 node ./server3.js
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1) and monitoring enable. In second configuration, it will down one endpoint and check how to update automatically.

