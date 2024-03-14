###
# Bastion
###
resource "openstack_networking_secgroup_v2" "bastion" {
  name        = "bastion_allowed_resources"
  description = "allow access from public network to instance"
}

resource "openstack_networking_secgroup_rule_v2" "external_ssh" {
  count = length(var.external_allowed_ips)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "${var.external_allowed_ips[count.index]}/32"
  security_group_id = openstack_networking_secgroup_v2.bastion.id
}