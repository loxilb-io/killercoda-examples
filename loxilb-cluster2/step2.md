
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=10.10.10.3:1,10.10.10.4:1,10.10.10.5:1 --mode=onearm --bgp
root@8b74b5ddc4d2:/# exit

docker exec -it llb2 bash
root@8b74b5ddc4d3:/# loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=10.10.10.3:1,10.10.10.4:1,10.10.10.5:1 --mode=onearm --bgp
root@8b74b5ddc4d3:/# exit

```

This command will configure LB policy to connection TCP client with `20.20.20.1` VIP and `10.10.10.3, 10.10.10.4, 10.10.10.5` IPv4 endpoints with One-ARM Mode per each LoxiLB nodes.

LoxiLB'S TCP One-ARM HA mode is operationg as like following diagram:

![configuration](./assets/configuration.png)

configuration

Check LoxiLB TCP One-ARM mode with HA configuration :
```
docker exec -it llb1 bash
root@0cb735c42e72:/# loxicmd get lb -o wide
| EXTERNAL IP | PORT | PROTOCOL | BLOCK | SELECT |  MODE   | ENDPOINT IP | TARGET PORT | WEIGHT | STATE  |
|-------------|------|----------|-------|--------|---------|-------------|-------------|--------|--------|
| 20.20.20.1  | 2020 | tcp      |     0 | rr     | default | 10.10.10.3  |        8080 |      1 | active |
|             |      |          |       |        |         | 10.10.10.4  |        8080 |      1 | active |
|             |      |          |       |        |         | 10.10.10.5  |        8080 |      1 | active |
```

