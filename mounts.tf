#####################################
#
#   Mounts
#
resource "vault_mount" "kv-foo" {
  path = "kv-foo"

  type    = "kv"
  options = { version = "2" }
}

resource "vault_mount" "kv-bar" {
  path = "kv-bar"

  type    = "kv"
  options = { version = "2" }
}

resource "vault_mount" "pki-root" {
  path = "pki-root"

  max_lease_ttl_seconds     = 622080000
  default_lease_ttl_seconds = 622080000

  type = "pki"
}

resource "vault_mount" "pki-inter" {
  path = "pki-inter"

  max_lease_ttl_seconds     = 155520000
  default_lease_ttl_seconds = 155520000

  type = "pki"
}