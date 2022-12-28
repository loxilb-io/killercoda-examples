#!/bin/bash

source ./common.sh

echo "#########################################"
echo "Delete LoxiLB Mirror with Name"
echo "#########################################"

$dexec llb1 loxicmd delete mirror mirr-$1
