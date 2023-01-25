#####################################
#
#   Auth Kubernetes
#
resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  backend         = vault_auth_backend.kubernetes.path
  kubernetes_host = "https://kubernetes.default.svc:443"

  issuer                 = "api"
  disable_iss_validation = "true"
}