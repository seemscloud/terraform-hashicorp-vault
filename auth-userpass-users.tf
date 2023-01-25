#####################################
#
#   Auth UserPass (Users)
#
resource "vault_generic_endpoint" "test" {
  path = "auth/userpass/users/test"

  ignore_absent_fields = true

  data_json = <<EndOfMessage
  {
    "password": "test",
    "policies": [
      "capabilities-self",
      "kv-foo"
  ],
    "token_no_default_policy": "true"
  }
  EndOfMessage

  depends_on = [
    vault_auth_backend.userpass
  ]
}

resource "vault_generic_endpoint" "best" {
  path = "auth/userpass/users/best"

  ignore_absent_fields = true

  data_json = <<EndOfMessage
  {
    "password": "best",
    "policies": [
      "capabilities-self",
      "kv-bar"
    ],
    "token_no_default_policy": "true"
  }
  EndOfMessage

  depends_on = [
    vault_auth_backend.userpass
  ]
}