variable "create_eip" {
  description = "Boolean flag to create Elastic IP"
  type        = bool
}

variable "network_interface_id" {
  description = "The ID of the network interface to associate the Elastic IP with"
  type        = string
}
