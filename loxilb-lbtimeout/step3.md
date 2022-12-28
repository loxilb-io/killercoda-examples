

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

(0) Create Mirror Linkbw LoxiLB and Wireshark node
```
source ./common.sh
connect_docker_hosts_default_ns llb1 wireshark
```

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb1l3ep1`(link bw llb1 <--> l3ep1) to `ellb1wireshark`(llb1 <--> link bw wireshark node )

```
./config-mirror.sh 1 ellb1l3ep1 ellb1wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select `ewiresharkllb1` as capturing port.

You can check as like following figure:

![diagram](./assets/ws.png)

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
```

`1` is unique id which is created before.

