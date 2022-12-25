#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configure LoxiLB NAT66 LB Policy"
echo "#########################################"

$dexec llb1 loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1
$dexec llb1 loxicmd create lb  2001::1 --tcp=2020:8080 --endpoints=4ffe::1:1,5ffe::1:1,6ffe::1:1
