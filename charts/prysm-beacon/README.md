# prysm-beacon

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.5](https://img.shields.io/badge/AppVersion-v1.0.5-informational?style=flat-square)

Eth2 Beacon Chain Node by Prysmatic Labs

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Stefan Lesicnik | stefan@lsdopen.io |  |

## Source Code

* <http://github.com/lsdcapital/helm-charts/prysm-beacon>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| beacon.acceptTermsOfUse | bool | `false` | Must accept terms of use https://github.com/prysmaticlabs/prysm/blob/master/TERMS_OF_SERVICE.md |
| beacon.chain | string | `"mainnet"` | Which chain to operate on (mainnet/pyrmont) |
| beacon.deployment.dataDir | string | `"/data"` |  |
| beacon.deployment.podSecurityContext.fsGroup | int | `101` |  |
| beacon.deployment.podSecurityContext.runAsGroup | int | `101` |  |
| beacon.deployment.podSecurityContext.runAsUser | int | `101` |  |
| beacon.deployment.replicaCount | int | `1` | Scaling the beacon above 1 is not tested |
| beacon.deployment.securityContext | object | `{}` |  |
| beacon.eth1HeaderReqLimit | int | `nil` | Eth1 header limit. If you are getting errors regarding request size |
| beacon.image.pullPolicy | string | `"IfNotPresent"` |  |
| beacon.image.repository | string | `"gcr.io/prysmaticlabs/prysm/beacon-chain"` |  |
| beacon.image.tag | string | `""` |  |
| beacon.ingress.enabled | bool | `true` |  |
| beacon.ingress.extip | string | `""` |  |
| beacon.logfile | string | `"/data/beacon.log"` |  |
| beacon.p2pMaxPeers | int | `60` | Peer to peer max peers. Try increase if missing attestations |
| beacon.persistentVolume.size | string | `"50Gi"` | Persistent volume size for the beacon data |
| beacon.ports.grpc | int | `4000` |  |
| beacon.ports.monitoring | int | `8080` |  |
| beacon.ports.p2pTcp | int | `13000` |  |
| beacon.ports.p2pUdp | int | `12000` |  |
| beacon.rpcHost | string | `"0.0.0.0"` |  |
| beacon.verbosity | string | `"info"` |  |
| beacon.web3HttpProvider | string | `""` | http url to eth1 node (Your own or 3rd party) |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |

## Notes
- Currently only tested on GKE
- For a fully functioning beacon node, it is necessary to route the traffic from ports 13000/tcp and 12000/udp to the beacon pod. The current setup does, but we had to use the beacon.ingress.extip and manually create a static IP in GKE load balancer
