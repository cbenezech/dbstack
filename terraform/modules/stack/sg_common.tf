###
# common
###
resource "openstack_networking_secgroup_v2" "common" {
  name        = "common"
  description = "allow common access"
}

resource "openstack_networking_secgroup_rule_v2" "internal_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_group_id   = openstack_networking_secgroup_v2.bastion.id
  security_group_id = openstack_networking_secgroup_v2.common.id
}

resource "openstack_networking_secgroup_rule_v2" "common_consul_gossip_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8300
  port_range_max    = 8300
  remote_group_id   = openstack_networking_secgroup_v2.common.id
  security_group_id = openstack_networking_secgroup_v2.common.id
}

resource "openstack_networking_secgroup_rule_v2" "common_consul_gossip_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 8300
  port_range_max    = 8300
  remote_group_id   = openstack_networking_secgroup_v2.common.id
  security_group_id = openstack_networking_secgroup_v2.common.id
}

resource "openstack_networking_secgroup_rule_v2" "common_consul_rpc_tcp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8301
  port_range_max    = 8301
  remote_group_id   = openstack_networking_secgroup_v2.common.id
  security_group_id = openstack_networking_secgroup_v2.common.id
}

resource "openstack_networking_secgroup_rule_v2" "common_consul_rpc_udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 8301
  port_range_max    = 8301
  remote_group_id   = openstack_networking_secgroup_v2.common.id
  security_group_id = openstack_networking_secgroup_v2.common.id
}

resource "openstack_networking_secgroup_rule_v2" "common_consul_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8500
  port_range_max    = 8500
  remote_group_id   = openstack_networking_secgroup_v2.common.id
  security_group_id = openstack_networking_secgroup_v2.common.id
}