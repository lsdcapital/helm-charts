# prysm-validator

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.5](https://img.shields.io/badge/AppVersion-v1.0.5-informational?style=flat-square)

Eth2 Validator by Prysmatic Labs

## Maintainers

| Name            | Email             | Url |
| --------------- | ----------------- | --- |
| Stefan Lesicnik | stefan@lsdopen.io |     |

## Values

| Key                                   | Type   | Default                                  | Description |
| ------------------------------------- | ------ | ---------------------------------------- | ----------- |
| fullnameOverride                      | string | `""`                                     |             |
| nameOverride                          | string | `""`                                     |             |
| service.type                          | string | `"ClusterIP"`                            |             |
| validator.acceptTermsOfUse            | bool   | `false`                                  |             |
| validator.beacon                      | string | `"prysm-beacon:4000"`                    |             |
| validator.chain                       | string | `"mainnet"`                              |             |
| validator.debug.init                  | bool   | `false`                                  |             |
| validator.debug.main                  | bool   | `false`                                  |             |
| validator.deployment.dataDir          | string | `"/data"`                                |             |
| validator.deployment.image.pullPolicy | string | `"IfNotPresent"`                         |             |
| validator.deployment.image.repository | string | `"gcr.io/prysmaticlabs/prysm/validator"` |             |
| validator.deployment.image.tag        | string | `"stable"`                               |             |
| validator.graffiti                    | string | `""`                                     |             |
| validator.logfile                     | string | `"/data/validator.log"`                  |             |
| validator.persistentVolume.size       | string | `"1Gi"`                                  |             |
| validator.ports.monitoring            | int    | `8081`                                   |             |
| validator.resources.limits.memory     | string | `"1Gi"`                                  |             |
| validator.resources.requests.memory   | string | `"1Gi"`                                  |             |
| validator.verbosity                   | string | `"info"`                                 |             |

## Notes

# CAUTION

If you were running this helm chart previously based on the deployment.yaml, you should migrate your validator database to the new validator /data partition.
If that isn't an option. Stop your validator for at least 12.8 minutes before starting the new stateful set.

# Key Setup

- Copy you keystore-\*.json files to a folder where you will upload them from
- In the same folder as your keys, create walletpass (this is the password prysm will create for its wallet - (at least 8 characters including at least 1 alphabetical character, 1 number, and 1 unicode special character. Must not be a common password nor easy to guess)
- In the same folder as your keys, create validatorpass (this is the password you encypted your keys with)
- Deploy the prysm-validator helm chart with --set validator.debug.init=True (This will start the init container so you can copy in the keys)
- Run copykeys.sh (or however you like, copy your \*.json, walletpass, validatorpass to the prysm-import container /keys/import/.)
- Redeploy the helm chart

## Previous key setup

The keys were previously imported as secrets and mounted into memory for access. On discussion, it was decided to rather move to a stateful set and have a key volume. This has the added benefit of a validator not starting if the volume is not available (to prevent accidential double validation and slashing)

## Variables to set

| Variable                   |   Usage   | Info                                                                                           |
| :------------------------- | :-------: | :--------------------------------------------------------------------------------------------- |
| validator.beacon           | Mandatory | grpcToBeacon:port                                                                              |
| validator.acceptTermsofUse | Mandatory | Must be set to "true" - https://github.com/prysmaticlabs/prysm/blob/master/TERMS_OF_SERVICE.md |
| validator.chain            | Mandatory | Default to mainnet. Set to pyrmont for testnet                                                 |
| validator.graffiti         | Optional  | https://beaconcha.in/poap                                                                      |
| validator.debug.init       | Optional  | Starts a centos8 container for the init container                                              |
| validator.debug.main       | Optional  | Starts a centos8 container for the main container                                              |

## Troubleshooting

- You can check whats happening with the key import by running - kubectl logs prysm-validator-<podid> -c prysm-import
- Set the debug.init or debug.main to start a centos container which you can exec into

## Notes

## TODO
