
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
ip netns exec l3ep1 ifconfig eth0
ip netns exec l3ep2 ifconfig eth0
ip netns exec l3ep3 ifconfig eth0
ip netns exec l3h1 ifconfig eth0
ip netns exec llb1 route -n
```

Check researchable like this:

```
ip netns exec llb1 ping6 3ffe::1 -c 3
ip netns exec llb1 ping6 4ffe::1 -c 3
ip netns exec llb1 ping6 5ffe::1 -c 3
ip netns exec llb1 ping6 6ffe::1 -c 3
```
