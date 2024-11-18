resource "aws_eip" "eip" {
  count = var.create_eip ? 1 : 0
}

resource "aws_eip_association" "eip_association" {
  count                = var.create_eip ? 1 : 0
  allocation_id        = aws_eip.eip[count.index].id
  network_interface_id = var.network_interface_id
}

output "eip_public_ip" {
  value       = aws_eip.eip[0].public_ip
  description = "Public IP address of the Elastic IP"
}
