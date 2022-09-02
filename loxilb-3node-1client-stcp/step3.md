Run STCP server on 3 endpoint nodes (`31.31.31.1`, `32.32.32.1`, `33.33.33.1`)
```
source ./common.sh

$hexec l3ep1 ./server server1 &
$hexec l3ep2 ./server server2 &
$hexec l3ep3 ./server server3 &
```

Verify whether all SCTP servers are successfully up
```
cat > verify_sctp_server.sh <<EOF
servArr=( "server1" "server2" "server3" )
ep=( "31.31.31.1" "32.32.32.1" "33.33.33.1" )
j=0
waitCount=0
while [ $j -le 2 ]
do
    res=$($hexec l3h1 ./client ${ep[j]} 8080)
    echo $res
    if [[ $res == "${servArr[j]}" ]]
    then
        echo "$res UP"
        j=$(( $j + 1 ))
    else
        echo "Waiting for ${servArr[j]}(${ep[j]})"
        waitCount=$(( $waitCount + 1 ))
        if [[ $waitCount == 10 ]];
        then
            echo "All Servers are not UP"
            exit 1
        fi

    fi
    sleep 1
done
EOF
```
Run script :
```
chmod 777 verify_sctp_server.sh
./verify_sctp_server.sh
```

Check whether SCP client can reach all SCTP servers successfully.

```
cat > verify_sctp_client.sh <<
for i in {1..4}
do
for j in {0..2}
do
    res=$($hexec l3h1 ./client 20.20.20.1 2020)
    echo -e $res
    if [[ $res != "${servArr[j]}" ]]
    then
        code=1
    fi
    sleep 1
done
done
if [[ $code == 0 ]]
then
    echo [OK]
else
    echo [FAILED]
fi
EOF
```

Run SCTP Client on client following:
```
chmod 777 verify_sctp_client.sh
./verify_sctp_client.sh
```

if you can see `[OK]`, It's success. Congraturation !
