#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Configuring LoxiLB Mirror to Wireshark"
echo "#########################################"

$dexec llb1 loxicmd create mirror mirr-$1 --mirrorInfo="type:0,port:$3" --targetObject="attachement:1,mirrObjName:$2"
