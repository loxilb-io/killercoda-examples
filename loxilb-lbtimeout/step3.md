

Validate LoxiLB Timeout Feature

```
cd ~/
sudo /bin/bash ./validation.sh\
LB-TIMEOUT
server1 UP
server2 UP
server3 UP
nc is UP
LB-TIMEOUT [OK]
./validation.sh: line 65: 24312 Killed                  $hexec l3ep1 iperf -s -p 8080 >> /dev/null 2>&1
./validation.sh: line 65: 24313 Killed                  $hexec l3ep2 iperf -s -p 8080 >> /dev/null 2>&1
./validation.sh: line 65: 24314 Killed                  $hexec l3ep3 iperf -s -p 8080 >> /dev/null 2>&1
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.1).

After initial complete of session, scenario will wait 100 seconds and LoxiLB will send reset after configured inactivity of 30s.


