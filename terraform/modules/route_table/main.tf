# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "Kali VPC | PublicRouteTable"
  }
}

# LAN Route Table
resource "aws_route_table" "lan_route_table" {
  vpc_id = var.vpc_id

  # Route all traffic through LANNI
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = var.lan_network_interface_id  # LANNI
  }

  # Route VPN traffic to LANNI
  route {
    cidr_block           = "10.1.22.0/24"
    network_interface_id = var.lan_network_interface_id
  }

  tags = {
    Name = "Kali SOC | Private Route Table LAN"
  }
}


# SOC Route Table
resource "aws_route_table" "soc_route_table" {
  vpc_id = var.vpc_id

  # Route all traffic through SOCNI
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = var.soc_network_interface_id  # SOCNI
  }

  # Route VPN traffic to SOCNI
  route {
    cidr_block           = "10.1.22.0/24"
    network_interface_id = var.soc_network_interface_id
  }

  tags = {
    Name = "Kali SOC | Private Route Table SOC"
  }
}


# Route Table Associations
resource "aws_route_table_association" "public_subnet_assoc" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "lan_subnet_assoc" {
  subnet_id      = var.lan_subnet_id
  route_table_id = aws_route_table.lan_route_table.id
}

resource "aws_route_table_association" "soc_subnet_assoc" {
  subnet_id      = var.soc_subnet_id
  route_table_id = aws_route_table.soc_route_table.id
}