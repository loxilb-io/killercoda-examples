#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB"
echo "#########################################"

$dexec llb1 loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=100.100.100.2:1,100.100.100.3:1,100.100.100.4:1 --mode=onearm

#Need more time for lb end-point health check
sleep 40
