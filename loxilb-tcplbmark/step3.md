

Validate LoxiLB Dynamic update Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1) and mark value(10). In second configuration, it will change `--setmark=20` on firewall stage and previous LB policy will not apply.
