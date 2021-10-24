module "ariu_aws_vpc" {
   source = "./modules/vpc"
   aws-vpc-cidr = var.aws-vpc-cidr
   aws-subnet-cidr = var.aws-subnet-cidr
   vpc_id      = "${module.ariu_aws_vpc.vpc_id}"  
}

module "ariu_aws_ec2" {
  source = "./modules/ec2"
  subnet_id     = module.ariu_aws_vpc.subnet_id
  ssh-allowed = module.ariu_aws_vpc.ssh-allowed
}