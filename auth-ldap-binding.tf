#####################################
#
#   Auth LDAP (Group Binding)
#
resource "vault_ldap_auth_backend_group" "group" {
  groupname = "groups"

  policies = [
    "capabilities-self",
    "kv-foo",
    "kv-bar"
  ]

  backend = vault_ldap_auth_backend.ldap.path
  depends_on = [
    vault_ldap_auth_backend.ldap
  ]
}

#####################################
#
#   Auth LDAP (User Binding)
#
resource "vault_ldap_auth_backend_user" "user01" {
  username = "user01"

  policies = [
    "capabilities-self",
    "kv-foo"
  ]
  backend = vault_ldap_auth_backend.ldap.path

  depends_on = [
    vault_policy.kv-foo,
    vault_ldap_auth_backend.ldap
  ]
}

resource "vault_ldap_auth_backend_user" "user02" {
  username = "user02"

  policies = [
    "capabilities-self",
    "kv-bar"
  ]
  backend = vault_ldap_auth_backend.ldap.path

  depends_on = [
    vault_policy.kv-bar,
    vault_ldap_auth_backend.ldap
  ]
}
