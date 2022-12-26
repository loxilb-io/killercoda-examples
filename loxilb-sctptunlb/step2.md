
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb2 bash
root@8b74b5ddc4d2:/# loxicmd create lb 88.88.88.88 --sctp=2020:8080 --endpoints=25.25.25.1:1,26.26.26.1:1,27.27.27.1:1
```

This command will configure LB policy to connection SCTP client with `88.88.88.88` VIP and `25.25.25.1, 26.26.26.1, 27.27.27.1` IPv4 STCP endpoints with VxLAN Overlay

LoxiLB'S SCTP VxLAN Overlay is operationg as like following diagram:

![configuration](./assets/configuration.png)

configuration

Check LoxiLB SCTP VxLAN Overlay configuration :
```
root@0cb735c42e72:/# loxicmd get lb -o wide
| EXTERNAL IP | PORT | PROTOCOL | BLOCK | SELECT |  MODE   | ENDPOINT IP | TARGET PORT | WEIGHT | STATE  |
|-------------|------|----------|-------|--------|---------|-------------|-------------|--------|--------|
| 2001::1     | 2020 | tcp      |     0 | rr     | default | 31.31.31.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 32.32.32.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 33.33.33.1  |        8080 |      1 | active |
```

