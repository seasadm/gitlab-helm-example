{{- define "minio_envs" }}

- name: MINIO_ACCESS_KEY
  value: {{ pluck .Values.global.env .Values.global.app.S3_ACCESS_KEY | first | default .Values.global.app.S3_ACCESS_KEY._default }}
- name: MINIO_SECRET_KEY
  value: {{ pluck .Values.global.env .Values.global.app.S3_SECRET_KEY | first | default .Values.global.app.S3_SECRET_KEY._default }}
- name: S3_FILE_BUCKET
  value: {{ pluck .Values.global.env .Values.global.app.S3_FILE_BUCKET | first | default .Values.global.app.S3_FILE_BUCKET._default }}

{{- end }}
