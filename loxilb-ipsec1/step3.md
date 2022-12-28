

Validate LoxiLB LB Over IPSec for VPN Feature

```
cd ~/
sudo /bin/bash ./validation.sh
IPSEC-1
Ping lh1                ->       server1                        : [OK]
Ping lh1                ->       server2                        : [OK]
Ping lh2                ->       server1                        : [OK]
Ping lh2                ->       server2                        : [OK]
IPSec Tunnel Traffic [OK]
server1 UP
server2 UP
IPSEC-1 [OK]
```

(0) Create Mirror Linkbw LoxiLB and Wireshark node
```
source ./common.sh
connect_docker_hosts_default_ns llb2 wireshark
```

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb2llb1`(link bw llb2 <--> ellb2llb1) to `ellb2wireshark`(llb2 <--> link bw wireshark node )

```
./config-mirror.sh 1 ellb2llb1 ellb2wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select ewiresharkllb2 as capturing port.

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
```

`1` is unique id which is created before.



