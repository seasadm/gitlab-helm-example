{{- define "app_envs" }}

{{- range $name, $map := .Values.global.app }}
{{- $default := $map._default }}
{{- $value := pluck $.Values.global.env $map | first | default $default }}
- name: {{ $name }}
  value: {{ $value | quote}}
{{- end }}

{{- end }}
