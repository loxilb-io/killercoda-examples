Compile & Build LoxiLB CLI from source codes

```
cd ~
./loxilb_cli_install.sh
```

Now, it's time to run LoxiLB.

Open new tab and runt LoxiLB with following command:

```
ip netns exec loxilb bash
cd /root/loxilb-io/loxilb
./loxilb --host=0.0.0.0
```

After that, go back to previous terminal for operation !
