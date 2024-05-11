{{- define "postgres_envs" }}

{{- range $name, $map := .Values.postgres }}
{{- $default := $map._default }}
{{- $value := pluck $.Values.global.env $map | first | default $default }}
- name: {{ $name }}
  value: {{ $value | quote}}
{{- end }}

{{- end }}
