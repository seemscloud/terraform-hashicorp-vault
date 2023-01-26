#####################################
#
#   Policies
#
resource "vault_policy" "capabilities-self" {
  name = "capabilities-self"

  policy = <<EndOfMessage
path "sys/capabilities-self"
{
  capabilities = ["update"]
}
EndOfMessage
}

resource "vault_policy" "kv-foo" {
  name = "kv-foo"

  policy = <<EndOfMessage
path "kv-foo/*" {
  capabilities = ["list"]
}

path "kv-foo/data/credentials/apps/foo" {
  capabilities = ["read", "list"]
}
EndOfMessage

  depends_on = [
    vault_mount.kv-foo
  ]
}

resource "vault_policy" "kv-bar" {
  name = "kv-bar"

  policy = <<EndOfMessage
path "kv-bar/*" {
  capabilities = ["list"]
}

path "kv-bar/data/credentials/apps/bar" {
  capabilities = ["read", "list"]
}
EndOfMessage

  depends_on = [
    vault_mount.kv-bar
  ]
}

