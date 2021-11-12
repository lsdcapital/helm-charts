# lndhub

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.4.1](https://img.shields.io/badge/AppVersion-v1.4.1-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Stefan Lesicnik | stefan@lsdopen.io |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 15.5.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| config.lbport | int | `3000` |  |
| config.persistence.enabled | bool | `false` |  |
| config.persistence.size | string | `"1Gi"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"bluewalletorganization/lndhub"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations."cert-manager.io/cluster-issuer" | string | `"letsencrypt-production"` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"traefik-cert-manager"` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"lndhub.domain"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls[0].hosts[0] | string | `"lndhub.domain"` |  |
| ingress.tls[0].secretName | string | `"lndhub-tls"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1001` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secrets.admin_macaroon | string | `"f0VMRgIBAQAAAAAAAAAAAAMAPgABAAAAILkAAAAAAABAAAAAAAAAADAvAgAAAAAAAAAAAEAAOAANAEAAHwAeAAYAAAAEAAAAQAAAAAAAAABAAAAAAAAAAEAAAAAAAAAA2AIAAAAAAADYAgAAAAAAAAgAAAAAAAAAAwAAAAQAAAAYAwAAAAAAABgDAAAAAAAAGAMAAAAAAAAcAAAAAAAAABwAAAAAAAAAAQAA\n"` |  |
| secrets.configjs | string | `"let config = {\n  enableUpdateDescribeGraph: false,\n  postRateLimit: 100,\n  rateLimit: 200,\n  forwardReserveFee: 0.01, // default 0.01\n  intraHubFee: 0.003, // default 0.003\n  bitcoind: {\n    rpc: 'http://login:password@1.1.1.1:8332/wallet/wallet.dat',\n  },\n  redis: {\n    port: 12914,\n    host: '1.1.1.1',\n    family: 4,\n    password: 'password',\n    db: 0,\n  },\n  lnd: {\n    url: '1.1.1.1:10009',\n    password: '',\n  },\n};\n\nif (process.env.CONFIG) {\n  console.log('using config from env');\n  config = JSON.parse(process.env.CONFIG);\n}\n"` |  |
| secrets.tls_cert | string | `"-----BEGIN CERTIFICATE-----\nMIIGtzCCBJ+gAwIBAgITMQC9BpthS0lQh6bAGQACAL0GmzANBgkqhkiG9w0BAQ0F\nADBRMRQwEgYKCZImiZPyLGQBGRYEY29ycDEXMBUGCgmSJomT8ixkARkWB3ZvZGFj\nb20xIDAeBgNVBAMTF3ZvZGFjb20tWkFNRFYwMTAyLVN1YkNBMB4XDTE5MTAyNjA1\nMzkyMFoXDTIxMTAyNTA1MzkyMFowgYIxCzAJBgNVBAYTAlpBMRYwFAYDVQQHEw1U\nZWNobm8gQ2VudHJlMR4wHAYDVQQKExVWb2RhY29tIEdyb3VwIExpbWl0ZWQxFjAU\nBgNVBAsTDUVudGVycHJpc2UgSVQxIzAhBgNVBAMMGioudGVzdC50Yy5vY3Audm9k\nYWNvbS5jb3JwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA05gK0S8l\nFgpUHv8l3ZEei3q5p5f3NWmkPcLE/1LGKP1+z1PXUW+GPDRdoCeQ4QJRtPU6y+vb\nGPQ7LZ8tvkeUOhk1eijVPQoEjJICkz/2OwMdURh5y5oEdo8t9JRHZpm8AhY+sNPT\ns++HO6flk5gV7yNAtHg8SRr6I5n73t9APYR7cSL5/hBIcH0XAcQiQOP/lPpVVuCn\nL4GCFV57zQ9XxylRDNkHF1eEQcyPygHNxV7RFDm5QguqfWoOniQFGJ9a5xjUl76F\nEoXXZvfqeYd3fh7oWdPprAXi7kr6AoPL1oNTmnct/DmXvozmJ6HQohAIOoKZS5TC\n7WgfgrNeTaumLQIDAQABo4ICVDCCAlAwJQYDVR0RBB4wHIIaKi50ZXN0LnRjLm9j\ncC52b2RhY29tLmNvcnAwHQYDVR0OBBYEFCzHNjPoi71JeT5xf7Bx+6Jm2EL4MB8G\nA1UdIwQYMBaAFJKA55EGPCoDKeGqPhvGiFRgznflMIHWBgNVHR8Egc4wgcswgcig\ngcWggcKGgb9sZGFwOi8vL0NOPXZvZGFjb20tWkFNRFYwMTAyLVN1YkNBLENOPXph\nbWR2MDEwMixDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vy\ndmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1hZnJvb3QsREM9bmV0P2NlcnRpZmlj\nYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRp\nb25Qb2ludDCByAYIKwYBBQUHAQEEgbswgbgwgbUGCCsGAQUFBzAChoGobGRhcDov\nLy9DTj12b2RhY29tLVpBTURWMDEwMi1TdWJDQSxDTj1BSUEsQ049UHVibGljJTIw\nS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1h\nZnJvb3QsREM9bmV0P2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0\naWZpY2F0aW9uQXV0aG9yaXR5MCEGCSsGAQQBgjcUAgQUHhIAVwBlAGIAUwBlAHIA\ndgBlAHIwCwYDVR0PBAQDAgWgMBMGA1UdJQQMMAoGCCsGAQUFBwMBMA0GCSqGSIb3\nDQEBDQUAA4ICAQCkvl22uohQDe5ek1oWP/uDD6Dr7fvTkwJJLxH7Odqi5g6YOARY\nhTeXEwQrj3ymsbsYvnvFCT5rRkxrYD2kkPBGVRyO2120QgQtANiwvTWXOMnTO+zt\nMV4HWhX/nfEH5ek5ekuPCYYnQViLHe2KBWdIpdPWm5dageO1ydj4pMc94oRIYOuT\n9yjO+pyx1ePq4sLfdK4BAI0zvjXtYYTS0gLP14lZcx8cxbaZHPGPsCHJQRZYkEzn\npB6hcuXMQGtMwsfa0h+bXSu7iJ3ic41CLH1dKPL7fv6sORv+KYxhjXi4Nil2EgWY\nYQGZWhlhNkwtoAKFixtAUzJQeseOc7Ku2gtSw/HVcVAi9yq6M6iDdyCx7mOnMY/1\nD71iOkEAfH1dkeYbkzVZqx+snaFtMhN2GA/AANi0V7wnb0LXxHLfpgGXcoFwpXv6\nh/Vld5vrrn1Zj4Q7zC/5uQb1y3ZmtEXECiXSTJJ2b/wr015lkPLLlN5UE20sh/Dg\nDF2U+KFdoT5fuWP4sPE4QFqF6q9Yw8GgPv8mcEwPWFiwcL+YmGZk9Tm3lfkazTLu\nqg0rMjkyF6QQYcmD4OiseoRt7G/48v+DcMcqkXnK6yNmrQ5fQ5CfnVD6wGpVDvXQ\ncEGXY7wT1qgQKK9AZjBbbDni0TSLSKTZ7denvLLzO07f3Zzz3OlD3Ph4MA==\n-----END CERTIFICATE-----\n"` |  |
| securityContext.runAsGroup | int | `1001` |  |
| securityContext.runAsUser | int | `1001` |  |
| service.port | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
