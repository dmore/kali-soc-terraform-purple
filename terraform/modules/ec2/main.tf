resource "aws_instance" "kali_instances" {
  for_each = { for k, v in local.instances : k => v if v.create }

  ami           = each.value.ami_id
  instance_type = each.value.instance_type
  key_name      = var.key_name

  # Attach primary network interface (device_index = 0)
  network_interface {
    network_interface_id = each.value.network_interface_ids[0]
    device_index         = 0
  }

  # Attach additional network interfaces (device_index > 0)
  dynamic "network_interface" {
    for_each = slice(each.value.network_interface_ids, 1, length(each.value.network_interface_ids))
    content {
      network_interface_id = network_interface.value
      device_index         = index(slice(each.value.network_interface_ids, 1, length(each.value.network_interface_ids)), network_interface.value) + 1
    }
  }

  iam_instance_profile = each.key == "guacamole" ? var.ssm_role_name_guacamole : var.ssm_role_name

  root_block_device {
    volume_type = "gp2"
    volume_size = each.value.volume_size
    encrypted   = true
  }

  tags = {
    Name = "Kali SOC | ${each.key}"
  }

  # Conditional User Data for instances with "kali" in the name
  user_data = startswith(lower(each.key), "kali") ? (
    <<-EOT
    #!/bin/bash
    # Update the system
    apt-get update -y

    # Change SSH settings to allow password authentication
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
    service sshd restart

    # Set default user password (replace with a more secure method later)
    echo 'kali:kali2023' | chpasswd
    EOT
  ) : null
}
