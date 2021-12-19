#!/bin/bash
if test -f /var/lib/goethereum/initialized; then
    echo "initialized"
else
    /usr/local/bin/geth init /home/builder/consensus-deployment-ansible/kintsugi-testnet/custom_config_data/genesis.json --datadir /var/lib/goethereum
    touch /var/lib/goethereum/initialized
fi
/usr/local/bin/geth --cache 2048 --syncmode=full --http --datadir /var/lib/goethereum --metrics --metrics.expensive --pprof --networkid=1337702 --catalyst  --http.api="engine,eth,web3,net,debug" --http.corsdomain "*" --http.addr "0.0.0.0" --http.vhosts="*"

