resource "openstack_compute_instance_v2" "pgcluster" {
  count       = var.pgcluster_instance_count
  name        = "${var.cluster_name}-db-${count.index + 1}"
  provider    = openstack.ovh
  image_id    = tolist(data.openstack_images_image_ids_v2.pgcluster.ids)[0]
  flavor_name = var.pgcluster_instance_type
  user_data   = data.template_cloudinit_config.pgcluster.rendered
  key_pair    = data.terraform_remote_state.stack.outputs.key_pair_name

  security_groups = [
    data.terraform_remote_state.stack.outputs.sg_pgcluster_name, 
    data.terraform_remote_state.stack.outputs.sg_common_name
  ]

  network {
    name      = data.terraform_remote_state.stack.outputs.internal_network_name
  }
}

resource "openstack_compute_instance_v2" "haproxy" {
  count       = var.haproxy_instance_count
  name        = "${var.cluster_name}-lb-${count.index + 1}"
  provider    = openstack.ovh
  image_id    = tolist(data.openstack_images_image_ids_v2.haproxy.ids)[0]
  flavor_name = var.haproxy_instance_type                 
  user_data   = data.template_cloudinit_config.haproxy.rendered
  key_pair    = data.terraform_remote_state.stack.outputs.key_pair_name

  security_groups = [
    data.terraform_remote_state.stack.outputs.sg_haproxy_name, 
    data.terraform_remote_state.stack.outputs.sg_common_name
  ]

  network {
    name      = data.terraform_remote_state.stack.outputs.internal_network_name
  }

  depends_on = [
    "openstack_compute_instance_v2.pgcluster"
  ]
}