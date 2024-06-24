data "terraform_remote_state" "stack" {
  backend = "local"
  config = {
    path = "/home/cbenezech/development/dbstack/terraform/states/stack.tfstate"
  }
}
