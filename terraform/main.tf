module "iam" {
  source = "./modules/iam"
}

module "vpc" {
  source = "./modules/vpc"
}

module "awskey" {
  source = "./modules/awskey"
}

module "elastic_ip_byzantium" {
  source = "./modules/elastic_ip"
  create_eip            = true
  network_interface_id  = module.network_interfaces.byzni_id
}

module "elastic_ip_guacamole" {
  source = "./modules/elastic_ip"
  create_eip            = true
  network_interface_id  = module.network_interfaces.guac_id
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
  lan_subnet_cidr    = var.lan_subnet_cidr
  soc_subnet_cidr    = var.soc_subnet_cidr
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "network_interfaces" {
  source = "./modules/network_interfaces"
  public_subnet_id       = module.subnets.public_subnet_id
  lan_subnet_id          = module.subnets.lan_subnet_id
  soc_subnet_id          = module.subnets.soc_subnet_id
  open_security_group_id = module.security_groups.open_security_group_id
}

module "route_tables" {
  source = "./modules/route_table"

  vpc_id                   = module.vpc.vpc_id
  internet_gateway_id      = module.internet_gateway.internet_gateway_id
  public_subnet_id         = module.subnets.public_subnet_id
  lan_subnet_id            = module.subnets.lan_subnet_id
  soc_subnet_id           = module.subnets.soc_subnet_id
  lan_network_interface_id = module.network_interfaces.lanni_id
  soc_network_interface_id = module.network_interfaces.socni_id
  wan_network_interface_id = module.network_interfaces.byzni_id
  lan_subnet_cidr         = var.lan_subnet_cidr
  soc_subnet_cidr         = var.soc_subnet_cidr
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id       = module.vpc.vpc_id
  ssh_location = var.ssh_location
  lan_subnet_cidr  = var.lan_subnet_cidr
  soc_subnet_cidr  = var.soc_subnet_cidr
}

module "ec2" {
  source = "./modules/ec2"

  open_security_group_id = module.security_groups.open_security_group_id

  public_subnet_id       = module.subnets.public_subnet_id
  lan_subnet_id          = module.subnets.lan_subnet_id
  soc_subnet_id          = module.subnets.soc_subnet_id

  byzantium_ni_id        = module.network_interfaces.byzni_id
  guacamole_ni_id        = module.network_interfaces.guac_id

  byzlan_ni_id           = module.network_interfaces.lanni_id
  guaclan_ni_id          = module.network_interfaces.guaclanid

  purple_ni_id           = module.network_interfaces.purpleni_id
  violet_ni_id           = module.network_interfaces.violetni_id
  eminence_ni_id         = module.network_interfaces.eminenceni_id
  helio_ni_id            = module.network_interfaces.helioni_id
  soc_ni_id              = module.network_interfaces.socni_id
  pearly_ni_id           = module.network_interfaces.pearlyni_id

  key_name               = var.key_name
  ssm_role_name          = module.iam.kali_purple_ssm_full_access_instance_profile_name
  ssm_role_name_guacamole = module.iam.kali_purple_guacamole_instance_profile_name
}
