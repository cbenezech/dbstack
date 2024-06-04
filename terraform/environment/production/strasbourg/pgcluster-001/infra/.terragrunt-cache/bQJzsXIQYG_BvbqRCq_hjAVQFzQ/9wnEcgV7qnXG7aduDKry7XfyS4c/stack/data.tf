data "openstack_images_image_ids_v2" "base" {
  name_regex  = "^base*"
  sort        = "updated_at"
}

data "openstack_networking_network_v2" "external_network" {
  count     = length(var.region_azs)
  name      = "Ext-Net"
  region    = element(var.region_azs, count.index)
}

data "template_file" "bastion" {
  template = "${file("${path.module}/templates/cloud-config-bastion.yml.tpl")}"

  vars = {
  }
}

data "template_cloudinit_config" "bastion" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "cloud-config.yml"
    content_type = "text/cloud-config"
    content      = "${data.template_file.bastion.rendered}"
  }
}

data "template_file" "admin" {
  template = "${file("${path.module}/templates/cloud-config-admin.yml.tpl")}"

  vars = {
  }
}

data "template_cloudinit_config" "admin" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "cloud-config.yml"
    content_type = "text/cloud-config"
    content      = "${data.template_file.admin.rendered}"
  }
}