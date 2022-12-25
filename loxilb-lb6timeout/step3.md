

Validate LoxiLB Timeout Feature

```
cd ~/
sudo /bin/bash ./validation.sh
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers( 4ffe::1, 5ffe::1, 6ffe::1 ).

After initial complete of session, scenario will wait 100 seconds and LoxiLB will send reset after configured inactivity of 30s.


