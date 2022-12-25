#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configure LoxiLB NAT64 Policy"
echo "#########################################"

$dexec llb1 loxicmd create lb 2001::1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1
