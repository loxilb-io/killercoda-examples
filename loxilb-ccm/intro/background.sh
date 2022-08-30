set -x # to test stderr output in /var/log/killercoda
echo starting... # to test stdout output in /var/log/killercoda
echo '============= Install Kubernetes with Kind Tool ============'
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
EOF
kind create cluster --name k8s-playground --config kind-config.yaml
sleep 1

echo '============= Install LoxiLB Docker ============'
docker pull ghcr.io/loxilb-io/loxilb:latest
docker run -u root --cap-add SYS_ADMIN --net=kind  --restart unless-stopped --privileged -dit -v /dev/log:/dev/log --name loxilb ghcr.io/loxilb-io/loxilb:latest --host=0.0.0.0
apt install -y net-tools
sleep 3

echo '============= Make Endpoints, Client and 1 LoxiLB host ============'
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

echo done > /tmp/background0
