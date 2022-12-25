#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configure LoxiLB"
echo "#########################################"

$dexec llb1 loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1 --inatimeout=30
