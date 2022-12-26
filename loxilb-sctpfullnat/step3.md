

Validate LoxiLB NAT64 LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

It will use simpleSCTP Server program using Linux `IPPROTO_SCTP`. In initial time, it will make sctp(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.33.1). And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.

