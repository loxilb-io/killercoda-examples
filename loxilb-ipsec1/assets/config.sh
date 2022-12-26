#!/bin/bash
source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB"
echo "#########################################"

$dexec llb2 loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=25.25.25.1:1,26.26.26.1:1
