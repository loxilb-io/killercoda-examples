

Validate LoxiLB Dynamic update Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-tcplbepmod
server1 UP
server2 UP
server3 UP
Expecting server1
server1
server1
server1
server1
ProtoPortpair: map[tcp:[2020:8080]]
Debug: response.StatusCode: 200
Expecting server1, server2
server1
server2
server1
server2
ProtoPortpair: map[tcp:[2020:8080]]
Debug: response.StatusCode: 200
Expecting server1
server1
server1
server1
server1
ProtoPortpair: map[tcp:[2020:8080]]
Debug: response.StatusCode: 200
Expecting server1, server2
server1
server2
server1
server2
SCENARIO-tcplbepmod [OK]
./validation.sh: line 100: 24284 Killed                  $hexec l3ep1 socat -v -T0.05 tcp-l:8080,reuseaddr,fork system:"echo 'server1'; cat" > /dev/null 2>&1
./validation.sh: line 100: 24285 Killed                  $hexec l3ep2 socat -v -T0.05 tcp-l:8080,reuseaddr,fork system:"echo 'server2'; cat" > /dev/null 2>&1
./validation.sh: line 100: 24286 Killed                  $hexec l3ep3 socat -v -T0.05 tcp-l:8080,reuseaddr,fork system:"echo 'server3'; cat" > /dev/null 2>&1
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1).

Script will update dynamically number of endpoints and check traffic.

(0) Create Mirror Linkbw LoxiLB and Wireshark node
```
source ./common.sh
connect_docker_hosts_default_ns llb1 wireshark
```

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb1l3ep1`(link bw llb1 <--> l3ep1) to `ellb1wireshark`(llb1 <--> link bw wireshark node ) and `ellb1l3ep2`(link bw llb1 <--> l3ep2) to `ellb1wireshark`(llb1 <--> link bw wireshark node )

```
./config-mirror.sh 1 ellb1l3ep1 ellb1wireshark
./config-mirror.sh 2 ellb1l3ep2 ellb1wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select ewiresharkllb1 as capturing port.

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
./rmconfig-mirror.sh 2
```

`1` is unique id which is created before.


