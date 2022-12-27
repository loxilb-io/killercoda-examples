

Validate LoxiLB SCTP Over GTP-U LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-ulclsctplb
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
SCENARIO-ulclsctplb [OK]
```

Summary `validation.sh` file :

It will use simpleSCTP Server program using Linux `IPPROTO_SCTP`. In initial time, it will make sctp(8080 port) sessions with servers(25.25.25.1, 26.26.26.1, 27.27.27.1) over GTP-U. And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.

