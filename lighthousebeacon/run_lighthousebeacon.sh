#!/bin/bash

if test -f /var/lib/lighthouse/lighthousebeaconinitialized; then
    echo "initialized"
else
    cp -r /home/builder/consensus-deployment-ansible/kintsugi-testnet /var/lib/lighthouse
    touch /var/lib/lighthouse/lighthousebeaconinitialized
fi
#/usr/local/bin/lighthouse bn --spec mainnet --datadir /var/lib/lighthouse --eth1 --http --http-allow-sync-stalled --merge --execution-endpoints http://geth:8545 --metrics --boot-nodes="enr:-Iq4QKuNB_wHmWon7hv5HntHiSsyE1a6cUTK1aT7xDSU_hNTLW3R4mowUboCsqYoh1kN9v3ZoSu_WuvW9Aw0tQ0Dxv6GAXxQ7Nv5gmlkgnY0gmlwhLKAlv6Jc2VjcDI1NmsxoQK6S-Cii_KmfFdUJL2TANL3ksaKUnNXvTCv1tLwXs0QgIN1ZHCCIyk" --testnet-dir /var/lib/lighthouse/kintsugi -testnet/custom_config_data  --eth1-endpoints http://geth:8545 --http-address "0.0.0.0"
/usr/local/bin/lighthouse bn --spec mainnet --datadir /var/lib/lighthouse --staking  --http-allow-sync-stalled --merge --execution-endpoints http://geth:8545 --metrics --validator-monitor-auto --boot-nodes="enr:-Iq4QKuNB_wHmWon7hv5HntHiSsyE1a6cUTK1aT7xDSU_hNTLW3R4mowUboCsqYoh1kN9v3ZoSu_WuvW9Aw0tQ0Dxv6GAXxQ7Nv5gmlkgnY0gmlwhLKAlv6Jc2VjcDI1NmsxoQK6S-Cii_KmfFdUJL2TANL3ksaKUnNXvTCv1tLwXs0QgIN1ZHCCIyk" --testnet-dir /var/lib/lighthouse/kintsugi-testnet/custom_config_data  --eth1-endpoints http://geth:8545 --http-address "0.0.0.0"
