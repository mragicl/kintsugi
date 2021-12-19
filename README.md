# kintsugi - lighthouse and geth
Run lighthousebeacon and geth for kintsugi testnet in docker containers, with docker-compose.
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

