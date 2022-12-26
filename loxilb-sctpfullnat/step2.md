
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# llb1 loxicmd create lb 20.20.20.1 --sctp=38412:38412 --endpoints=10.0.3.10:1,10.0.3.11:1 --mode=fullnat
```

This command will configure LB policy to connection SCTP client with `20.20.20.1` VIP and `10.0.3.10, 10.0.3.11` IPv4 STCP endpoints with Full-NAT Mode

LoxiLB'S SCTP Full-NAT mode is operationg as like following diagram:

![configuration](./assets/configuration.png)

configuration

Check LoxiLB SCTP Full-NAT mode configuration :
```
root@0cb735c42e72:/# loxicmd get lb -o wide
| EXTERNAL IP | PORT | PROTOCOL | BLOCK | SELECT |  MODE   | ENDPOINT IP | TARGET PORT | WEIGHT | STATE  |
|-------------|------|----------|-------|--------|---------|-------------|-------------|--------|--------|
| 2001::1     | 2020 | tcp      |     0 | rr     | default | 31.31.31.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 32.32.32.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 33.33.33.1  |        8080 |      1 | active |
```

