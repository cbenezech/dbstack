resource "openstack_compute_instance_v2" "bastion" {
  count       = length(var.region_azs)
  name        = "bastion-${count.index +1}"
  provider    = openstack.ovh
  image_id    = tolist(data.openstack_images_image_ids_v2.base.ids)[0]
  flavor_name = var.bastion_instance_type
  user_data   = data.template_cloudinit_config.bastion.rendered
  region      = element(var.region_azs, count.index)           

  key_pair    = openstack_compute_keypair_v2.bootstrap_key.name

  security_groups = [
    openstack_networking_secgroup_v2.bastion.name, 
    openstack_networking_secgroup_v2.common.name
  ]

  network {
    name      = "Ext-Net"
  }

  network {
    name      = openstack_networking_network_v2.main[0].name
  }

  depends_on = [
    "openstack_compute_instance_v2.admin"
  ]
}

resource "openstack_compute_instance_v2" "admin" {
  count       = var.admin_count
  name        = "admin-${count.index +1}"
  provider    = openstack.ovh
  image_id    = tolist(data.openstack_images_image_ids_v2.base.ids)[0]
  flavor_name = var.admin_instance_type   
  user_data   = data.template_cloudinit_config.admin.rendered              
  key_pair    = openstack_compute_keypair_v2.bootstrap_key.name

  security_groups = [
    openstack_networking_secgroup_v2.admin.name, 
    openstack_networking_secgroup_v2.common.name
  ]

  network {
    name      = openstack_networking_network_v2.main[0].name
    fixed_ip_v4 = "192.168.100.${10 + count.index}"
  }
}