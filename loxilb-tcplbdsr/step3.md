

Validate LoxiLB DSR Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.33.1).

You need to check on dendpoints(31.31.31.1 - 3) that traffic is comming with original client IP(`10.10.10.1`). In DSR mode, traffic has to come without LB Source IP.

