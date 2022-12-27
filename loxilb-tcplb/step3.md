

Validate LoxiLB TCP Fullt-NAT LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-tcplb
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
SCENARIO-tcplb [OK]
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.1).

