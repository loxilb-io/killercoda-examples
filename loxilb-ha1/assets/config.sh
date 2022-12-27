#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB"
echo "#########################################"

##Create LB rule
create_lb_rule llb1 20.20.20.1 --tcp=2020:8080 --endpoints=11.11.11.3:1,11.11.11.4:1,11.11.11.5:1 --mode=fullnat
create_lb_rule llb2 20.20.20.1 --tcp=2020:8080 --endpoints=11.11.11.3:1,11.11.11.4:1,11.11.11.5:1 --mode=fullnat

echo "#########################################"
echo "keepalive will take few seconds to be UP and running with valid states"
echo "#########################################"
sleep 10
