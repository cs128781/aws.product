## Main file for infrastructure for aws provisioning##

provider "aws" {
    region=var.region
    version = "~> 2.4"
}

module "networks" {
  source = "git::https://cs128781:Deco2051@github.com:cs128781/aws.network.git"
  region=var.region
  key_name=var.key_name
  vpc_cidr=var.vpc_cidr
  subnet1=var.subnet1
  subnet2=var.subnet2
  subnet3=var.subnet3
}

module "rds" {
  source = "git::https://cs128781:Deco2051@github.com:cs128781/aws.rds.git"
  key_name=var.key_name
  Rsubnet1=module.networks.subtnet1_out
  Rsubnet2=module.networks.subtnet2_out
  Rsubnet3=module.networks.subtnet3_out
  is_local=var.rds_is_local
}
module "bastion" {
  key_name=var.key_name
  source = "git::https://cs128781:Deco2051@github.com:cs128781/aws.bastion.git"
  Rsubnet1=module.networks.subtnet1_out
  Rvpcid=module.networks.vpc_id_out
  is_local=var.rds_is_local
}
