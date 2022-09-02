set -x # to test stderr output in /var/log/killercoda
echo starting... # to test stdout output in /var/log/killercoda

echo '============= Make 3 Endpoints, 1 Client and 1 LoxiLB host ============'
chmod 777 config.sh
chmod 777 common.sh
./config.sh

echo done > /tmp/background0
