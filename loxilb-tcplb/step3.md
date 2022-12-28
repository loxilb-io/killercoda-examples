

Validate LoxiLB TCP Fullt-NAT LB Feature

```
cd ~/
sudo /bin/bash ./validation.sh
SCENARIO-tcplb
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
SCENARIO-tcplb [OK]
```

Summary `validation.sh` file :

In initial time, it will make http(8080 port) sessions with servers(31.31.31.1, 32.32.32.1, 33.33.33.1).

(1) Create Mirror Object for analytics

LoxiLB can support mirror for analytics. 

Mirroring Configuration sending from `ellb1l3ep1`(link bw llb1 <--> l3ep1) to `ellb1wireshark`(llb1 <--> link bw wireshark node )

```
./config-mirror.sh 1 ellb1l3ep1 ellb1wireshark
```

`1` is unique id for mirror object.

Access Wireshark for Analytics [ACCESS WIRESHARK]({{TRAFFIC_HOST1_3000}}) and select ewiresharkllb1 as capturing port.

(2) Delete Mirror Object

```
./rmconfig-mirror.sh 1 
```

`1` is unique id which is created before.





