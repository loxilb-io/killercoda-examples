

Validate LoxiLB NAT64 LB Feature

Exit from LoxiLB container first

```
root@0cb735c42e72:/# exit
exit
ubuntu $
```

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO nat64tcp
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
nat64tcp [OK]
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.1). And check that IPv6 clients can access to IPv4 endpoints with load balancing.

