variable "service_name" {}
variable "project_id" {}
variable "region" {}
variable "region_azs" {}
variable "region_cidrs" {}

variable "haproxy_instance_type" {
  description = "compute type for haproxy host"
  default     = "d2-2"
}

variable "haproxy_instance_count" {
  description = "count of haproxy instance"
  default = 2
}

variable "pgcluster_instance_type" {
  description = "compute type for postgresql instance host"
  default     = "d2-2"
}

variable "pgcluster_instance_count" {
  description = "count of postgresql instance"
  default = 2
}

variable "cluster_name" {
  description = "name of the postgresql cluster"
}