resource "vault_policy" "kv-foo" {
  name = "kv-foo"

  policy = <<EOT
    path "kv-foo/*" {
      capabilities = ["list"]
    }

    path "kv-foo/data/credentials/apps/foo" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_policy" "kv-bar" {
  name = "kv-bar"

  policy = <<EOT
    path "kv-bar/*" {
      capabilities = ["list"]
    }

    path "kv-bar/data/credentials/apps/foo" {
      capabilities = ["read"]
    }
  EOT
}