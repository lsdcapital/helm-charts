{{/*
Expand the name of the chart.
*/}}
{{- define "prysm-beacon.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "prysm-beacon.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "beacon-node.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "prysm-beacon.labels" -}}
helm.sh/chart: {{ include "beacon-node.chart" . }}
{{ include "prysm-beacon.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "beacon-node.statsLabels" -}}
helm.sh/chart: {{ include "beacon-node.chart" . }}
{{ include "beacon-node.statsSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "prysm-beacon.selectorLabels" -}}
app.kubernetes.io/name: {{ include "prysm-beacon.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "beacon-node.statsSelectorLabels" -}}
serviceRole: stats
{{ include "prysm-beacon.selectorLabels" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "prysm-beacon.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "prysm-beacon.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
