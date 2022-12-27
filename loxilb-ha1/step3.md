

Validate LoxiLB HA LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
HA-1
HA-1 HA state llb1-MASTER llb2-BACKUP
Master:llb1 Backup:llb2
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
HA-1 Phase-1 [OK]
ka_llb1
HA-1 HA state llb1-BACKUP llb2-MASTER
HA-1 HA [SUCCESS]
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
HA-1 [OK]
```
