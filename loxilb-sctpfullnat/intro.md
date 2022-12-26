#  Achieving LoxiLB SCTP Load Balancing Test with Funll-NAT Mode

Welcome to the tutorial where you learn how to configure LoxiLB.

On a serious note, we will look into how to use LoxiLB for SCTP test with Funll-NAT Mode. 

Stream Control Transmission Protocol (SCTP) is a connection-oriented network protocol for transmitting multiple streams of data simultaneously between two endpoints that have established a connection in a computer network.

SCTP LB test mean that Client can connect to Endpoints with SCTP Protocol. It can be useful to connect Telco 5G Control Traffic with cloud.

SCTP is used across various evolved packet core (EPC) signaling interfaces, such as N2, S1-MME, S6a/S6d, S13/S13’ and S9. A mobile network operator’s most common use cases for SCTP security are roaming security and radio access network (RAN) security. GTP Deployments also include roaming security and RAN security. The best practice is for you to configure both GTP and SCTP security when you have a roaming or a RAN security use case.

To know more LoxiLB SCTP 5G Use cases, reference these tech blogs that deploy 5G Core with LoxiLB SCTP

* https://futuredon.medium.com/5g-sctp-loadbalancer-using-loxilb-b525198a9103

In the full-NAT implementation of the LoxiLB operation, the source and destination IP addresses are rewritten to ensure that the traffic goes through the load balancer in both directions. The full-NAT mode makes it possible to connect to the VIP from the same subnet that the servers are on.

The following table depicts the IP addresses of the packets flowing between a client and LoxiLB, and between LoxiLB and a back-end server by using the full-NAT mode. No special default route using the LoxiLB box is required in the servers. Note that the full-NAT mode requires the administrator to set aside one IP address or a range of IP addresses to be used by LoxiLB as source addresses to communicate with the back-end servers. Assume that the addresses used belong to subnet C. In this scenario, LoxiLB behaves as a proxy.

![configuration](./assets/configuration.png)

LoxiLB was built with this in mind and it in this tutorial you will learn:

* How to configure **LoxiLB**: How to setup it and How to use loxi CLI.
* How to do a troubleshoot.
* How to test performance.

### Feedback

Do you see any bug, typo in the tutorial or you have some feedback for us?
Let us know on https://github.com/loxilb-io/loxilb or #loxilb slack channel linked on https://loxilb.io

### Contributed by:
contact@netlox.io

