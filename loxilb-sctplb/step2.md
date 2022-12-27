
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# llb1 loxicmd create lb 20.20.20.1 --sctp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1
```

Check LoxiLB SCTP Full-NAT mode configuration :
```
root@10571b8b644a:/# loxicmd get lb -o wide
| EXTERNAL IP | PORT | PROTOCOL | BLOCK | SELECT |  MODE   | ENDPOINT IP | TARGET PORT | WEIGHT | STATE  |
|-------------|------|----------|-------|--------|---------|-------------|-------------|--------|--------|
| 20.20.20.1  | 2020 | sctp     |     0 | rr     | default | 31.31.31.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 32.32.32.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 33.33.33.1  |        8080 |      1 | active ||
```

This command will configure LB policy to connection SCTP client with `20.20.20.1` VIP and `31.31.31.1, 32.32.32.1, 33.33.33.1` IPv4 STCP endpoints.

