#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB Basic TCP Policy"
echo "#########################################"

$dexec llb1 loxicmd create lb 20.20.20.1 --select=priority --tcp=2020:8080 --endpoints=31.31.31.1:40,32.32.32.1:40,33.33.33.1:20
