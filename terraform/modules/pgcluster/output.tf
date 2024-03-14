output "cluster_endpoint_ip" {
  value = openstack_compute_instance_v2.haproxy[0].access_ip_v4
}