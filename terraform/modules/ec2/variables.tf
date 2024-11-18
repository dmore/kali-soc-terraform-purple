variable "create_kali_purple" {
  description = "Whether to create the Kali Purple instance. Set to true to deploy."
  type        = bool
  default     = true
}

variable "create_kali_violet" {
  description = "Whether to create the Kali Violet instance. Set to true to deploy."
  type        = bool
  default     = true
}

variable "create_kali_eminence" {
  description = "Whether to create the Kali Eminence instance. Set to true to deploy."
  type        = bool
  default     = true
}

variable "create_kali_pearly" {
  description = "Whether to create the Kali Pearly instance. Set to true to deploy."
  type        = bool
  default     = true
}

variable "create_kali_heliotrope" {
  description = "Whether to create the Kali Heliotrope instance. Set to true to deploy."
  type        = bool
  default     = true
}

variable "create_kali_guacamole" {
  description = "Whether to create the Kali Guacamole instance. Set to true to deploy."
  type        = bool
  default     = true
}

variable "create_kali_byzantium" {
  description = "Whether to create the Kali Byzantium instance. Set to true to deploy."
  type        = bool
  default     = true
}

variable "inst_kali_purple" {
  description = "The instance type for the Kali Purple instance."
  type        = string
  default     = "r5a.large"
}

variable "inst_violet" {
  description = "The instance type for the Kali Violet instance."
  type        = string
  default     = "t3a.xlarge"
}

variable "inst_eminence" {
  description = "The instance type for the Kali Eminence instance."
  type        = string
  default     = "t3a.2xlarge"
}

variable "inst_pearly" {
  description = "The instance type for the Kali Pearly instance."
  type        = string
  default     = "t2.medium"
}

variable "inst_heliotrope" {
  description = "The instance type for the Kali Heliotrope instance."
  type        = string
  default     = "t2.medium"
}

variable "instance_type_guacamole" {
  description = "The instance type for the Guacamole instance."
  type        = string
  default     = "t2.medium"
}

variable "instance_type_byzantium" {
  description = "The instance type for the Byzantium instance."
  type        = string
  default     = "t2.medium"
}

variable "amazon_image_id_kali_purple" {
  description = "The Amazon Machine Image (AMI) ID for the Kali Purple instance."
  type        = string
  default     = "ami-0f0e440cf357443a4"
}

variable "amazon_image_id_kali_violet" {
  description = "The Amazon Machine Image (AMI) ID for the Kali Violet instance."
  type        = string
  default     = "ami-0ea952e3e2d36ebad"
}

variable "amazon_image_id_kali_eminence" {
  description = "The Amazon Machine Image (AMI) ID for the Kali Eminence instance."
  type        = string
  default     = "ami-04563635f0999dc56"
}

variable "amazon_image_id_kali_pearly" {
  description = "The Amazon Machine Image (AMI) ID for the Kali Pearly instance."
  type        = string
  default     = "ami-0dbd53121fa982e40"
}

variable "amazon_image_id_kali_heliotrope" {
  description = "The Amazon Machine Image (AMI) ID for the Kali Heliotrope instance."
  type        = string
  default     = "ami-03d8d342a533f5c75"
}

variable "amazon_image_id_guacamole" {
  description = "The Amazon Machine Image (AMI) ID for the Guacamole instance."
  type        = string
  default     = "ami-0d15b4289190035e4"
}

variable "amazon_image_id_byzantium" {
  description = "The Amazon Machine Image (AMI) ID for the Byzantium instance."
  type        = string
  default     = "ami-02d8b8fcc683ef5cc"
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where instances are deployed."
  type        = string
}

variable "lan_subnet_id" {
  description = "The ID of the LAN subnet for internal network communication."
  type        = string
}

variable "soc_subnet_id" {
  description = "The ID of the SOC (Security Operations Center) subnet for secure internal communication."
  type        = string
}

variable "open_security_group_id" {
  description = "The ID of the security group to associate with the instance."
  type        = string
}

variable "purple_ni_id" {
  description = "The network interface ID for the Kali Purple instance."
  type        = string
}

variable "violet_ni_id" {
  description = "The network interface ID for the Kali Violet instance."
  type        = string
}

variable "eminence_ni_id" {
  description = "The network interface ID for the Kali Eminence instance."
  type        = string
}

variable "helio_ni_id" {
  description = "The network interface ID for the Kali Heliotrope instance."
  type        = string
}

variable "pearly_ni_id" {
  description = "The network interface ID for the Kali Pearly instance."
  type        = string
}

variable "byzlan_ni_id" {
  description = "The network interface ID for the Byzantium LAN."
  type        = string
}

variable "guaclan_ni_id" {
  description = "The network interface ID for the Guacamole LAN."
  type        = string
}

variable "guacamole_ni_id" {
  description = "The network interface ID for the Guacamole WAN"
  type        = string
}

variable "byzantium_ni_id" {
  description = "The network interface ID for the Byzantium WAN"
  type        = string
}

variable "soc_ni_id" {
  description = "The network interface ID for the SOC (Security Operations Center) subnet."
  type        = string
}

variable "key_name" {
  description = "The name of the EC2 key pair to use for the instances."
  type        = string
}

variable "ssm_role_name" {
  description = "The name of the IAM role for SSM to use with the instances."
  type        = string
}

variable "attach_lan_interface" {
  description = "Whether to attach the LAN interface to the Byzantium instance."
  type        = bool
  default     = true
}

variable "ssm_role_name_guacamole" {
  description = "The name of the IAM instance profile for Guacamole instances."
  type        = string
}
