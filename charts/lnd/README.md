# lnd

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.11.1-beta](https://img.shields.io/badge/AppVersion-v0.11.1--beta-informational?style=flat-square)

A Helm chart for Lightning Labs LND

## Values

| Key                                        | Type   | Default                 | Description |
| ------------------------------------------ | ------ | ----------------------- | ----------- |
| affinity                                   | object | `{}`                    |             |
| autoscaling.enabled                        | bool   | `false`                 |             |
| autoscaling.maxReplicas                    | int    | `100`                   |             |
| autoscaling.minReplicas                    | int    | `1`                     |             |
| autoscaling.targetCPUUtilizationPercentage | int    | `80`                    |             |
| bitcoind.rpcpass                           | string | `""`                    |             |
| bitcoind.rpcuser                           | string | `""`                    |             |
| config.externalIp                          | string | `nil`                   |             |
| config.lbport                              | int    | `9735`                  |             |
| config.persistence.enabled                 | bool   | `true`                  |             |
| config.persistence.size                    | string | `"1Gi"`                 |             |
| config.walletpass                          | string | `"changeme"`            |             |
| fullnameOverride                           | string | `""`                    |             |
| image.pullPolicy                           | string | `"IfNotPresent"`        |             |
| image.repository                           | string | `"lightninglabs/lnd"`   |             |
| image.tag                                  | string | `""`                    |             |
| imagePullSecrets                           | list   | `[]`                    |             |
| ingress.annotations                        | object | `{}`                    |             |
| ingress.enabled                            | bool   | `true`                  |             |
| ingress.hosts[0].host                      | string | `"chart-example.local"` |             |
| ingress.hosts[0].paths                     | list   | `[]`                    |             |
| ingress.tls                                | list   | `[]`                    |             |
| ingress.type                               | string | `"gke"`                 |             |
| nameOverride                               | string | `""`                    |             |
| nodeSelector                               | object | `{}`                    |             |
| podAnnotations                             | object | `{}`                    |             |
| podSecurityContext                         | object | `{}`                    |             |
| replicaCount                               | int    | `1`                     |             |
| resources                                  | object | `{}`                    |             |
| securityContext                            | object | `{}`                    |             |
| service.port                               | int    | `10009`                 |             |
| service.type                               | string | `"ClusterIP"`           |             |
| serviceAccount.annotations                 | object | `{}`                    |             |
| serviceAccount.create                      | bool   | `true`                  |             |
| serviceAccount.name                        | string | `""`                    |             |
| tolerations                                | list   | `[]`                    |             |
