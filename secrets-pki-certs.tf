resource "vault_pki_secret_backend_root_cert" "pki-root" {
  backend = vault_mount.pki-root.path
  type    = "internal"

  common_name  = "seems.cloud"
  organization = "Seems Cloud"
  ou           = "DevOps"
  province     = "Mazovia"
  locality     = "Warsaw"
  country      = "PL"

  private_key_format = "der"
  key_type           = "rsa"
  key_bits           = 4096
  format             = "pem"

  ttl = 622080000

  exclude_cn_from_sans = true

  depends_on = [
    vault_mount.pki-root
  ]
}

resource "vault_pki_secret_backend_intermediate_cert_request" "pki-inter" {
  backend = vault_mount.pki-inter.path
  type    = vault_pki_secret_backend_root_cert.pki-root.type

  common_name = "inter.seems.cloud"

  private_key_format = "der"
  key_type           = "rsa"
  key_bits           = 2048
  format             = "pem"

  depends_on = [
    vault_mount.pki-inter,
    vault_pki_secret_backend_root_cert.pki-root
  ]
}

resource "vault_pki_secret_backend_root_sign_intermediate" "pki-inter" {
  backend = vault_mount.pki-root.path

  csr = vault_pki_secret_backend_intermediate_cert_request.pki-inter.csr

  common_name  = "inter.seems.cloud"
  organization = "Seems Cloud"
  ou           = "DevOps"
  province     = "Mazovia"
  locality     = "Warsaw"
  country      = "PL"

  ttl = 155520000

  exclude_cn_from_sans = true

  depends_on = [
    vault_mount.pki-inter,
    vault_pki_secret_backend_intermediate_cert_request.pki-inter
  ]
}

resource "vault_pki_secret_backend_intermediate_set_signed" "pki-inter" {
  backend     = vault_mount.pki-inter.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.pki-inter.certificate

  depends_on = [
    vault_mount.pki-inter,
    vault_pki_secret_backend_root_sign_intermediate.pki-inter
  ]
}

resource "vault_pki_secret_backend_role" "role" {
  backend = vault_mount.pki-inter.path
  name    = "pki-inter"

  organization = ["Seems Cloud"]
  ou           = ["DevOps"]
  province     = ["Mazovia"]
  locality     = ["Warsaw"]
  country      = ["PL"]

  key_type = "rsa"
  key_bits = 2048

  ttl     = 2592000
  max_ttl = 7776000

  allowed_domains  = ["seems.cloud"]
  allowed_uri_sans = ["seems.cloud"]

  allow_subdomains   = true
  allow_ip_sans      = false
  allow_any_name     = false
  allow_bare_domains = false
  allow_glob_domains = false
  allow_localhost    = false
}