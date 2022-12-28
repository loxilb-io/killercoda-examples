

Validate LoxiLB SCTP Over Vxlay LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-sctptunlb
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
SCENARIO-sctptunlb [OK]
```

Summary `validation.sh` file :

It will use simpleSCTP Server program using Linux `IPPROTO_SCTP`. In initial time, it will make sctp(8080 port) sessions with servers(25.25.25.1, 26.26.26.1, 27.27.27.1) over VxLAN. And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.

(0) Create Mirror Linkbw LoxiLB and Wireshark node
```
source ./common.sh
connect_docker_hosts_default_ns llb2 wireshark
```

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb2llb1`(link bw llb2 <--> llb1) to `ellb1wireshark`(llb2 <--> link bw wireshark node ), `ellb2l3e1`(link bw llb2 <--> l3e1) to `ellb1wireshark`(llb2 <--> link bw wireshark node )  

```
./config-mirror.sh 1 ellb2llb1 ellb1wireshark
./config-mirror.sh 2 ellb2l3e1 ellb1wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select ewiresharkllb1 as capturing port.

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
./rmconfig-mirror.sh 2 
```

`1` is unique id which is created before.
