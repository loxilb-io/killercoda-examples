

Validate LoxiLB NAT64 LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

It will use simpleCTP Server program using Linux `IPPROTO_CTP`. In initial time, it will make sctp(8080 port) sessions with servers(25.25.25.1, 26.26.26.1). And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.

