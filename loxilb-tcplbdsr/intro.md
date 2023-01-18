#  Achieving LoxiLB IPv4 TCP Load Balancing with DSR(Direct Server Return) Test

Welcome to the tutorial where you learn how to configure LoxiLB.

On a serious note, we will look into how to use LoxiLB for DSR LB test. 

`DSR` is an implementation of asymmetric network load distribution in load balanced systems, meaning that the request and response traffic use a different network path.

The use of different network paths helps avoid extra hops and reduces the latency by which not only speeds up the response time between the client and the service but also removes some extra load from the load balancer. 

Using DSR is a transparent way to achieve increased network performance for your applications with little to no infrastructure changes.

While DSR will improve your application’s network performance, there are a couple of things to keep in mind when enabling DSR:

* Persistence is limited to source IP or destination IP (no cookie persistence)
* SSL offloading on the load balancer is not going work as they need to see both inbound and outbound traffic.
* There might be some ARP issues with some operating systems

LoxiLB was built with this in mind and it in this tutorial you will learn:

* How to configure **LoxiLB**
* How to do a troubleshoot.
* How to test performance.

### Feedback

Do you see any bug, typo in the tutorial or you have some feedback for us?
Let us know on https://github.com/loxilb-io/loxilb or #loxilb slack channel linked on https://loxilb.io

### Contributed by:
contact@netlox.io

