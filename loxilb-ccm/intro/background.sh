set -x # to test stderr output in /var/log/killercoda
echo starting... # to test stdout output in /var/log/killercoda
echo '============= Install Kubernetes with Kind Tool ============'
sudo su root
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sleep 1

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
sleep 1
cat > kind-config.yaml <<EOF
# three node (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
EOF
kind create cluster --name k8s-playground --config kind-config.yaml
sleep 1

echo '============= Build iproute2 ============'
apt install -y clang llvm libelf-dev gcc-multilib libpcap-dev vim net-tools linux-tools-$(uname -r) elfutils dwarves git libbsd-dev bridge-utils wget unzip build-essential bison flex iproute2
git clone https://github.com/loxilb-io/iproute2.git
cd iproute2
cd libbpf/src/
mkdir build
DESTDIR=build make install
cd ../../
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:`pwd`/libbpf/src/
LIBBPF_FORCE=on LIBBPF_DIR=`pwd`/libbpf/src/build ./configure
make
sudo cp -f tc/tc /usr/local/sbin/ntc
cd ~
sleep 3
echo '============= Build LoxiLB ============'
git clone https://github.com/loxilb-io/loxilb.git
cd loxilb
./ebpf/utils/mkllb_bpffs.sh
make
cd ebpf/libbpf/src
sudo make install
cd ~
sleep 3
echo '============= Build LoxiLB CLI ============'
git clone https://github.com/loxilb-io/loxicmd.git
cd loxicmd
go get .
make

sleep 60
echo done > /tmp/background0
