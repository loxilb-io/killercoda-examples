

Validate LoxiLB TCP Over GTP-U Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

It will use simpleTCP Server program using Linux `IPPROTO_TCP`. In initial time, it will make sctp(8080 port) sessions with servers(25.25.25.1, 26.26.26.1, 27.27.27.1) over GTP-U. And check that IPv4 TCP clients can access to IPv4 TCP endpoints with load balancing.

