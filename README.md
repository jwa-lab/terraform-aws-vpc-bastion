# terraform-aws-vpc-bastion

Creates an EC2 instance in a VPC defined by the [terraform-aws-vpc](https://github.com/jwa-lab/terraform-aws-vpc) module.

If you provide a database address, HAProxy will run on the instance and forward connections to the database.
