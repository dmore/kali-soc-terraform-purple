variable "key_name" {
  type        = string
  description = "The name of the EC2 key pair to use for the instances"
  default     = "kali-purple-key"
}
variable "ssh_location" {
  description = "The IP address range that can be used to access the instances using SSH"
  type        = string
  default     = "0.0.0.0/0"
}
variable "public_subnet_cidr" {
  type        = string
  default     = "192.168.0.0/24"
  description = "CIDR block for the public subnet"
}

variable "lan_subnet_cidr" {
  type        = string
  default     = "192.168.1.0/24"
  description = "CIDR block for the LAN subnet"
}

variable "soc_subnet_cidr" {
  type        = string
  default     = "192.168.253.0/24"
  description = "CIDR block for the SOC subnet"
}
