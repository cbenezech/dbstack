resource "openstack_networking_network_v2" "main" {
  count          = length(var.region_azs)
  name           = "adjuntocloud-${element(var.region_azs, count.index)}"
  admin_state_up = "true"
  region         = element(var.region_azs, count.index)
}

resource "openstack_networking_subnet_v2" "main" {
  count      = length(var.region_azs)
  network_id = openstack_networking_network_v2.main[count.index].id
  cidr       = element(var.region_cidrs, count.index)
  region     = element(var.region_azs, count.index)

  lifecycle {
    ignore_changes = [
      dns_nameservers,
    ]
  }
}

