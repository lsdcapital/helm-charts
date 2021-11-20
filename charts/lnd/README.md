# lnd

![Version: 1.0.6](https://img.shields.io/badge/Version-1.0.6-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.14.0-beta](https://img.shields.io/badge/AppVersion-v0.14.0--beta-informational?style=flat-square)

A Helm chart for Lightning Labs LND

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| bitcoin.basefee | int | `1000` |  |
| bitcoin.feerate | int | `1` |  |
| bitcoin.minChanSize | int | `100000` |  |
| bitcoind.estimatemode | string | `""` |  |
| bitcoind.rpchost | string | `""` |  |
| bitcoind.rpcpass | string | `""` |  |
| bitcoind.rpcport | string | `""` |  |
| bitcoind.rpcuser | string | `""` |  |
| bitcoind.zmqpubrawblockport | string | `""` |  |
| bitcoind.zmqpubrawtxport | string | `""` |  |
| config.alias | string | `"lsdcapital"` |  |
| config.externalIp | string | `nil` |  |
| config.lbport | int | `9735` |  |
| config.persistence.enabled | bool | `true` |  |
| config.persistence.size | string | `"2Gi"` |  |
| config.restListen | string | `nil` |  |
| config.tlsExtraDomain[0] | string | `"lnd"` |  |
| config.tlsExtraDomain[1] | string | `"lnd-loadbalancer"` |  |
| config.tlsExtraIp[0] | string | `"lnd"` |  |
| config.walletpass | string | `"changeme"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"lightninglabs/lnd"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `true` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `10009` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| tor.controlhost | string | `"tor"` |  |
| tor.controlport | int | `9051` |  |
| tor.enabled | bool | `false` |  |
| tor.password | string | `"default"` |  |
| tor.sockshost | string | `"tor"` |  |
| tor.socksport | int | `9050` |  |

## Create a wallet

The startup will create an init container to let you do this. If it detects a wallet.db file, it should bypass this and move to unlock the file from .walletpass

### How to create a wallet

Exec into your pod
kubectl -c lnd-init exec -it lnd-<pod-id> -- /bin/bash
echo "yourwalletpass" > /data/.walletpass
lncli --lnddir=/data create

## Troubleshooting

Check whats happening with the init container
kubectl logs lnd-<pod-name> -c lnd-init
