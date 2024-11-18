resource "aws_key_pair" "kali_purple_key" {
  key_name   = "kali-purple-key"
  public_key = file("~/.ssh/kali-purple-key.pub")
}
