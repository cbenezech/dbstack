data "terraform_remote_state" "stack" {
  backend = "s3"

  config = {
    bucket = "adjuntocloud-production-europe-terraform"
    key    = "sbg5/stack/terraform.tfstate"
    region = "eu-west-3"
  }
}
