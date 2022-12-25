

Run the scalability test

```
cd ~/
./validation.sah
```

View the installed LoxiLB configuration follows referencing [link](https://loxilb-io.github.io/loxilbdocs/debugging/) :
```
docker exec -it loxilb bash
root@8b74b5ddc4d2:/# loxicmd get lb -o wide
root@8b74b5ddc4d2:/# loxicmd get conntrack
root@8b74b5ddc4d2:/# loxicmd get port
```
