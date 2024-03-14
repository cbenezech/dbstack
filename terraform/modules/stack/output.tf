output "internal_network_name" {
  value = openstack_networking_network_v2.main[0].name
}

output "internal_network_id" {
  value = openstack_networking_network_v2.main[0].id
}

output "key_pair_name" {
  value = openstack_compute_keypair_v2.bootstrap_key.name
}

output "sg_common_name" {
  value = openstack_networking_secgroup_v2.common.name
}

output "sg_pgcluster_name" {
  value = openstack_networking_secgroup_v2.pgcluster.name
}

output "sg_admin_name" {
  value = openstack_networking_secgroup_v2.admin.name
}

output "sg_haproxy_name" {
  value = openstack_networking_secgroup_v2.haproxy.name
}
