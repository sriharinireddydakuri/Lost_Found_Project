variable "vpc_cidr" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "destination_cidr_block" {
  default = "0.0.0.0/0"
}
variable "project_name" {
  default = "project"
}
variable "environment" {
  default = "dev"
}
