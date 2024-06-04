data "openstack_images_image_ids_v2" "pgcluster" {
  name_regex  = "^postgresql*"
  sort        = "updated_at"
}

data "template_file" "pgcluster" {
  template = "${file("${path.module}/templates/cloud-config-pgcluster.yml.tpl")}"

  vars = {
    cluster_name = var.cluster_name
  }
}

data "openstack_images_image_ids_v2" "haproxy" {
  name_regex  = "^haproxy*"
  sort        = "updated_at"
}

data "template_file" "main" {
  template = "${file("${path.module}/templates/cloud-config-haproxy.yml.tpl")}"

  vars = {
    cluster_name = var.cluster_name
  }
}

data "template_cloudinit_config" "pgcluster" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "cloud-config.yml"
    content_type = "text/cloud-config"
    content      = "${data.template_file.pgcluster.rendered}"
  }
}

data "template_file" "haproxy" {
  template = "${file("${path.module}/templates/cloud-config-haproxy.yml.tpl")}"

  vars = {
    cluster_name = var.cluster_name
  }
}

data "template_cloudinit_config" "haproxy" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "cloud-config.yml"
    content_type = "text/cloud-config"
    content      = "${data.template_file.haproxy.rendered}"
  }
}