{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "howso-platform.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Using the globally defined registry & registryNamespace.
Construct a full image path for a given image.
*/}}
{{- define "howso-platform.imagePath" -}}
  {{- $root := .root -}}
  {{- $image := .image -}}
  {{- $registry := $root.Values.images.registry -}}
  {{- $registryNamespace := $root.Values.images.registryNamespace -}}
  {{- if $registryNamespace -}}
    {{- printf "%s/%s/%s:%s" $registry $registryNamespace $image.name $image.tag | trim -}}
  {{- else -}}
    {{- printf "%s/%s:%s" $registry $image.name (toString $image.tag) | trim -}}
  {{- end -}}
{{- end -}}

