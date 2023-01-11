resource "aws_security_group" "bastion_group" {
  name = var.bastion_name
  description = "${var.bastion_name} ec2 instance security group"
  vpc_id = var.vpc_id

  tags = {
    Name = var.bastion_name
  }
}

resource "aws_security_group_rule" "outbound" {
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.bastion_group.id
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}
