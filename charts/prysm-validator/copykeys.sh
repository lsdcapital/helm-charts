#!/bin/bash

echo -n "Keydir: "
read KEYDIR
echo -n "Namespace: "
read NS

kubectl cp $KEYDIR/. $NS/prysm-validator-0:/keys/import -c prysm-import
