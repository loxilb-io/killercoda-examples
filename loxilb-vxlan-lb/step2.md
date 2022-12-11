

we need to configure load-balancer rule inside loxilb docker as follows referencing [link](https://loxilb-io.github.io/loxilbdocs/perf/) :

```
docker exec -it llb2 bash
root@8b74b5ddc4d2:/# loxicmd create lb 88.88.88.88 --tcp=2020:8080 --endpoints=25.25.25.1:1,26.26.26.1:1,27.27.27.1:1
```


View the installed LoxiLB configuration follows referencing [link](https://loxilb-io.github.io/loxilbdocs/debugging/) :
```
docker exec -it loxilb bash
root@8b74b5ddc4d2:/# loxicmd get lb -o wide
root@8b74b5ddc4d2:/# loxicmd get conntrack
root@8b74b5ddc4d2:/# loxicmd get port
```
