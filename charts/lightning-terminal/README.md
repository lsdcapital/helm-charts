
# Lightning Labs Terminal - LiT
This helm chart implements LiT 0.3.0 - This contains LND, LiT, Loop, Pool, Faraday.
https://github.com/lightninglabs/lightning-terminal

When deploying this chart, please set the UI password with --set config.uipass=youruipasshere (min 8 chars)

There is a persistant volume of 1gi created and mounted to /root. This is simplier as this is the default location for all the LiT files. This persistant volume is only tested on GKE.

## Installation / Deploy
helm upgrade -i lnd-lit . --set config.uipass=youruipasshere

## Changes
- Added persistant storage as loop.db, pool.db are important. (ie. if you lose them mid loop you will lose funds)
