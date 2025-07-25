#coding from scratch with no variables or modules. I'm just trying to learn it without ai help.

#provider
provider "aws"{
    region = "us-east-1"
    profile = "terraform-user"
}

module "network" {
    source = "./modules/network"
    vpc_cidr_block = var.vpc_cidr_block
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    subnet_availability_zone = var.subnet_availability_zone
  
}

module "compute" {
    source = "./modules/compute"
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    public_subnet_id  = module.network.public_subnet_id
    private_subnet_id = module.network.private_subnet_id
    public_sg_id      = module.security.public_sg_id
    private_sg_id     = module.security.private_sg_id
}

module "security" {
    source = "./modules/security"
    my_specific_ip = var.my_specific_ip
    ingress_protocol = var.ingress_protocol
    egress_protocol = var.egress_protocol
    vpc_id = module.network.vpc_id
}


