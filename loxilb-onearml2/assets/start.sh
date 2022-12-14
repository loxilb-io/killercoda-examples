#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Spawning all hosts"
echo "#########################################"

spawn_docker_host --dock-type loxilb --dock-name llb1
spawn_docker_host --dock-type host --dock-name l2h1
spawn_docker_host --dock-type host --dock-name l2ep1
spawn_docker_host --dock-type host --dock-name l2ep2
spawn_docker_host --dock-type host --dock-name l2ep3

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


connect_docker_hosts l2h1 llb1
connect_docker_hosts l2ep1 llb1
connect_docker_hosts l2ep2 llb1
connect_docker_hosts l2ep3 llb1

sleep 5

#L2 config
config_docker_host --host1 l2h1 --host2 llb1 --ptype phy --addr 100.100.100.1/24 --gw 100.100.100.254
config_docker_host --host1 l2ep1 --host2 llb1 --ptype phy --addr 100.100.100.2/24 --gw 100.100.100.254
config_docker_host --host1 l2ep2 --host2 llb1 --ptype phy --addr 100.100.100.3/24 --gw 100.100.100.254
config_docker_host --host1 l2ep3 --host2 llb1 --ptype phy --addr 100.100.100.4/24 --gw 100.100.100.254
create_docker_host_vlan --host1 llb1 --host2 l2h1 --ptype untagged --id 100 --addr 100.100.100.254/24
create_docker_host_vlan --host1 llb1 --host2 l2ep1 --ptype untagged --id 100
create_docker_host_vlan --host1 llb1 --host2 l2ep2 --ptype untagged --id 100
create_docker_host_vlan --host1 llb1 --host2 l2ep3 --ptype untagged --id 100

$dexec llb1 bash -c 'for i in /proc/sys/net/ipv4/conf/*/rp_filter; do echo 0 > "$i"; done'

sleep 5

