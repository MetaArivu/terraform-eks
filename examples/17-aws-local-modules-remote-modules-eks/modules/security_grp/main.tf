resource "aws_security_group" "arivu-aws-sg-worker_group" {
  name_prefix = "arivu-aws-sg-worker_group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}
output "sg_id" {
  value = "${aws_security_group.arivu-aws-sg-worker_group.id}"
}

