#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Spawning all hosts"
echo "#########################################"

spawn_docker_host --dock-type loxilb --dock-name llb1
spawn_docker_host --dock-type loxilb --dock-name llb2
spawn_docker_host --dock-type host --dock-name ue1
spawn_docker_host --dock-type host --dock-name ue2
spawn_docker_host --dock-type host --dock-name l3e1
spawn_docker_host --dock-type host --dock-name l3e2
spawn_docker_host --dock-type host --dock-name l3e3

echo "#########################################"
echo "Connecting and configuring  hosts"
echo "#########################################"


connect_docker_hosts ue1 llb1
connect_docker_hosts ue2 llb1
connect_docker_hosts llb1 llb2

config_docker_host --host1 ue1 --host2 llb1 --ptype phy --addr 32.32.32.1/24 --gw 32.32.32.254
config_docker_host --host1 llb1 --host2 ue1 --ptype phy --addr 32.32.32.254/24
config_docker_host --host1 ue2 --host2 llb1 --ptype phy --addr 31.31.31.1/24 --gw 31.31.31.254
config_docker_host --host1 llb1 --host2 ue2 --ptype phy --addr 31.31.31.254/24
config_docker_host --host1 llb1 --host2 llb2 --ptype phy --addr 10.10.10.59/24
config_docker_host --host1 llb2 --host2 llb1 --ptype phy --addr 10.10.10.56/24

connect_docker_hosts l3e1 llb2
connect_docker_hosts l3e2 llb2
connect_docker_hosts l3e3 llb2

config_docker_host --host1 l3e1 --host2 llb2 --ptype phy --addr 25.25.25.1/24 --gw 25.25.25.254
config_docker_host --host1 llb2 --host2 l3e1 --ptype phy --addr 25.25.25.254/24
config_docker_host --host1 l3e2 --host2 llb2 --ptype phy --addr 26.26.26.1/24 --gw 26.26.26.254
config_docker_host --host1 llb2 --host2 l3e2 --ptype phy --addr 26.26.26.254/24
config_docker_host --host1 l3e3 --host2 llb2 --ptype phy --addr 27.27.27.1/24 --gw 27.27.27.254
config_docker_host --host1 llb2 --host2 l3e3 --ptype phy --addr 27.27.27.254/24

$hexec llb1 ip route add 25.25.25.0/24 via 10.10.10.56 dev ellb1llb2
$hexec llb1 ip route add 26.26.26.0/24 via 10.10.10.56 dev ellb1llb2
$hexec llb1 ip route add 27.27.27.0/24 via 10.10.10.56 dev ellb1llb2
$hexec llb1 ip route add 88.88.88.8/32 via 10.10.10.56 dev ellb1llb2

$hexec llb2 ip route add 31.31.31.0/24 via 10.10.10.59 dev ellb2llb1
$hexec llb2 ip route add 32.32.32.0/24 via 10.10.10.59 dev ellb2llb1

