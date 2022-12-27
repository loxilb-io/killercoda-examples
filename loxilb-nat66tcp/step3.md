

Validate LoxiLB NAT66 LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO nat66tcp
server1 UP
server2 UP
server3 UP
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
server1
server2
nat66tcp [OK]
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(4ffe::1, 5ffe::1, 6ffe::1). And check that IPv6 clients can access to IPv6 endpoints with load balancing.

