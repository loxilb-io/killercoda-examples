

Validate LoxiLB Cluster HA with BGP, VRRP and Full-NAT Mode

```
cd ~/
sudo /bin/bash ./validation.sh
CLUSTER-1
CLUSTER-1 HA state llb1-MASTER llb2-BACKUP
Master:llb1 Backup:llb2
llb1 BGP connection [OK]
llb2 BGP connection [OK]
BGP Service Route [OK]
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
CLUSTER-1 Phase-1 [OK]
ka_llb1
CLUSTER-1 HA state llb1-BACKUP llb2-MASTER
CLUSTER-1 HA [SUCCESS]
BGP Service Route [OK]
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
CLUSTER-1 [OK]
```

