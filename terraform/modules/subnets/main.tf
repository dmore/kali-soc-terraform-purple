data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnet" {
  # Public subnet for instances that need access to the internet
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Kali VPC | Public Subnet"
  }
}

resource "aws_subnet" "lan_subnet" {
  # LAN subnet for internal resources without public internet access
  vpc_id                  = var.vpc_id
  cidr_block              = var.lan_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "Kali VPC | LAN Subnet"
  }
}

resource "aws_subnet" "soc_subnet" {
  # SOC subnet dedicated for security operations, kept private
  vpc_id                  = var.vpc_id
  cidr_block              = var.soc_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "Kali VPC | SOC Subnet"
  }
}
