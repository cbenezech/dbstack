###
# admin
###
resource "openstack_networking_secgroup_v2" "admin" {
  name        = "admin_allowed_resources"
  description = "allowed resource to admin"
}