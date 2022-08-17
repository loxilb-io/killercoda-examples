echo waiting for init-background-script to finish
echo ====== It will tabke 5 - 10 minutes ======
while [ ! -f /tmp/background0 ]; do sleep 1; done
echo Hello and welcome to this LoxiLB scenario!