# create Internet Gateway for vpc to connect with internet
resource "aws_internet_gateway" "ariu-igw" {
    vpc_id = "${aws_vpc.ariu-vpc.id}"

    tags = {
        Name = "ariu-igw"
    }
}

# public subnets route table
resource "aws_route_table" "ariu-public-rt" {
    vpc_id = "${aws_vpc.ariu-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.ariu-igw.id}" 
    }

    tags = {
        Name = "ariu-public-rt"
    }
}

# route table association for the public subnets
resource "aws_route_table_association" "ariu-rta-public-subnet-3" {
    subnet_id = "${aws_subnet.ariu-subnet-public-3.id}"
    route_table_id = "${aws_route_table.ariu-public-rt.id}"
}

# security group
resource "aws_security_group" "sshbyall" {

    vpc_id = "${aws_vpc.ariu-vpc.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sshbyall"
    }
}
