provider "aws" {
  region = "us-east-1" 
  profile = "terraform-user"
}

module "network" {
  source                    = "./modules/network"
  vpc_cidr_block            = var.vpc_cidr_block
  vpc_name                  = var.vpc_name
  availability_zone         = var.availability_zone
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
}

module "compute" {
  source               = "./modules/compute"
  aws_vpc_id           = module.network.vpc_id
  public_subnet_id     = module.network.public_subnet_id
  private_subnet_id    = module.network.private_subnet_id
  my_ip_cidr_block     = var.my_ip_cidr_block
}