# kintsugi - lighthouse and geth
Run lighthouse beacon node, lighthouse validator and geth for kintsugi testnet in docker containers, with docker-compose.

It follows Remy Roys description, see here:

https://github.com/remyroy/ethstaker/blob/main/merge-devnet.md

see also:

https://www.reddit.com/r/ethstaker/comments/riacuf/the_kintsugi_public_merge_testnet_is_live_and/


## usage

In order to use it:
```
git clone https://github.com/mragicl/kintsugi.git
cd kintsugi
mkdir data
chmod -R a+rw data/
docker-compose up -d
```

You can check the geth and lighthousebeacon logs with:
```
docker-compose logs -f geth
```
and
```
docker-compose logs -f lighthousebeacon
```

Port 8545 is exposed on port 18545 on the host, so you can point metamask etc to this port.

## Adding a validator
Once your geth and lighthouse beacon node are synched (you can check to logs), it's time to add a validator!
First you have to create the secrets file using the script:
```
./create_secret.sh
```
It will output an Ethereum kintsugi public address. Use the public faucet, to fund this address. You can find the faucet here: https://faucet.kintsugi.themerge.dev/

Once it is funded, use to deposit.sh script to perform the deposit to the kintsugi staking contract:
```
./deposit.sh
```

For the last step, you need the password of your validator's keystore. You can find it such:
```
cat data/app/assigned_data/secrets/<pubkey> && echo
```

To activate your validator, you run then:
```
./init_validator.sh
```

Then restart the containers:
```
docker compose down
docker compouse up -d
```

and check the output of the validator with:
```
docker-compose logs -f lighthousevalidator
```
It will say that one validator is actively validating!





