variable "ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "ingress_protocol" {
  description = "The protocol for the ingress rule (e.g., tcp, udp)"
  type        = string 
}


variable "egress_protocol" {
  description = "The protocol for the egress rule (e.g., tcp, udp)"
  type        = string
  default = "-1"  
}

variable "my_specific_ip" {
  description = "Your specific IP address for SSH access"
  type        = string
}

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



