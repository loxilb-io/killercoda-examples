#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Spawning all hosts"
echo "#########################################"

spawn_docker_host --dock-type loxilb --dock-name llb1 
spawn_docker_host --dock-type host --dock-name ep1
spawn_docker_host --dock-type host --dock-name ep2
spawn_docker_host --dock-type host --dock-name c1
spawn_docker_host --dock-type host --dock-name br1

echo "#########################################"
echo "Spawning Wireshark Node for Analytics"
echo "#########################################"
docker run -d \
  --name=wireshark \
  --net=host \
  --cap-add=NET_ADMIN \
  --security-opt seccomp=unconfined `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 3000:3000 `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/wireshark:latest

# spawn_docker_host --dock-type wireshark --dock-name wireshark

echo "#########################################"
echo "Connecting and configuring  hosts"
echo "#########################################"


connect_docker_hosts c1 br1
connect_docker_hosts llb1 br1
connect_docker_hosts ep1  br1
connect_docker_hosts ep2  br1

config_docker_host --host1 llb1 --host2 br1 --ptype phy --addr 10.0.3.17/24
config_docker_host --host1 ep1 --host2 br1 --ptype phy --addr 10.0.3.10/24 --gw 10.0.3.17
config_docker_host --host1 ep2 --host2 br1 --ptype phy --addr 10.0.3.11/24 --gw 10.0.3.17
config_docker_host --host1 c1 --host2 br1 --ptype phy --addr 10.0.3.71/24 --gw 10.0.3.17

sleep 1

create_docker_host_cnbridge --host1 br1 --host2 llb1
create_docker_host_cnbridge --host1 br1 --host2 ep1
create_docker_host_cnbridge --host1 br1 --host2 ep2
create_docker_host_cnbridge --host1 br1 --host2 c1

