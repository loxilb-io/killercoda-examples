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
kind create cluster --name k8s-playground1 --config kind-config.yaml
sleep 1
kind create cluster --name k8s-playground2 --config kind-config.yaml
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
wget https://github.com/osrg/gobgp/releases/download/v3.5.0/gobgp_3.5.0_linux_amd64.tar.gz && tar -xzf gobgp_3.5.0_linux_amd64.tar.gz &&  mv gobgp* /usr/sbin/ && rm LICENSE README.md
mkdir -p /opt/loxilb
mkdir -p /opt/loxilb/cert/
mkdir -p /root/loxilb-io/loxilb/

chmod 777 chmod loxilb_cli_install.sh
chmod 777 chmod loxilb_install.sh

echo '============= Build basic network topology ============'

ip netns add loxilb
ip netns add client
sudo ip -n loxilb link add enp1 type veth peer name loxilb-in netns 1
sudo ip -n loxilb link add enp2 type veth peer name enp1 netns client
sudo ip -n loxilb link set enp1 mtu 9000 up
sudo ip -n loxilb link set enp2 mtu 9000 up
sudo ip -n client link set enp1 mtu 9000 up
sudo ifconfig loxilb-in 0.0.0.0 up
sudo ip netns exec loxilb ip addr add 172.18.0.254/24 dev enp1
sudo ip netns exec loxilb ip addr add 1.1.1.254/24 dev enp2
sudo ip netns exec loxilb ifconfig lo 127.0.0.1 up
sudo ip netns exec client ip addr add 1.1.1.2/24 dev enp1
sudo ip netns exec client ifconfig lo 127.0.0.1 up
sudo ip netns exec client route add -net 123.123.123.0 netmask 255.255.255.0 gw 1.1.1.254
docker exec -it k8s-playground1-worker ip route add 1.1.1.0/24 via 172.18.0.254 dev eth0
docker exec -it k8s-playground1-control-plane ip route add 1.1.1.0/24 via 172.18.0.254 dev eth0
docker exec -it k8s-playground2-worker ip route add 1.1.1.0/24 via 172.18.0.254 dev eth0
docker exec -it k8s-playground2-control-plane ip route add 1.1.1.0/24 via 172.18.0.254 dev eth0

bridge_name=`brctl show | grep br- | awk '{ print $1 }'`
brctl addif $bridge_name loxilb-in

echo done > /tmp/background0