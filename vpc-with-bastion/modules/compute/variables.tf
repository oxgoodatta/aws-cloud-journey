variable "public_subnet_id" {
  description = "Public Subnet ID"
  type        = string
}

variable "private_subnet_id" {
  description = "Private Subnet ID"
  type        = string
}

variable "aws_vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "my_ip_cidr_block" {
  description = "Your IP address to allow SSH"
  type        = string
}
