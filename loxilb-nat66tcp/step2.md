
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# loxicmd create lb 2001::1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1
root@8b74b5ddc4d2:/# loxicmd create lb  2001::1 --tcp=2020:8080 --endpoints=4ffe::1:1,5ffe::1:1,6ffe::1:1
```

This command will configure LB policy to connection IPv6 client with `2001:11` VIP and `4ffe:11, 5ffe::1, 6ffe::1` IPv6 endpoints.

LoxiLB'S NAT66 is operating as like following diagram:

![configuration](./assets/configuration.png)


Check LoxiLB NAT66 configuration :
```
root@3ccbfc45a855:/# loxicmd get lb -o wide
| EXTERNAL IP | PORT | PROTOCOL | BLOCK | SELECT |  MODE   | ENDPOINT IP | TARGET PORT | WEIGHT | STATE  |
|-------------|------|----------|-------|--------|---------|-------------|-------------|--------|--------|
| 20.20.20.1  | 2020 | tcp      |     0 | rr     | default | 31.31.31.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 32.32.32.1  |        8080 |      1 | active |
|             |      |          |       |        |         | 33.33.33.1  |        8080 |      1 | active |
| 2001::1     | 2020 | tcp      |     0 | rr     | default | 4ffe::1     |        8080 |      1 | active |
|             |      |          |       |        |         | 5ffe::1     |        8080 |      1 | active |
|             |      |          |       |        |         | 6ffe::1     |        8080 |      1 | active |
```





