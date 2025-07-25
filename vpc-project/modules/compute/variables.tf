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

variable "public_subnet_id" {
  description = "The ID of the public subnet where the instance will be launched"
  type        = string 
}

variable "public_sg_id" {
  description = "The ID of the security group for the public instance"
  type        = string
  
}

variable "private_subnet_id" {
  description = "The ID of the private subnet where the instance will be launched"
  type        = string 
  
}

variable "private_sg_id" {
  description = "The ID of the security group for the private instance"
  type        = string
  
}

