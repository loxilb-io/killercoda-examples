## Check Topology
---

![diagram](./assets/topology.png)


Check researchable like this:

```
ip netns exec loxilb ping 1.1.1.2
ip netns exec loxilb ping 172.18.0.2
ip netns exec loxilb ping 172.18.0.3
```
