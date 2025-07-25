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

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  
}