# sms

{{/*
Expand the name of the chart.
*/}}
{{- define "howso-platform.sms.name" -}}
{{- default .Chart.Name .Values.sms.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "howso-platform.sms.fullname" -}}
{{- if .Values.sms.fullnameOverride }}
{{- .Values.sms.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.sms.nameOverride }}
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
{{- define "howso-platform.sms.labels" -}}
helm.sh/chart: {{ include "howso-platform.chart" . }}
{{ include "howso-platform.sms.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "howso-platform.sms.selectorLabels" -}}
app.kubernetes.io/name: {{ include "howso-platform.sms.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
