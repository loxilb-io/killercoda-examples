

Validate LoxiLB TCP Over Vxlay LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-tcptunlb
server1 UP
server2 UP
server3 UP
SCENARIO-tcptunlb [OK]
```

Summary `validation.sh` file :

It will use simpleSCTP Server program using Linux `IPPROTO_TCP`. In initial time, it will make sctp(8080 port) sessions with servers(25.25.25.1, 26.26.26.1, 27.27.27.1) over VxLAN. And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.

