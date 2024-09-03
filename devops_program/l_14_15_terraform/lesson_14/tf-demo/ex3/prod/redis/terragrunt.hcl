#terraform {
#  source = "git::git@github.com:acme/infrastructure-modules.git//networking/vpc?ref=v0.0.1"
#}
include "root" {
  path = find_in_parent_folders()
}
terraform {
  source = "../../modules/redis"
}