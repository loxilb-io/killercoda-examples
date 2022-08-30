#!/bin/bash
cd /root
git clone https://github.com/loxilb-io/loxilb  /root/loxilb-io/loxilb/ && cd /root/loxilb-io/loxilb/ && ./ebpf/utils/mkllb_bpffs.sh && go get . && make && cp ebpf/utils/mkllb_bpffs.sh /usr/local/sbin/mkllb_bpffs && cp api/certification/* /opt/loxilb/cert/ && cd ebpf/libbpf/src && sudo make install && cd ~
