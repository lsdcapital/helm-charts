
# Prysm Beacon Node

## Deploying
Please set the mandatory variables in the values file or pass as a helm deploy argument. eg --set beacon.web3HttpProvider=eth1nodehere

## Variables to set

| Variable | Usage | Info |
| :--------------------- | :---: | :--- |
| beacon.web3HttpProvider | Mandatory | http url to eth1 node (Your own, infura or alchemy)
| beacon.acceptTermsofUse | Mandatory | Must be set to "true" - https://github.com/prysmaticlabs/prysm/blob/master/TERMS_OF_SERVICE.md |
| beacon.chain | Mandatory | Default to mainnet. Set to pyrmont for testnet |
| beacon.verbosity | Optional | Default to info. You may want to go to debug |
| beacon.p2pMaxPeers | Optional | Max p2p peers. Default 30 |
| beacon.rpcHost | Optional | grpc listen host. Default 0.0.0.0 |
| beacon.ingress.extip | Optional | This sets --p2p-host-ip and also the ingress loadbalancer ip |

## Notes
- Currently only tested on GKE
- For a fully functioning beacon node, it is necessary to route the traffic from ports 13000/tcp and 12000/udp to the beacon pod. The current setup does, but we had to use the beacon.ingress.extip and manually create a static IP in GKE load balancer


