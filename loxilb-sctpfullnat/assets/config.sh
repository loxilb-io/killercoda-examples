#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB"
echo "#########################################"

##Create LB rule
$dexec llb1 loxicmd create lb 20.20.20.1 --sctp=38412:38412 --endpoints=10.0.3.10:1,10.0.3.11:1 --mode=fullnat

$dexec llb1 bash -c 'for i in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 0 > "$i"; done'

# keepalive will take few seconds to be UP and running with valid states
sleep 10
