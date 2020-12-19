# Prysm Slasher

# Setup

## Variables to set
| Variable | Usage | Info |
| :--------------------- | :---: | :--- |
| slasher.beacon | Mandatory | grpcToBeacon:port
| slasher.acceptTermsofUse | Mandatory | Must be set to "true" - https://github.com/prysmaticlabs/prysm/blob/master/TERMS_OF_SERVICE.md |
| slasher.chain | Mandatory | Default to mainnet. Set to pyrmont for testnet |
| slasher.debug | Optional | Starts a centos8 container for the main container |

## Troubleshooting
- Set debug to start a centos container which you can exec into

## Notes
- This has only been tested on GKE

## TODO
- Fix health endpoints
- Get monitoring up and running
