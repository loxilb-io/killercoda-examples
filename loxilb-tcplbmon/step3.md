


(0) Create Mirror Linkbw LoxiLB and Wireshark node
```
source ./common.sh
connect_docker_hosts_default_ns llb1 wireshark
```

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb1l3ep1`(link bw llb1 <--> l3ep1) to `ellb1wireshark`(llb1 <--> link bw wireshark node ), `ellb1l3ep2`(link bw llb1 <--> l3ep2) to `ellb1wireshark`(llb1 <--> link bw wireshark node ) and `ellb1l3ep3`(link bw llb1 <--> l3ep3) to `ellb1wireshark`(llb1 <--> link bw wireshark node )

```
./config-mirror.sh 1 ellb1l3ep1 ellb1wireshark
./config-mirror.sh 2 ellb1l3ep2 ellb1wireshark
./config-mirror.sh 3 ellb1l3ep3 ellb1wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select ewiresharkllb1 as capturing port.

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
./rmconfig-mirror.sh 2 
./rmconfig-mirror.sh 3 
```

`1` is unique id which is created before.


