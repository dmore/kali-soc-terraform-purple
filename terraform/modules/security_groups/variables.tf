variable "vpc_id" {
  description = "The ID of the VPC to attach the network interfaces to. This ID is typically provided when creating or referencing a VPC."
}

variable "ssh_location" {
  description = "The CIDR block for allowed SSH access. This should be restricted to trusted IP addresses for enhanced security."
  type        = string
  default     = "0.0.0.0/0" # Define as default for open access, but ideally should be replaced with a trusted IP range.
}

variable "lan_subnet_cidr" {
  description = "CIDR block for the LAN Subnet (e.g., '192.168.1.0/24')"
  type        = string
}
variable "soc_subnet_cidr" {
  description = "CIDR block for the SOC Subnet (e.g., '192.168.253.0/24')"
  type        = string
}