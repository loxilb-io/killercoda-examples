set -x # to test stderr output in /var/log/killercoda
echo starting... # to test stdout output in /var/log/killercoda

echo '============= Install LoxiLB Docker ============'
docker pull ghcr.io/loxilb-io/loxilb:latest
docker run -u root --cap-add SYS_ADMIN   --restart unless-stopped --privileged -dit -v /dev/log:/dev/log --name loxilb ghcr.io/loxilb-io/loxilb:latest
apt install -y net-tools
sleep 3

echo '============= Make 3 Endpoints, 1 Client and 1 LoxiLB host ============'
docker=$1
HADD="sudo ip netns add "
LBHCMD="sudo ip netns exec loxilb "
HCMD="sudo ip netns exec "

id=`docker ps -f name=loxilb | cut  -d " "  -f 1 | grep -iv  "CONTAINER"`
echo $id
pid=`docker inspect -f '{{.State.Pid}}' $id`
if [ ! -f /var/run/netns/loxilb ]; then
  sudo touch /var/run/netns/loxilb
  sudo mount -o bind /proc/$pid/ns/net /var/run/netns/loxilb
fi

$HADD l3e1
$HADD l3e2
$HADD l3e3
$HADD l3c1
sleep 1


echo '============= Configure load-balancer end-point l3e1 ============'
sudo ip -n loxilb link add enp1 type veth peer name eth0 netns l3e1
sudo ip -n loxilb link set enp1 mtu 9000 up
sudo ip -n l3e1 link set eth0 mtu 7000 up
$LBHCMD ip addr add 31.31.31.254/24 dev enp1
$HCMD l3e1 ifconfig eth0 31.31.31.1/24 up
$HCMD l3e1 ip route add default via 31.31.31.254
$HCMD l3e1 ifconfig lo up
sleep 1


echo '============= Configure load-balancer end-point l3e2 ============'
sudo ip -n loxilb link add enp2 type veth peer name eth0 netns l3e2
sudo ip -n loxilb link set enp2 mtu 9000 up
sudo ip -n l3e2 link set eth0 mtu 7000 up
$LBHCMD ip addr add 32.32.32.254/24 dev enp2
$HCMD l3e2 ifconfig eth0 32.32.32.1/24 up
$HCMD l3e2 ip route add default via 32.32.32.254
$HCMD l3e2 ifconfig lo up
sleep 1

echo '============= Configure load-balancer end-point l3e3 ============'
sudo ip -n loxilb link add enp3 type veth peer name eth0 netns l3e3
sudo ip -n loxilb link set enp3 mtu 9000 up
sudo ip -n l3e3 link set eth0 mtu 7000 up
$LBHCMD ip addr add 17.17.17.254/24 dev enp3
$HCMD l3e3 ifconfig eth0 17.17.17.1/24 up
$HCMD l3e3 ip route add default via 17.17.17.254
$HCMD l3e3 lo up
sleep 1

echo '============= Configure load-balancer end-point l3c1 ============'
sudo ip -n loxilb link add enp4 type veth peer name eth0 netns l3c1
sudo ip -n loxilb link set enp4 mtu 9000 up
sudo ip -n l3c1 link set eth0 mtu 7000 up
$LBHCMD ip addr add 100.100.100.254/24 dev enp4
$HCMD l3c1 ifconfig eth0 100.100.100.1/24 up
$HCMD l3c1 ip route add default via 100.100.100.254
$HCMD l3c1 lo up
sleep 1

echo '============= install wrk(http traffic generator) Tool ============'
sudo apt-get install build-essential libssl-dev git -y 
git clone https://github.com/wg/wrk.git wrk 
cd wrk 
sudo make 
sudo cp wrk /usr/local/bin 
cd ../

echo '============= install http echo server ============'
cd ~/
go build server.go
echo Hello and welcome to LoxiLB sample scenario!
sleep 3

echo done > /tmp/background0
