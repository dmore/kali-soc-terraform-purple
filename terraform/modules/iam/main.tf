# IAM Role for KaliPurpleSSMFullAccess
resource "aws_iam_role" "kali_purple_ssm_full_access" {
  name = "KaliPurpleSSMFullAccess"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach AmazonSSMManagedInstanceCore policy (required)
resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
  role       = aws_iam_role.kali_purple_ssm_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Attach AmazonSSMFullAccess policy (optional, but recommended)
resource "aws_iam_role_policy_attachment" "ssm_full_access" {
  role       = aws_iam_role.kali_purple_ssm_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

# IAM Instance Profile for KaliPurpleSSMFullAccess
resource "aws_iam_instance_profile" "kali_purple_ssm_full_access" {
  name = "KaliPurpleSSMFullAccess"
  role = aws_iam_role.kali_purple_ssm_full_access.name
}

# IAM Role for KaliPurpleGuacamole
resource "aws_iam_role" "kali_purple_guacamole" {
  name = "KaliPurpleGuacamole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach AmazonSSMManagedInstanceCore policy for Guacamole role
resource "aws_iam_role_policy_attachment" "guacamole_ssm_managed_instance_core" {
  role       = aws_iam_role.kali_purple_guacamole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# IAM Instance Profile for KaliPurpleGuacamole
resource "aws_iam_instance_profile" "kali_purple_guacamole" {
  name = "KaliPurpleGuacamole"
  role = aws_iam_role.kali_purple_guacamole.name
}
