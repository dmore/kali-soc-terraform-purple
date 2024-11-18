output "violetni_id" {
  value = aws_network_interface.violetni.id
}

output "eminenceni_id" {
  value = aws_network_interface.eminenceni.id
}

output "helioni_id" {
  value = aws_network_interface.helioni.id
}

output "lanni_id" {
  value = aws_network_interface.lanni.id
}

output "socni_id" {
  value = aws_network_interface.socni.id
}

output "byzni_id" {
  value = aws_network_interface.byzni.id
}

output "guac_id" {
  value = aws_network_interface.guacni.id
}

output "guaclanid" {
  value = aws_network_interface.guaclanni.id
}

output "pearlyni_id" {
  value = aws_network_interface.pearlyni.id
}

output "purpleni_id" {
  value = aws_network_interface.purpleni.id
}

output "network_interface_ids" {
  value = {
    purpleni   = aws_network_interface.purpleni.id,
    violetni   = aws_network_interface.violetni.id,
    eminenceni = aws_network_interface.eminenceni.id,
    helioni    = aws_network_interface.helioni.id,
    lanni      = aws_network_interface.lanni.id,
    socni      = aws_network_interface.socni.id,
    byzni      = aws_network_interface.byzni.id,
    guacni     = aws_network_interface.guacni.id,
    guaclanni  = aws_network_interface.guaclanni.id,
    pearlyni   = aws_network_interface.pearlyni.id
  }
}
