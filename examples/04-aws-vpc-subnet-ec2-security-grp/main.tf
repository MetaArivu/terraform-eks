resource "aws_instance" "aws_ariu_ins" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.ariu-subnet-public-3.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.sshbyall.id}"]

}
