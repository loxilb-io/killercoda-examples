

Validate LoxiLB WRR Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.1). And you can see that 16 flows are distributes according to WRR value (4:4:2).

