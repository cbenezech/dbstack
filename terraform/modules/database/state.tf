terraform {
  backend "local" {
    path = "/home/cbenezech/development/dbstack/terraform/states/database.tfstate"
  }

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }

    ovh = {
      source  = "ovh/ovh"
    }

    postgresql = {
      source = "cyrilgdn/postgresql"
    }
  }
}

provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/"    # URL d'authentification
  domain_name = "default"                           # Nom de domaine - Toujours à "default" pour OVHcloud
  alias       = "ovh"                               # Un alias
}

provider "ovh" {
  alias              = "ovh"
  endpoint           = "ovh-eu"
}

provider "postgresql" {
  host            = data.terraform_remote_state.pgcluster.outputs.cluster_endpoint_ip
  port            = 5432
  database        = "postgres"
  username        = "admin"
  password        = "admin"
  sslmode         = "disable"
  superuser       = false
  connect_timeout = 15
}