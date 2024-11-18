# modules/route_table/variables.tf

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
}

variable "lan_subnet_id" {
  description = "The ID of the LAN subnet"
  type        = string
}

variable "soc_subnet_id" {
  description = "The ID of the SOC subnet"
  type        = string
}

variable "lan_network_interface_id" {
  description = "The ID of the LAN network interface"
  type        = string
}

variable "soc_network_interface_id" {
  description = "The ID of the SOC network interface"
  type        = string
}

variable "lan_subnet_cidr" {
  description = "CIDR block for the LAN subnet"
  type        = string
  default     = "192.168.1.0/24"
}

variable "soc_subnet_cidr" {
  description = "CIDR block for the SOC subnet"
  type        = string
  default     = "192.168.253.0/24"
}
variable "wan_network_interface_id" {
  description = "WAN Intereface"
  type        = string
}