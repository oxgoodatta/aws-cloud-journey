variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string  
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string  
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string  
}

variable "subnet_availability_zone" {
  description = "The availability zone for the public subnet"
  type        = string  
  
}