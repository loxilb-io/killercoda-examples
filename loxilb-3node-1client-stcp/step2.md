

we need to configure load-balancer SCTP rule inside loxilb docker as follows referencing [link](https://loxilb-io.github.io/loxilbdocs/perf/) :

```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# loxicmd create lb 20.20.20.1 --sctp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1
```


View the installed LoxiLB configuration follows referencing [link](https://loxilb-io.github.io/loxilbdocs/debugging/) :
```
docker exec -it llb1 bash
root@8b74b5ddc4d2:/# loxicmd get lb -o wide
root@8b74b5ddc4d2:/# loxicmd get conntrack
root@8b74b5ddc4d2:/# loxicmd get port
```
