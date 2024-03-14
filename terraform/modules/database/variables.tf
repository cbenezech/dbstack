variable "service_name" {}
variable "project_id" {}
variable "region" {}
variable "region_azs" {}
variable "region_cidrs" {}

variable "database_name" {
  description = "name of the database"
}

variable "cluster_name" {
  description = "name of the postgresql cluster"
}