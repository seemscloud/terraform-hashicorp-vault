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

resource "vault_kv_secret_backend_v2" "kv-foo" {
  mount = vault_mount.kv-foo.path

  max_versions         = 10
  delete_version_after = 2592000
  cas_required         = true
}

resource "vault_kv_secret_backend_v2" "kv-bar" {
  mount = vault_mount.kv-foo.path

  max_versions         = 10
  delete_version_after = 2592000
  cas_required         = true
}