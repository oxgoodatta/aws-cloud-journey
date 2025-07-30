variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc"
}


variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
  
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  type        = string
  
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  type        = string
  
}

variable "my_ip_cidr_block" {
  description = "Your IP address in CIDR notation to allow SSH access"
  type        = string
}





