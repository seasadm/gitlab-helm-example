{{- define "dump_postgres_envs" }}
- name: DUMP_POSTGRES_HOST
  value: "{{ .Values.dump_postgres_host  }}"
- name: DUMP_POSTGRES_PORT
  value: "{{ .Values.dump_postgres_port }}"
- name: DUMP_POSTGRES_DB
  value: "{{.Values.dump_postgres_db }}"
- name: DUMP_POSTGRES_USER
  value: "{{ .Values.dump_postgres_user}}"
- name: DUMP_POSTGRES_PASSWORD
  value: "{{ .Values.dump_postgres_password}}"

- name: RESTORE_POSTGRES_HOST
  value: "{{ .Values.restore_postgres_host  }}"
- name: RESTORE_POSTGRES_PORT
  value: "{{ .Values.restore_postgres_port }}"
- name: RESTORE_POSTGRES_DB
  value: "{{ .Values.restore_postgres_db }}"
- name: RESTORE_POSTGRES_USER
  value: "{{ .Values.restore_postgres_user}}"
- name: RESTORE_POSTGRES_PASSWORD
  value: "{{ .Values.restore_postgres_password}}"

{{- end }}
