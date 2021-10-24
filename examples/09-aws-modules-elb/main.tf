provider "aws" {
    region = "us-east-2"
}
module "aws-vpc-ariu" {
  source      = "github.com/MetaArivu/terraform-example/modules/vpc"
  //awsvpc_cidr = "192.168.0.0/16"
  ariu_aws_vpc_cidr = "10.0.0.0/16"
  vpc_id      = "${module.aws-vpc-ariu.vpc_id}"
  //aws_subnet_cidr = "10.0.1.0/24"
  ariu_aws_subnet_cidr = "10.0.1.0/24"
  subnet_id = "${module.aws-vpc-ariu.subnet_id}"
}

module "rt" {
  source = "./rt"
  vpc_id = "${module.aws-vpc-ariu.vpc_id}"
  subnet_id = "${module.aws-vpc-ariu.subnet_id}"
  igw_id = "${module.sg.igw_id}" 
}

module "sg" {
  source = "./security_group"
  vpc_id = "${module.aws-vpc-ariu.vpc_id}"
  sg_id = "${module.sg.sg_id}"
  sg2_id = "${module.sg.sg_id}"
  igw_id = "${module.sg.igw_id}" 


}

module "elb" {
  source = "./elb"
  subnet_id = "${module.aws-vpc-ariu.subnet_id}"
  ec2_id = "${module.ec2.ec2_id}"
  sg_id = "${module.sg.sg_id}"

}


module "ec2" {
  source = "./ec2"
  subnet_id = "${module.aws-vpc-ariu.subnet_id}"
  sg2_id = "${module.sg.sg2_id}"
  ec2_id = "${module.ec2.ec2_id}"

}