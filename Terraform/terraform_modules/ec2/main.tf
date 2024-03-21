resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = var.instance_profile
  associate_public_ip_address = var.public_ip
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_groups
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    encrypted = var.volume_encryption
  }
  tags = merge(
    {
      Name = var.name
    },
    {
      Provisioner = "Terraform"
    },
    var.tags,
  )
}
