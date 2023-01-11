resource "aws_iam_role" "bastion_role" {
  name = var.bastion_name
  description = "Role for ${var.bastion_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "bastion_profile" {
  name = var.bastion_name
  role = aws_iam_role.bastion_role.name
}

data "aws_iam_policy" "ssm_managed_instance_core" {
  name = "AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core_policy_attachment" {
  policy_arn = data.aws_iam_policy.ssm_managed_instance_core.arn
  role = aws_iam_role.bastion_role.name
}
