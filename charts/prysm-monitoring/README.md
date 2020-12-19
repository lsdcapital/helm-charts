# Prsym Monitoring with Grafana & Prometheus
Deploying this helm chart pulls in the dependency charts for Promethues & Grafana

## Installation
You need to add the following repo's to your helm repo list
- https://grafana.github.io/helm-charts
- https://prometheus-community.github.io/helm-charts

Run
<pre>
helm dependency update
</pre>

## Deplying
<pre>
helm upgrade -i prysm-monitoring .
</pre>

## Variables to set
| Variable | Usage | Info |
| :--------------------- | :---: | :--- |
| grafana.ingress.enabled | Optional | You probably want this if you want to access your grafana |
| grafana.ingress.hosts | Mandatory | For the default ingress. Add this in {} as a list |
| grafana.adminPassword | Mandatory | You really want to change this |

## Grafana
Follow the instructions here - https://docs.prylabs.network/docs/prysm-usage/monitoring/grafana-dashboard

Add the datasource of Prometheus
- Use http://prysm-monitoring-prometheus-server as the URL

Import one of the following
- https://docs.prylabs.network/assets/grafana-dashboards/small_amount_validators.json
- https://docs.prylabs.network/assets/grafana-dashboards/big_amount_validators.json

## Notes
You seem unable to run prsym-monitoring with the exact same name in multiple namespaces. For a different namespace, use a different name for the deploy