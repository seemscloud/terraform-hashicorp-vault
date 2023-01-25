#####################################
#
#   Auth Kubernetes (Binding)
#
resource "vault_kubernetes_auth_backend_role" "example" {
  backend = vault_auth_backend.kubernetes.path

  role_name = "ns-vault_system-sa-debug"

  bound_service_account_names      = ["debug"]
  bound_service_account_namespaces = ["default"]

  token_policies = [
    "capabilities-self",
    "kv-foo"
  ]

  depends_on = [
    vault_auth_backend.kubernetes
  ]
}