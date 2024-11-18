output "instance_ids" {
  value = { for k, v in aws_instance.kali_instances : k => v.id }
}

output "instance_private_ips" {
  value = { for k, v in aws_instance.kali_instances : k => v.private_ip }
}