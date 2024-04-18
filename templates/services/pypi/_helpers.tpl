# pypi

{{/*
Expand the name of the chart.
*/}}
{{- define "howso-platform.pypi.name" -}}
{{- default .Chart.Name .Values.pypi.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "howso-platform.pypi.fullname" -}}
{{- if .Values.pypi.fullnameOverride }}
{{- .Values.pypi.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.pypi.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}



{{/*
Common labels
*/}}
{{- define "howso-platform.pypi.labels" -}}
helm.sh/chart: {{ include "howso-platform.chart" . }}
{{ include "howso-platform.pypi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "howso-platform.pypi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "howso-platform.pypi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

