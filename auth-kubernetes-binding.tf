#####################################
#
#   Auth Kubernetes (Binding)
#
resource "vault_kubernetes_auth_backend_role" "example" {
  backend = vault_auth_backend.kubernetes.path

  role_name                        = "ns-vault_system-sa-nginx"
  bound_service_account_names      = ["nginx", "vault"]
  bound_service_account_namespaces = ["vault-system"]

  token_policies = [
    "capabilities-self",
    "kv-foo",
    "default"
  ]
  
  depends_on = [
    vault_auth_backend.kubernetes
  ]
}