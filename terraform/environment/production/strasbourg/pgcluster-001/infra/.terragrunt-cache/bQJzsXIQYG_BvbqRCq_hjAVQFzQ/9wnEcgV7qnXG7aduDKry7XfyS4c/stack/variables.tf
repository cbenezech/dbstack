variable "service_name" {}
variable "project_id" {}
variable "region" {}
variable "region_azs" {}
variable "region_cidrs" {}
variable "external_allowed_ips" {
  description = "list of ips allowed to connect to our infra from outside"
}

variable "admin_count" {
  description = "number of admin instances"
  default = 3
}

variable "rsa_pubkey" {
  description = "Public key used as bootstrap key pair"
}

variable "bastion_instance_type" {
  description = "compute type for the bastion host"
  default     = "d2-2"
}

variable "admin_instance_type" {
  description = "compute type for the admin host"
  default     = "d2-2"
}