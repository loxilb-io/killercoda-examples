
LoxiLB has been installed like described [here](https://loxilb-io.github.io/loxilbdocs/run/)

View the installed LoxiLB:
```
docker exec -it loxilb loxicmd help
```

## Check Topology
---

Check researchable like this:

```
ip netns exec loxilb ping 31.31.31.1 
ip netns exec loxilb ping 32.32.32.1 
ip netns exec loxilb ping 33.33.33.1 
ip netns exec loxilb ping 10.10.10.1 
```

