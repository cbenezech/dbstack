remote_state {
  backend = "swift"
  config = {
    container = "cbenezech-gra-terraform-${replace(path_relative_to_include(), "/", "-")}"
    region_name = "GRA"
    cloud = "openstack" 
    archive_container = "cbenezech-gra-terraform-${replace(path_relative_to_include(), "/", "-")}-archive"
  }
}



terraform {
  extra_arguments "region_var" {
    commands  = "${get_terraform_commands_that_need_vars()}"

    required_var_files = [
        "${get_parent_terragrunt_dir()}/region.tfvars",
        "${get_parent_terragrunt_dir()}/../environment.tfvars",
        "${get_parent_terragrunt_dir()}/../../common.tfvars",
    ]
  }
}
