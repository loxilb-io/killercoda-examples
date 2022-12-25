#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Spawning LoxiLB TCP LB with mark"
echo "#########################################"

$dexec llb1 loxicmd create lb 20.20.20.1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1 --mark=10
$dexec llb1 loxicmd create firewall --firewallRule="sourceIP:10.10.10.1/32,preference:200" --allow --setmark=10
