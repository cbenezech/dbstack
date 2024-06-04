data "terraform_remote_state" "pgcluster" {
  backend = "swift"

  config = {
    container = "cbenezech-gra-terraform-${var.cluster_name}-infra"
    region_name = "GRA"
    cloud = "openstack"
  }
}
