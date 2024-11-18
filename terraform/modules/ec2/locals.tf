locals {
  instances = {
    kali_purple = {
      create               = var.create_kali_purple
      instance_type        = var.inst_kali_purple
      ami_id               = var.amazon_image_id_kali_purple
      network_interface_ids = [var.purple_ni_id]
      volume_size          = 500
    }
    kali_violet = {
      create               = var.create_kali_violet
      instance_type        = var.inst_violet
      ami_id               = var.amazon_image_id_kali_violet
      network_interface_ids = [var.violet_ni_id]
      volume_size          = 64
    }
    kali_eminence = {
      create               = var.create_kali_eminence
      instance_type        = var.inst_eminence
      ami_id               = var.amazon_image_id_kali_eminence
      network_interface_ids = [var.eminence_ni_id]
      volume_size          = 256
    }
    kali_pearly = {
      create               = var.create_kali_pearly
      instance_type        = var.inst_pearly
      ami_id               = var.amazon_image_id_kali_pearly
      network_interface_ids = [var.pearly_ni_id]
      volume_size          = 30
    }
    kali_heliotrope = {
      create               = var.create_kali_heliotrope
      instance_type        = var.inst_heliotrope
      ami_id               = var.amazon_image_id_kali_heliotrope
      network_interface_ids = [var.helio_ni_id]
      volume_size          = 64
    }
    guacamole = {
      create               = var.create_kali_guacamole
      instance_type        = var.instance_type_guacamole
      ami_id               = var.amazon_image_id_guacamole
      network_interface_ids = [var.guacamole_ni_id, var.guaclan_ni_id]
      volume_size          = 30
    }
    byzantium = {
      create               = var.create_kali_byzantium
      instance_type        = var.instance_type_byzantium
      ami_id               = var.amazon_image_id_byzantium
      network_interface_ids = [var.byzantium_ni_id,var.byzlan_ni_id, var.soc_ni_id]
      volume_size          = 128
    }
  }
}
