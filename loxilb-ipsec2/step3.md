

Validate LoxiLB LB over IPSeC Feature

```
cd ~/
sudo /bin/bash ./validation.sh
IPSEC-2
Ping lh1                ->       server1                        : [OK]
Ping lh1                ->       server2                        : [OK]
Ping lh2                ->       server1                        : [OK]
Ping lh2                ->       server2                        : [OK]
IPSec Tunnel Traffic [OK]
server1 UP
server2 UP
IPSEC-2 [OK]
```
