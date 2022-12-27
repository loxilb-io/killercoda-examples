#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configurin LoxiLB"
echo "#########################################"

##llb1 config
#ue1
$dexec llb1 loxicmd create session user1 88.88.88.88 --accessNetworkTunnel 1:10.10.10.56 --coreNetworkTunnel=1:10.10.10.59
 
$dexec llb1 loxicmd create sessionulcl user1 --ulclArgs=11:32.32.32.1
 
#ue2
$dexec llb1 loxicmd create session user2 88.88.88.88 --accessNetworkTunnel 2:10.10.10.56 --coreNetworkTunnel=2:10.10.10.59
 
$dexec llb1 loxicmd create sessionulcl user2 --ulclArgs=12:31.31.31.1

##llb2 config
#ue1
echo "#########################################"
echo "UE1(32.32.32.1) Tunnel Matching Fields Configuration"
echo " - Tunnel Source IP               : 10.10.10.59"
echo " - Tunnel Destination IP          : 10.10.10.56"
echo " - Uplink GTP TEID                : 1"
echo " - Downlink GTP TEID              : 1"
echo " - QFI (QoS Flow Identifier)      : 11"
echo " - LB VIP(Virtual IP) & Port      : 88.88.88.88:2020"
echo " - UE1 IP                         : 32.32.32.1"
echo "#########################################"

$dexec llb2 loxicmd create session user1 32.32.32.1 --accessNetworkTunnel 1:10.10.10.59 --coreNetworkTunnel=1:10.10.10.56
 

$dexec llb2 loxicmd create sessionulcl user1 --ulclArgs=11:88.88.88.88

#ue2
echo "#########################################"
echo "UE2(31.31.31.1) Tunnel Mathcing Fields Configuration"
echo " - Tunnel Source IP               : 10.10.10.59"
echo " - Tunnel Destination IP          : 10.10.10.56"
echo " - Uplink GTP TEID                : 2"
echo " - Downlink GTP TEID              : 2"
echo " - QFI (QoS Flow Identifier)      : 12"
echo " - LB VIP(Virtual IP) & Port      : 88.88.88.88:2020"
echo " - UE1 IP                         : 31.31.31.1"
echo "#########################################"
$dexec llb2 loxicmd create session user2 31.31.31.1 --accessNetworkTunnel 2:10.10.10.59 --coreNetworkTunnel=2:10.10.10.56
 
$dexec llb2 loxicmd create sessionulcl user2 --ulclArgs=12:88.88.88.88

echo "#########################################"
echo "llb2 LB Rule Configuration"
echo "#########################################"

##Create LB rule
$dexec llb2 loxicmd create lb 88.88.88.88 --sctp=2020:8080 --endpoints=25.25.25.1:1,26.26.26.1:1,27.27.27.1:1
