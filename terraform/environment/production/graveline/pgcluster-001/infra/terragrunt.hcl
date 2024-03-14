terraform {
  source = "../../../../../modules//pgcluster"
  
  extra_arguments "rsa_aitakes_opts" {
    commands = "${get_terraform_commands_that_need_vars()}"
    arguments = [
      "-var-file=${get_terragrunt_dir()}/../cluster.tfvars",
    ]
  }

}

dependencies {
  paths = ["../../stack"]
}

include {
  path = "${find_in_parent_folders()}"
}

inputs = {
  pgcluster_instance_count = 3
}
