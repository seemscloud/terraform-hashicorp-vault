#####################################
#
#   Auth LDAP
#
resource "vault_ldap_auth_backend" "ldap" {
  path = "ldap"

  url = "ldap://openldap:1389"

  username_as_alias       = true
  token_no_default_policy = true

  binddn   = "cn=admin,dc=seems,dc=cloud"
  bindpass = "admin"

  userattr = "cn"
  userdn   = "ou=users,dc=seems,dc=cloud"

  groupattr = "ou"
  groupdn   = "cn=groups,ou=users,dc=seems,dc=cloud"
}