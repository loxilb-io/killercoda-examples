set -x # to test stderr output in /var/log/killercoda
echo starting... # to test stdout output in /var/log/killercoda

echo '============= Install LoxiLB and provision topollogy ============'
echo '============= Make 3 Endpoints, 1 Client and 1 LoxiLB ============'
apt install -y net-tools socat iperf nodejs netcat libsctp-dev jq
sleep 3

echo '============= Install Wireshark Server for Analytics ============'
docker run -d \
  --name=wireshark \
  --net=host \
  --cap-add=NET_ADMIN \
  --security-opt seccomp=unconfined `#optional` \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 3000:3000 `#optional` \
  --restart unless-stopped \
  lscr.io/linuxserver/wireshark:latest

cd ~/
sudo /bin/bash ./start.sh

echo done > /tmp/background0
