#  Achieving LoxiLB TCP Load Balancing Test in 5G N3 Interface as LBO(Local Break Out)

Welcome to the tutorial where you learn how to configure LoxiLB.

On a serious note, we will look into how to use LoxiLB for TCP Test in 5G N3 Interface as LBO(Local Break Out). 

Basically 5G N3 UL-CL (uplink classifier) is used to divert specific UE traffic to local datacenters, this is especially useful in cases whereby the UPF does not support UL-CL and you want to route traffic destined to specific destination IP address to a local server. So Loxilb will actually perform two functions in this regard:

* Process GTP-U traffic that is passing through it and re-routing the traffic that meets the UL-CL policy.
* Create an load-balancer endpoint for the backend servers that will be receiving the UL-CL traffic.

(reference) Christopher Adigun's tech blog - "5G Uplink Classifier Using Loxilb": https://futuredon.medium.com/5g-uplink-classifier-using-loxilb-7593a4d66f4c

LoxiLB was built with this in mind and it in this tutorial you will learn:

* How to configure **LoxiLB**: How to setup it and How to use loxi CLI.
* How to do a troubleshoot.
* How to test performance.

### Feedback

Do you see any bug, typo in the tutorial or you have some feedback for us?
Let us know on https://github.com/loxilb-io/loxilb or #loxilb slack channel linked on https://loxilb.io

### Contributed by:
contact@netlox.io

