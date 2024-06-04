###
# haproxy
###
resource "openstack_networking_secgroup_v2" "haproxy" {
  name        = "haproxy_allowed_resources"
  description = "allowed resource to access haproxy"
}

###
# HAProxy stats
###
resource "openstack_networking_secgroup_rule_v2" "haproxy_stats" {
  count = length(var.external_allowed_ips)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 7000
  port_range_max    = 7000
  remote_ip_prefix  = "${var.external_allowed_ips[count.index]}/32"
  security_group_id = openstack_networking_secgroup_v2.haproxy.id
}

resource "openstack_networking_secgroup_rule_v2" "haproxy_consul" {
  count = length(var.external_allowed_ips)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 9500
  port_range_max    = 9500
  remote_ip_prefix  = "${var.external_allowed_ips[count.index]}/32"
  security_group_id = openstack_networking_secgroup_v2.haproxy.id
}

resource "openstack_networking_secgroup_rule_v2" "haproxy_pgadmin" {
  count = length(var.external_allowed_ips)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "${var.external_allowed_ips[count.index]}/32"
  security_group_id = openstack_networking_secgroup_v2.haproxy.id
}

resource "openstack_networking_secgroup_rule_v2" "haproxy_postgres_rw" {
  count = length(var.external_allowed_ips)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5432
  port_range_max    = 5432
  remote_ip_prefix  = "${var.external_allowed_ips[count.index]}/32"
  security_group_id = openstack_networking_secgroup_v2.haproxy.id
}

resource "openstack_networking_secgroup_rule_v2" "haproxy_postgres_ro" {
  count = length(var.external_allowed_ips)
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 5433
  port_range_max    = 5433
  remote_ip_prefix  = "${var.external_allowed_ips[count.index]}/32"
  security_group_id = openstack_networking_secgroup_v2.haproxy.id
}