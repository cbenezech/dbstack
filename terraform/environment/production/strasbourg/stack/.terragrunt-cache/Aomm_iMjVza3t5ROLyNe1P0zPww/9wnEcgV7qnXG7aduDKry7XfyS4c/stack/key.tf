resource "openstack_compute_keypair_v2" "bootstrap_key" {
  provider   = openstack.ovh             # Nom du fournisseur déclaré dans provider.tf
  name       = "bootsrap_key"            # Nom de la clé SSH à utiliser pour la création
  public_key = var.rsa_pubkey            # Chemin vers votre clé SSH précédemment générée
}