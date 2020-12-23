# Ethereum Go
Helm chart deploying Ethereum Go client.

This chart was adapted from https://vulcanlink.github.io/charts/

There is still work to do on Ingress controllers. I am running this on GKE and using a LoadBalancer type. Prob need to make this more generic.
Currently geth doesn't pick up the GKE loadbalancer ip. This is set via values.yaml - ingress.extip. Set this if you need.
It also seems like you cant mix TCP & UDP ports - so not sure how to handle both via the -nat. #TODO figure out impact of this

Geth needs fast disk to sync. Ensure you have a fast ssd type storage. If you want to save costs, set config.persistence.split.enabled true. This will create a hdd and ssd class and use geths ancient directory

## Parameters

The following tables lists the configurable parameters of the geth chart and their default values.

## Variables to set
| Variable | Usage | Info |
| :--------------------- | :---: | :--- |


The above command disables persistent storage, meaning the node will have to resync after every Pod restart/deletion.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install my-release -f values.yaml vulcanlink/geth
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Troubleshooting

Set debug: True in values.yaml. This will start the geth container just running /sh that you can init into.
