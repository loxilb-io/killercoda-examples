

Validate LoxiLB NAT66 LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO nat66tcp
server1 UP
server2 UP
server3 UP
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
server1
server2
nat66tcp [OK]
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(4ffe::1, 5ffe::1, 6ffe::1). And check that IPv6 clients can access to IPv6 endpoints with load balancing.

(0) Create Mirror Linkbw LoxiLB and Wireshark node
```
source ./common.sh
connect_docker_hosts_default_ns llb1 wireshark
```

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb1l3ep1`(link bw llb1 <--> l3ep1) to `ellb1wireshark`(llb1 <--> link bw wireshark node ) and `ellb1l3h1`(link bw l3h1 <--> llb1) to `ellb1wireshark`(llb1 <--> link bw wireshark node ) 

```
./config-mirror.sh 1 ellb1l3ep1 ellb1wireshark
./config-mirror.sh 2 ellb1l3h1 ellb1wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select ewiresharkllb1 as capturing port.

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
./rmconfig-mirror.sh 2
```

`1` is unique id which is created before.


