

Validate LoxiLB SCTP Over Vxlay LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

It will use simpleSCTP Server program using Linux `IPPROTO_SCTP`. In initial time, it will make sctp(8080 port) sessions with servers(25.25.25.1, 26.26.26.1, 27.27.27.1) over VxLAN. And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.
