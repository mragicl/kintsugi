#!/bin/bash
mkdir -p /var/lib/lighthouse/validators
yes "" | /usr/local/bin/lighthouse vc --testnet-dir /var/lib/lighthouse/kintsugi-testnet/custom_config_data --datadir /var/lib/lighthouse --metrics --beacon-nodes http://lighthousebeacon:5052


