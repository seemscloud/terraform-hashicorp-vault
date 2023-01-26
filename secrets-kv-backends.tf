#####################################
#
#   Secret KV (Backends)
#
resource "vault_kv_secret_backend_v2" "kv-foo" {
  mount = vault_mount.kv-foo.path

  delete_version_after = 0
  cas_required         = false

  depends_on = [
    vault_mount.kv-foo,
    time_sleep.wait_1_seconds
  ]
}

resource "vault_kv_secret_backend_v2" "kv-bar" {
  mount = vault_mount.kv-bar.path

  delete_version_after = 0
  cas_required         = false

  depends_on = [
    vault_mount.kv-bar,
    time_sleep.wait_1_seconds
  ]
}