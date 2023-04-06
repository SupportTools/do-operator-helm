{{- define "do-operator.name" -}}
{{- default "do-operator" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "do-operator.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "do-operator.name" . | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "do-operator.serviceAccountName" -}}
{{- default (include "do-operator.fullname" .) .Values.serviceAccount.name -}}
{{- end -}}

{{- define "do-operator.labels" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- $chart := .Chart.Name | lower -}}
app.kubernetes.io/name: {{ $name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: operator
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
