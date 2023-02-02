
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# loxicmd create lb 20.20.20.1 --sctp=38412:38412 --endpoints=10.0.3.10:1,10.0.3.11:1 --mode=fullnat
```

This command will configure LB policy to connection SCTP client with `20.20.20.1` VIP and `10.0.3.10, 10.0.3.11` IPv4 STCP endpoints with Full-NAT Mode

LoxiLB'S SCTP Full-NAT mode is operating as like following diagram:

![configuration](./assets/configuration.png)


Check LoxiLB SCTP Full-NAT mode configuration :
```
root@0cb735c42e72:/# loxicmd get lb -o wide
| EXTERNAL IP | PORT  | PROTOCOL | BLOCK | SELECT |  MODE   | ENDPOINT IP | TARGET PORT | WEIGHT | STATE  |
|-------------|-------|----------|-------|--------|---------|-------------|-------------|--------|--------|
| 20.20.20.1  | 38412 | sctp     |     0 | rr     | fullnat | 10.0.3.10   |       38412 |      1 | active |
|             |       |          |       |        |         | 10.0.3.11   |       38412 |      1 | active |
```

