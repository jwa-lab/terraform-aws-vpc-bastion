variable "bastion_name" {
  type = string
  description = "Name used for the security group, the instance profile, and other resources ..."
}

variable "vpc_id" {
  type = string
  description = <<EOH
Id of the VPC in which the bastion will be deployed. The module will look for apps subnets, based on the topology defined
by the terraform-aws-vpc module. See https://github.com/jwa-lab/terraform-aws-vpc
EOH
}

variable "db_address" {
  type = string
  default = null
  description = "Address of the database that should be accessible from the bastion via HAProxy"
}

variable "db_port" {
  type = number
  default = null
  description = "Port on which the proxy will listen"
}

variable "profile_permissions_boundary_arn" {
  type = string
  default = null
  description = "The ARN of AWS IAM Policy used as permissions boundary for the bastion instance profile"
}
