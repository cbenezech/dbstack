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
