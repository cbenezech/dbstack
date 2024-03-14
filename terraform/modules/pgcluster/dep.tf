data "terraform_remote_state" "stack" {
  backend = "swift"

  config = {
    container = "cbenezech-gra-terraform-stack"
    region_name = "GRA"
    cloud = "openstack"
  }
}
