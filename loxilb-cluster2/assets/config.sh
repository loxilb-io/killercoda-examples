#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB"
echo "#########################################"

##Create LB rule
create_lb_rule llb1 20.20.20.1 --tcp=2020:8080 --endpoints=10.10.10.3:1,10.10.10.4:1,10.10.10.5:1 --mode=onearm --bgp
create_lb_rule llb2 20.20.20.1 --tcp=2020:8080 --endpoints=10.10.10.3:1,10.10.10.4:1,10.10.10.5:1 --mode=onearm --bgp

create_lb_rule llb1 20.20.20.1 --sctp=2020:8080 --endpoints=10.10.10.3:1,10.10.10.4:1,10.10.10.5:1 --mode=onearm --bgp
create_lb_rule llb2 20.20.20.1 --sctp=2020:8080 --endpoints=10.10.10.3:1,10.10.10.4:1,10.10.10.5:1 --mode=onearm --bgp

# keepalive will take few seconds to be UP and running with valid states
echo "#########################################"
echo "keepalive will take few seconds(about 40 seconds) to be UP and running with valid states"
echo "#########################################"
sleep 40
