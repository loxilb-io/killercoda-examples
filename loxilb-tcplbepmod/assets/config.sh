#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB "
echo "#########################################"

$dexec llb1 loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=31.31.31.1:1
