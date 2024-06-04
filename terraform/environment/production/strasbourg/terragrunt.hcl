remote_state {
  backend = "s3"
  config = {
    acl             = "bucket-owner-full-control"
    dynamodb_table  = "production-europe-terraform"
    bucket          = "adjuntocloud-production-europe-terraform"
    key             = "sbg5/${path_relative_to_include()}/terraform.tfstate"
    region          = "eu-west-3"
    encrypt         = true
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
