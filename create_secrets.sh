#!/bin/bash

VALIDATORS_MNEMONIC=`docker exec  kintsugi_app_1 eth2-val-tools mnemonic && echo`
WITHDRAWALS_MNEMONIC=`docker exec  kintsugi_app_1 eth2-val-tools mnemonic && echo`
echo $VALIDATORS_MNEMONIC
echo $WITHDRAWALS_MNEMONIC
ADDRESS_AND_PRIVATE_ETH1_KEY=`docker exec  kintsugi_app_1 node /app/makewallet.js`
echo $ADDRESS_AND_PRIVATE_ETH1_KEY
ETH1_FROM_ADDR=`echo $ADDRESS_AND_PRIVATE_ETH1_KEY | cut -d' ' -f2`
ETH1_FROM_PRIV=`echo $ADDRESS_AND_PRIVATE_ETH1_KEY | cut -d' ' -f4`
#sudo chmod -R a+rw data/app
cat <<EOF > data/app/secrets.env
# sets the deposit amount to use
DEPOSIT_AMOUNT=32000000000
# sets the genesis fork version of the testnet
FORK_VERSION="0x60000069"
# sets the mnemonic to derive the keys from
VALIDATORS_MNEMONIC="${VALIDATORS_MNEMONIC}"
# sets the mnemonic for withdrawal credentials
WITHDRAWALS_MNEMONIC="${WITHDRAWALS_MNEMONIC}"
# temporary location to store the deposit data
DEPOSIT_DATAS_FILE_LOCATION="/tmp/deposit_data.txt"
# sets the deposit contract address
DEPOSIT_CONTRACT_ADDRESS="0x4242424242424242424242424242424242424242"
# sets the eth1 address from which the transaction will be made
ETH1_FROM_ADDR="${ETH1_FROM_ADDR}"
# sets the eth1 private key used to sign the transaction
ETH1_FROM_PRIV="${ETH1_FROM_PRIV}"
# forces the deposit since the deposit contract will not be recognized by the tool
FORCE_DEPOSIT=true
# sets an RPC endpoint to submit the transaction to
ETH1_RPC=https://rpc.kintsugi.themerge.dev
EOF

