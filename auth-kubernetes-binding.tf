#####################################
#
#   Auth Kubernetes (Binding)
#
resource "vault_kubernetes_auth_backend_role" "example" {
  backend = vault_auth_backend.kubernetes.path

  role_name = "ns-vault_system-sa-nginx"

  bound_service_account_names = [
    "nginx"
  ]
  bound_service_account_namespaces = [
    "vault-system",
    "capabilities-self"
  ]

  token_policies = [
    "kv-foo"
  ]

  depends_on = [
    vault_auth_backend.kubernetes
  ]
}