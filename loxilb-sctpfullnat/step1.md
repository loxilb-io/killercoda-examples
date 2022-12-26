
LoxiLB has been installed like described [here](https://loxilb-io.github.io/loxilbdocs/run/)

View the installed LoxiLB:
```
docker exec -it llb1 loxicmd help
```

## Check Topology
---

![diagram](./assets/topology.png)

Make sure to enable topolgoy configuration like this:

```
ip netns exec ep1 ifconfig eth0
ip netns exec ep2 ifconfig eth0
ip netns exec c1 ifconfig eth0
ip netns exec llb1 route -n
```

Check researchable like this:

```
ip netns exec llb1 ping 10.0.3.10
ip netns exec llb1 ping 10.0.3.11
ip netns exec llb1 ping 10.0.3.71
```
