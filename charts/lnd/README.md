
Create or import you wallet.  The startup will create an init container to let you do this. If it detects a wallet.db file, it should bypass this and move to unlock the file from .walletpass

How to create a wallet

Exec into your pod
kubectl -c lnd-init exec -it lnd-<pod-id> -- /bin/bash

Start LND
lnd --lnddir=/data --datadir=/data/data --configfile=/etc/lnd/lnd.conf &
lncli --lnddir=/data create
fg


##
Check whats happening with the init container
kubectl logs lnd-<pod-name> -c lnd-init


## Deploy
helm upgrade -i lnd . --set config.walletpass=yourpasshere
