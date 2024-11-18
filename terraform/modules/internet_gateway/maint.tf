variable "vpc_id" {
  description = "The ID of the VPC to attach the Internet Gateway to"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Kali VPC | InternetGateway"
  }
}

output "internet_gateway_id" {
  description = "The ID of the created Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
