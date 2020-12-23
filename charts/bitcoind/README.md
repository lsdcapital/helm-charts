# bitcoind

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.20.1](https://img.shields.io/badge/AppVersion-0.20.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key                                        | Type   | Default                            | Description |
| ------------------------------------------ | ------ | ---------------------------------- | ----------- |
| affinity                                   | object | `{}`                               |             |
| autoscaling.enabled                        | bool   | `false`                            |             |
| autoscaling.maxReplicas                    | int    | `100`                              |             |
| autoscaling.minReplicas                    | int    | `1`                                |             |
| autoscaling.targetCPUUtilizationPercentage | int    | `80`                               |             |
| config.persistence.enabled                 | bool   | `true`                             |             |
| config.persistence.size                    | string | `"500Gi"`                          |             |
| config.printtoconsole                      | bool   | `true`                             |             |
| config.rpc.addr                            | string | `"0.0.0.0"`                        |             |
| config.rpc.enabled                         | bool   | `true`                             |             |
| config.rpc.port                            | int    | `8332`                             |             |
| config.zmqblock.addr                       | string | `"0.0.0.0"`                        |             |
| config.zmqblock.enabled                    | bool   | `true`                             |             |
| config.zmqblock.port                       | int    | `28332`                            |             |
| config.zmqtx.addr                          | string | `"0.0.0.0"`                        |             |
| config.zmqtx.enabled                       | bool   | `true`                             |             |
| config.zmqtx.port                          | int    | `28333`                            |             |
| fullnameOverride                           | string | `""`                               |             |
| image.pullPolicy                           | string | `"IfNotPresent"`                   |             |
| image.repository                           | string | `"docker.io/lsdopen/bitcoin-core"` |             |
| image.tag                                  | string | `""`                               |             |
| imagePullSecrets                           | list   | `[]`                               |             |
| ingress.annotations                        | object | `{}`                               |             |
| ingress.enabled                            | bool   | `false`                            |             |
| ingress.hosts[0].host                      | string | `"chart-example.local"`            |             |
| ingress.hosts[0].paths                     | list   | `[]`                               |             |
| ingress.tls                                | list   | `[]`                               |             |
| ingress.type                               | string | `"gke"`                            |             |
| nameOverride                               | string | `""`                               |             |
| nodeSelector                               | object | `{}`                               |             |
| podAnnotations                             | object | `{}`                               |             |
| podSecurityContext                         | object | `{}`                               |             |
| replicaCount                               | int    | `1`                                |             |
| resources                                  | object | `{}`                               |             |
| securityContext                            | object | `{}`                               |             |
| service.port                               | int    | `80`                               |             |
| service.type                               | string | `"ClusterIP"`                      |             |
| serviceAccount.annotations                 | object | `{}`                               |             |
| serviceAccount.create                      | bool   | `true`                             |             |
| serviceAccount.name                        | string | `""`                               |             |
| tolerations                                | list   | `[]`                               |             |

# Bitcoin Helm Chart

By default it has 500gi persistant storage mounted to /data (tested on GKE. Please help test on others)
There is no ingress route created, but internal ClusterIP for interprocess communications

## Configuration

The bitcoin.conf file is stored in config/bitcoin.core.sample. Rename this to bitcoin.core and adjust. You probably want to set the rpcuser and pass.

## Deploy

helm upgrade -i bitcoind .
