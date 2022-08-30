#!/bin/bash
cd /root
git clone https://github.com/loxilb-io/loxilb  /root/loxilb-io/loxilb/ && cd /root/loxilb-io/loxilb/ && go get . && make && cp ebpf/utils/mkllb_bpffs.sh /usr/local/sbin/mkllb_bpffs && cp api/certification/* /opt/loxilb/cert/ && cd ~
