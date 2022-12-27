

Validate LoxiLB LB with MARK Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-tcplbmark
server1 UP
server2 UP
server3 UP
server1
server2
server3
SCENARIO-pass-tcplbmark [OK]
./validation.sh: line 74: 24083 Killed                  $hexec l3ep1 socat -v -T0.05 tcp-l:8080,reuseaddr,fork system:"echo 'server1'; cat" > /dev/null 2>&1
./validation.sh: line 74: 24084 Killed                  $hexec l3ep2 socat -v -T0.05 tcp-l:8080,reuseaddr,fork system:"echo 'server2'; cat" > /dev/null 2>&1
./validation.sh: line 74: 24085 Killed                  $hexec l3ep3 socat -v -T0.05 tcp-l:8080,reuseaddr,fork system:"echo 'server3'; cat" > /dev/null 2>&1
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1) and mark value(10). In second configuration, it will change `--setmark=20` on firewall stage and previous LB policy will not apply.
