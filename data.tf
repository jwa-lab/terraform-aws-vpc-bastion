data "aws_subnets" "private_apps" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    visibility = "private"
    target = "apps"
  }
}
