#!/bin/bash
cd /root
git clone https://github.com/loxilb-io/loxicmd.git && cd loxicmd && go get . && make && cp ./loxicmd /usr/local/sbin/loxicmd && cd ~ && rm -fr loxicmd
