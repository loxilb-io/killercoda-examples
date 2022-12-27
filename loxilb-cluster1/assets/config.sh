#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB"
echo "#########################################"

##Create LB rule
create_lb_rule llb1 20.20.20.1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1 --mode=fullnat --bgp
create_lb_rule llb2 20.20.20.1 --tcp=2020:8080 --endpoints=31.31.31.1:1,32.32.32.1:1,33.33.33.1:1 --mode=fullnat --bgp

# keepalive will take few seconds to be UP and running with valid states
echo "#########################################"
echo "keepalive will take few seconds (about 60 seconds) to be UP and running with valid states"
echo "#########################################"
sleep 60
