

Validate LoxiLB LB Over IPSec for VPN Feature

```
cd ~/
sudo /bin/bash ./validation.sh
IPSEC-1
Ping lh1                ->       server1                        : [OK]
Ping lh1                ->       server2                        : [OK]
Ping lh2                ->       server1                        : [OK]
Ping lh2                ->       server2                        : [OK]
IPSec Tunnel Traffic [OK]
server1 UP
server2 UP
IPSEC-1 [OK]
```

Summary `validation.sh` file :


