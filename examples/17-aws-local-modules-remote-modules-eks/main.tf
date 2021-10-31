data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "aws_availability_zones" "available" {
}


module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"

  name                 = "test-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

module "eks" {
  source       = "terraform-aws-modules/eks/aws"  
  cluster_name    = var.cluster_name
  cluster_version = "1.17"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.private_subnets
  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.micro"
      additional_userdata           = "echo arivu example"
      asg_desired_capacity          = 1
      additional_security_group_ids = [module.arivu-aws-eks-sg.sg_id
]
    }
  ]
}

module "arivu-aws-eks-sg" {
  source = "./modules/security_grp"
  vpc_id = module.vpc.vpc_id
  sg_id = module.arivu-aws-eks-sg.sg_id
}
