

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
