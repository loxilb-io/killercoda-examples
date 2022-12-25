
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# llb1 loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1 --monitor
```

This command will configure LB policy with monitoring feature. `--monitor` declares that LoxiLB monitor endpoints status continuously and update automatically.

In validation step, you will check how LoxiLB will operate when endpoint has down.
