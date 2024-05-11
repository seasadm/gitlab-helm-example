{{- define "minio_envs" }}

{{- range $name, $map := .Values.minio }}
{{- $default := $map._default }}
{{- $value := pluck $.Values.global.env $map | first | default $default }}
- name: {{ $name }}
  value: {{ $value | quote}}
{{- end }}

- name: TEST01
  value: reallytest

{{- end }}
