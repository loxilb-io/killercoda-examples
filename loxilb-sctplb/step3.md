

Validate LoxiLB SCTP Full-NAT LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-sctplb
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
SCENARIO-sctplb [OK]
```

Summary `validation.sh` file :

It will use simpleSCTP Server program using Linux `IPPROTO_SCTP`. In initial time, it will make sctp(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.1). And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.

