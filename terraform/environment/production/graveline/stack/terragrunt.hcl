terraform {
  source = "../../../../modules//stack"

  extra_arguments "rsa_opts" {
    commands = "${get_terraform_commands_that_need_vars()}"
    arguments = [
      "-var-file=${get_terragrunt_dir()}/../../ssh/id_rsa.pub.tfvars",
    ]
  }
}
include {
  path = "${find_in_parent_folders()}"
}

inputs = {
}