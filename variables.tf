variable "region" {
  default = "us-east-1"
}
variable "key_name" {
  default = "nhlprod2020"
}
variable "vpc_cidr" {
  default = "140.0.0.0/16"
}
variable "subnet1" {
    default = "140.0.1.0/24"
}
variable "subnet2" {
    default = "140.0.2.0/24"
}
variable "subnet3" {
    default = "140.0.3.0/24"
}
variable "rds_is_local" {
    default =0
}