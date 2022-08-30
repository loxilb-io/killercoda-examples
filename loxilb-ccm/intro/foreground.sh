echo waiting for init-background-script to finish
echo ====== It will tabke 5 - 10 minutes ======
echo '============= Build LoxiLB CLI ============'
sudo su root
git clone https://github.com/loxilb-io/loxicmd.git
cd loxicmd
go get .
make
sleep 3
echo Hello and welcome to this LoxiLB scenario!