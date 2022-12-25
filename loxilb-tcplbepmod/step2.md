
Configure LoxiLB

```
cd ~/
sudo /bin/bash ./config.sh
```

Summary `config.sh` file :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# llb1 loxicmd create lb 20.20.20.1 --tcp=2020:2020 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1 --mode=dsr
```

This command will configure LB policy with basic TCP default single endpoint rule. 

In validation step, you will dynamically update this rule.
