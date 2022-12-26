#!/bin/bash
source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB"
echo "#########################################"

##Create LB rule
$dexec llb2 loxicmd create lb 88.88.88.88 --tcp=2020:8080 --endpoints=25.25.25.1:1,26.26.26.1:1,27.27.27.1:1
