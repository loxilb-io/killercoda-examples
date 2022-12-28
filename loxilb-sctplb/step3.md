

Validate LoxiLB SCTP Full-NAT LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-sctplb
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
SCENARIO-sctplb [OK]
```

Summary `validation.sh` file :

It will use simpleSCTP Server program using Linux `IPPROTO_SCTP`. In initial time, it will make sctp(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.1). And check that IPv4 SCTP clients can access to IPv4 SCTP endpoints with load balancing.

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
