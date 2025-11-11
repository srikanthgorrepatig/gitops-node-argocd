{{- define "nodejs-app.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}


{{- define "nodejs-app.fullname" -}}
{{- printf "%s-%s" (include "nodejs-app.name" .) .Release.Namespace -}}
{{- end -}}
