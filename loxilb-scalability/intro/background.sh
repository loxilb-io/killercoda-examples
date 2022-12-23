set -x # to test stderr output in /var/log/killercoda
echo starting... # to test stdout output in /var/log/killercoda

echo '============= Install LoxiLB and provision topollogy ============'
echo '============= Make 3 Endpoints, 1 Client and 1 LoxiLB ============'

cd ~/

sudo sh ./config.sh

echo done > /tmp/background0
