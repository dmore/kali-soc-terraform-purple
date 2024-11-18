variable "lan_subnet_id" {
  description = "The ID of the LAN subnet for internal communication within the VPC."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet for internal communication within the VPC."
  type        = string
}

variable "soc_subnet_id" {
  description = "The ID of the SOC subnet for secure communication and operations."
  type        = string
}

variable "open_security_group_id" {
  description = "The ID of the security group that allows traffic into the instances."
  type        = string
}