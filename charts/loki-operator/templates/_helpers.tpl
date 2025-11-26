{{- define "validate-values" }}
{{- if and (ne .Values.tenants.mode "openshift-logging") (ne .Values.tenants.mode "openshift-network") }}
{{- fail "tenants.mode must be either 'openshift-logging' or 'openshift-network'" }}
{{- end }}
{{- if not .Values.storageClassName }}
{{- fail "storageClassName is required and cannot be empty" }}
{{- end }}
{{- $validObjstoreTypes := list "s3" "gcs" "azure" "swift" }}
{{- if not (has .Values.objstore.type $validObjstoreTypes) }}
{{- fail "objstore.type must be one of: s3, gcs, azure, swift" }}
{{- end }}
{{- if and (not .Values.objstore.existingSecret) (not .Values.objstore.data) }}
{{- fail "objstore.data is required and cannot be empty when existingSecret is not specified" }}
{{- end }}
{{- end }}

{{- define "loki.namespace" -}}
{{- if eq .Values.tenants.mode "openshift-logging" -}}
openshift-logging
{{- else if eq .Values.tenants.mode "openshift-network" -}}
netobserv
{{- end -}}
{{- end -}}
