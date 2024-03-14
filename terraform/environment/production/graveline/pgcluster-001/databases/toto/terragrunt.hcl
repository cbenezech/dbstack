terraform {
  source = "../../../../../../modules//database"
  
  extra_arguments "rsa_aitakes_opts" {
    commands = "${get_terraform_commands_that_need_vars()}"
    arguments = [
      "-var-file=${get_terragrunt_dir()}/../../cluster.tfvars",
    ]
  }

}

dependencies {
  paths = ["../../../stack", "../../infra"]
}

include {
  path = "${find_in_parent_folders()}"
}

inputs = {
  database_name = "toto"
}
