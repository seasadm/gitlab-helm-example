{{- define "restic_envs" }}

- name: AWS_ACCESS_KEY_ID
  value: {{ .Values.global.backup_s3_id }}
- name: AWS_SECRET_ACCESS_KEY
  value: {{ .Values.global.backup_s3_key }}
- name: BACKUPREPOPASS
  value: {{ .Values.global.backup_repo_pass }}
- name: BACKUPS3HOST
  value: {{ .Values.global.backup_s3_host }}

{{- end }}
