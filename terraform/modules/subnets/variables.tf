variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet (e.g., '192.168.0.0/24')"
  type        = string 
}

variable "lan_subnet_cidr" {
  description = "CIDR block for the LAN subnet (e.g., '192.168.1.0/24')"
  type        = string
}

variable "soc_subnet_cidr" {
  description = "CIDR block for the SOC subnet (e.g., '192.168.253.0/24')"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to attach the subnets"
  type        = string
}
