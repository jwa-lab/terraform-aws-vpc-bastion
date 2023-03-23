data "aws_ami" "amazon_linux" {
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20221210.1-arm64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami = data.aws_ami.amazon_linux.id
  associate_public_ip_address = false
  disable_api_termination = false
  iam_instance_profile = aws_iam_instance_profile.bastion_profile.id
  instance_type = "t4g.micro"
  monitoring = false
  subnet_id = data.aws_subnets.private_apps.ids[0]
  vpc_security_group_ids = [aws_security_group.bastion_group.id]

  user_data = var.db_address == null ? null : templatefile("${path.module}/bastion-setup.sh", {
    db_address = var.db_address,
    db_port = var.db_port,
  })
  user_data_replace_on_change = true

  tags = {
    Name = var.bastion_name
  }
}
