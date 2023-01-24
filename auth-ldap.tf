resource "vault_ldap_auth_backend" "ldap" {
  path = "ldap"

  url = "ldap://openldap:1389"

  username_as_alias       = true
  token_no_default_policy = true

  binddn    = "cn=admin,dc=seems,dc=cloud"
  bindpass  = "admin"
  userattr  = "cn"
  userdn    = "ou=users,dc=seems,dc=cloud"
  groupattr = "cn"
  groupdn   = "cn=groups,ou=users,dc=seems,dc=cloud"
}

resource "vault_ldap_auth_backend_user" "user01" {
  username = "user01"

  policies = [
    "kv-foo"
  ]
  backend = vault_ldap_auth_backend.ldap.path
}

resource "vault_ldap_auth_backend_user" "user02" {
  username = "user02"

  policies = [
    "kv-bar"
  ]
  backend = vault_ldap_auth_backend.ldap.path
}


#resource "vault_ldap_auth_backend_group" "group" {
#  groupname = "groups"
#
#  policies = [
#    "kv-foo"
#
#  ]
#  backend = vault_ldap_auth_backend.ldap.path
#}