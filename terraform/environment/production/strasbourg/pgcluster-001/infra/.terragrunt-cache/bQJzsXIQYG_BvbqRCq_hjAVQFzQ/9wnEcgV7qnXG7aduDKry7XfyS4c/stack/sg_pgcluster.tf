###
# pgcluster
###
resource "openstack_networking_secgroup_v2" "pgcluster" {
  name        = "pgcluster_allowed_resources"
  description = "allowed resource to access pgcluster"
}

###
# PG endpoint
###
resource "openstack_networking_secgroup_rule_v2" "admin_to_pgcluster" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_group_id  = openstack_networking_secgroup_v2.admin.id
  security_group_id = openstack_networking_secgroup_v2.pgcluster.id
}

resource "openstack_networking_secgroup_rule_v2" "haproxy_to_pgcluster" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_group_id  = openstack_networking_secgroup_v2.haproxy.id
  security_group_id = openstack_networking_secgroup_v2.pgcluster.id
}

resource "openstack_networking_secgroup_rule_v2" "pgcluster_replication" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_group_id  = openstack_networking_secgroup_v2.pgcluster.id
  security_group_id = openstack_networking_secgroup_v2.pgcluster.id
}

###
# Patroni API
###
resource "openstack_networking_secgroup_rule_v2" "admin_to_patroni" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8008
  port_range_max    = 8008
  remote_group_id  = openstack_networking_secgroup_v2.admin.id
  security_group_id = openstack_networking_secgroup_v2.pgcluster.id
}

resource "openstack_networking_secgroup_rule_v2" "haproxy_to_patroni" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 8008
  port_range_max    = 8008
  remote_group_id  = openstack_networking_secgroup_v2.haproxy.id
  security_group_id = openstack_networking_secgroup_v2.pgcluster.id
}