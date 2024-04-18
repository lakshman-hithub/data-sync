# job runner

{{/*
Expand the name of the chart.
*/}}
{{- define "howso-platform.jobRunner.name" -}}
{{- default .Chart.Name .Values.jobRunner.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "howso-platform.jobRunner.fullname" -}}
{{- if .Values.jobRunner.fullnameOverride }}
{{- .Values.jobRunner.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.jobRunner.nameOverride }}
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
{{- define "howso-platform.jobRunner.labels" -}}
helm.sh/chart: {{ include "howso-platform.chart" . }}
{{ include "howso-platform.jobRunner.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "howso-platform.jobRunner.selectorLabels" -}}
app.kubernetes.io/name: {{ include "howso-platform.jobRunner.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

