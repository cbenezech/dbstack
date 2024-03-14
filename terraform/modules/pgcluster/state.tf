terraform {
  backend "swift" {
  }

  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }

    ovh = {
      source  = "ovh/ovh"
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