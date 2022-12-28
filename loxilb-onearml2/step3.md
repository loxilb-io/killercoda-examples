

Validate LoxiLB L2 One-ARM Mode Feature

```
cd ~/
sudo /bin/bash ./validation.sh
ONEARM-L2
server1 UP
server2 UP
server3 UP
server1
server2
server3
server1
server2
server3
server1
server2
server3
server1
server2
server3
ONEARM-L2 [OK]
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(100.100.100.2, 100.100.100.3, 100.100.100.4).

(0) Create Mirror Linkbw LoxiLB and Wireshark node
```
source ./common.sh
connect_docker_hosts_default_ns llb1 wireshark
```

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb1l2ep1`(link bw llb1 <--> l2ep1) to `ellb1wireshark`(llb1 <--> link bw wireshark node )

```
./config-mirror.sh 1 ellb1l2ep1 ellb1wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select ewiresharkllb1 as capturing port.

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
```

`1` is unique id which is created before.