output "kali_purple_ssm_full_access_role_name" {
  value = aws_iam_role.kali_purple_ssm_full_access.name
}

output "kali_purple_guacamole_role_name" {
  value = aws_iam_role.kali_purple_guacamole.name
}

output "kali_purple_ssm_full_access_instance_profile_name" {
  value = aws_iam_instance_profile.kali_purple_ssm_full_access.name
}

output "kali_purple_guacamole_instance_profile_name" {
  value = aws_iam_instance_profile.kali_purple_guacamole.name
}