#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Spawning all hosts"
echo "#########################################"

spawn_docker_host --dock-type loxilb --dock-name llb1 --with-bgp yes --bgp-config /root/llb1_gobgp_config --with-ka yes --ka-config /root/keepalived_config
spawn_docker_host --dock-type loxilb --dock-name llb2 --with-bgp yes --bgp-config /root/llb2_gobgp_config --with-ka yes --ka-config /root/keepalived_config
spawn_docker_host --dock-type host --dock-name ep1
spawn_docker_host --dock-type host --dock-name ep2
spawn_docker_host --dock-type host --dock-name ep3
spawn_docker_host --dock-type host --dock-name r1 --with-bgp yes --bgp-config /root/quagga_config
spawn_docker_host --dock-type host --dock-name r2
spawn_docker_host --dock-type host --dock-name user

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


connect_docker_hosts user r1
connect_docker_hosts r1 llb1
connect_docker_hosts r1 llb2
connect_docker_hosts llb1 r2
connect_docker_hosts llb2 r2
connect_docker_hosts r2 ep1
connect_docker_hosts r2 ep2
connect_docker_hosts r2 ep3

#node1 config
config_docker_host --host1 user --host2 r1 --ptype phy --addr 1.1.1.1/24 --gw 1.1.1.254
config_docker_host --host1 r1 --host2 user --ptype phy --addr 1.1.1.254/24

create_docker_host_vlan --host1 r1 --host2 llb1 --id 11 --ptype untagged
create_docker_host_vlan --host1 llb1 --host2 r1 --id 11 --ptype untagged

config_docker_host --host1 r1 --host2 llb1 --ptype vlan --id 11 --addr 11.11.11.254/24
config_docker_host --host1 llb1 --host2 r1 --ptype vlan --id 11 --addr 11.11.11.1/24

create_docker_host_vlan --host1 r1 --host2 llb2 --id 11 --ptype untagged
create_docker_host_vlan --host1 llb2 --host2 r1 --id 11 --ptype untagged
config_docker_host --host1 llb2 --host2 r1 --ptype vlan --id 11 --addr 11.11.11.2/24


create_docker_host_vlan --host1 llb1 --host2 r2 --id 10 --ptype untagged
config_docker_host --host1 llb1 --host2 r2 --ptype vlan --id 10 --addr 10.10.10.1/24
create_docker_host_vlan --host1 llb2 --host2 r2 --id 10 --ptype untagged
config_docker_host --host1 llb2 --host2 r2 --ptype vlan --id 10 --addr 10.10.10.2/24

create_docker_host_vlan --host1 r2 --host2 llb1 --id 10 --ptype untagged
create_docker_host_vlan --host1 r2 --host2 llb2 --id 10 --ptype untagged
create_docker_host_vlan --host1 r2 --host2 ep1 --id 10 --ptype untagged
create_docker_host_vlan --host1 r2 --host2 ep2 --id 10 --ptype untagged
create_docker_host_vlan --host1 r2 --host2 ep3 --id 10 --ptype untagged
config_docker_host --host1 r2 --host2 llb1 --ptype vlan --id 10 --addr 10.10.10.254/24

create_docker_host_vlan --host1 ep1 --host2 r2 --id 10 --ptype untagged
config_docker_host --host1 ep1 --host2 r2 --ptype vlan --id 10 --addr 10.10.10.3/24 --gw 10.10.10.254

create_docker_host_vlan --host1 ep2 --host2 r2 --id 10 --ptype untagged
config_docker_host --host1 ep2 --host2 r2 --ptype vlan --id 10 --addr 10.10.10.4/24 --gw 10.10.10.254

create_docker_host_vlan --host1 ep3 --host2 r2 --id 10 --ptype untagged
config_docker_host --host1 ep3 --host2 r2 --ptype vlan --id 10 --addr 10.10.10.5/24 --gw 10.10.10.254


##Pod networks
add_route llb1 1.1.1.0/24 11.11.11.254
add_route llb2 1.1.1.0/24 11.11.11.254

