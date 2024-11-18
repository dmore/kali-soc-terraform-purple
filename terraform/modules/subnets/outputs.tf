output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "lan_subnet_id" {
  value = aws_subnet.lan_subnet.id
}

output "soc_subnet_id" {
  value = aws_subnet.soc_subnet.id
}