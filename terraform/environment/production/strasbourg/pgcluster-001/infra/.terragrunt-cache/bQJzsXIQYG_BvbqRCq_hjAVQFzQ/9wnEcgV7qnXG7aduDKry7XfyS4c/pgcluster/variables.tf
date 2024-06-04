variable "service_name" {}
variable "project_id" {}
variable "region" {}
variable "region_azs" {}
variable "region_cidrs" {}

variable "haproxy_instance_type" {
  description = "compute type for the bastion host"
  default     = "d2-2"
}

variable "haproxy_instance_count" {
  description = "name of each host"
  default = 1
}

variable "pgcluster_instance_type" {
  description = "compute type for the bastion host"
  default     = "d2-2"
}

variable "pgcluster_instance_count" {
  description = "name of each host"
  default = 2
}

variable "cluster_name" {
  description = "name of each host"
}