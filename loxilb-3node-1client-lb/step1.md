
LoxiLB has been installed like described [here](https://loxilb-io.github.io/loxilbdocs/run/)

View the installed LoxiLB:
```
docker exec -it loxilb loxicmd help
```

## Check Topology
---

![diagram](./assets/topology.png)

Make sure to enable topolgoy configuration like this:

```
ip netns exec l3e1 ifconfig eth0
ip netns exec l3e2 ifconfig eth0
ip netns exec l3e3 ifconfig eth0
ip netns exec l3c1 ifconfig eth0
ip netns exec loxilb route -n
```

Check researchable like this:

```
ip netns exec loxilb ping 31.31.31.1 
ip netns exec loxilb ping 32.32.32.1 
ip netns exec loxilb ping 17.17.17.1 
ip netns exec loxilb ping 100.100.100.1 
```
