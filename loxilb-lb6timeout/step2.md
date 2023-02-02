
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# loxicmd create lb  2001::1 --tcp=2020:8080 --endpoints=4ffe::1:1,5ffe::1:1,6ffe::1:1 --inatimeout=30
```

This command will configure LB policy with `30 secs timeout`. After 30 second, inatvie session will be disappeared. You can define session keep alive time with `--inatimeout` value.

