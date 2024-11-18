# Declare Byzantium WAN Network Interface
resource "aws_network_interface" "byzni" {
  subnet_id         = var.public_subnet_id
  private_ips       = ["192.168.0.50"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Byzantium WAN Network Interface"
  }
}

# Declare Guacamole WAN Network Interface
resource "aws_network_interface" "guacni" {
  subnet_id         = var.public_subnet_id
  private_ips       = ["192.168.0.60"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Guacamole WAN Network Interface"
  }
}

# Declare Guacamole LAN Network Interface
resource "aws_network_interface" "guaclanni" {
  subnet_id         = var.lan_subnet_id
  private_ips       = ["192.168.1.30"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Guacamole LAN Network Interface"
  }
}

# Declare Violet Network Interface
resource "aws_network_interface" "violetni" {
  subnet_id         = var.soc_subnet_id
  private_ips       = ["192.168.253.107"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Violet SOC Network Interface"
  }
}

# Declare Eminence Network Interface
resource "aws_network_interface" "eminenceni" {
  subnet_id         = var.soc_subnet_id
  private_ips       = ["192.168.253.103"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Eminence SOC Network Interface"
  }
}

# Declare Heliotrope Network Interface
resource "aws_network_interface" "helioni" {
  subnet_id         = var.lan_subnet_id
  private_ips       = ["192.168.1.20"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Heliotrope LAN Network Interface"
  }
}

# Declare Pearly Network Interface
resource "aws_network_interface" "pearlyni" {
  subnet_id         = var.lan_subnet_id
  private_ips       = ["192.168.1.70"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Pearly LAN Network Interface"
  }
}

# Declare Purple Network Interface
resource "aws_network_interface" "purpleni" {
  subnet_id         = var.soc_subnet_id
  private_ips       = ["192.168.253.105"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Purple SOC Network Interface"
  }
}

# Declare LAN Network Interface
resource "aws_network_interface" "lanni" {
  subnet_id         = var.lan_subnet_id
  private_ips       = ["192.168.1.10"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Byzantium LAN Network Interface"
  }
}

# Declare SOC Network Interface
resource "aws_network_interface" "socni" {
  subnet_id         = var.soc_subnet_id
  private_ips       = ["192.168.253.101"]
  security_groups   = [var.open_security_group_id]
  source_dest_check = false

  tags = {
    Name = "Kali SOC | Byzantium SOC Network Interface"
  }
}
