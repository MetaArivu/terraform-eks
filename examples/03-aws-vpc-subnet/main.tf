resource "aws_vpc" "ariu-aws-vpc-2" {
    cidr_block = "192.168.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    tags = {
        Name = "ariu-aws-vpc-2"
}
}

resource "aws_subnet" "ariu-prod-subnet-public-1" {
    vpc_id = "${aws_vpc.ariu-aws-vpc-2.id}"
    cidr_block = "192.168.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "var.aws-az"
    tags = {
        Name = "ariu-prod-subnet-public-1"
    }
}
