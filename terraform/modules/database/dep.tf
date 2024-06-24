data "terraform_remote_state" "pgcluster" {
  backend = "local"
  config = {
    path = "/home/cbenezech/development/dbstack/terraform/states/pgcluster.tfstate"
  }
}
