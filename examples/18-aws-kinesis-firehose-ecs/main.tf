resource "aws_elasticsearch_domain" "arviu_aws_firehose_ecs_cluster" {
  domain_name = "arviu-aws-firehose-ecs"

    ebs_options {
      ebs_enabled = true
      volume_size = 10
  }
}

resource "aws_s3_bucket" "arviu-aws-firehose-bucket-ecs" {
  bucket = "arviu-firehose-bucket-ecs"
  acl    = "private"
}

resource "aws_iam_role" "arviu_aws_firehose_ecs_role" {
  name = "arviu_aws_firehose_ecs_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_kinesis_firehose_delivery_stream" "arviu_aws_firehose_stream" {
  name        = "arviu-aws-firehose-stream"
  destination = "elasticsearch"

  s3_configuration {
    role_arn           = aws_iam_role.arviu_aws_firehose_ecs_role.arn
    bucket_arn         = aws_s3_bucket.arviu-aws-firehose-bucket-ecs.arn
    buffer_size        = 10
    buffer_interval    = 400
    compression_format = "GZIP"
  }

  elasticsearch_configuration {
    domain_arn = aws_elasticsearch_domain.arviu_aws_firehose_ecs_cluster.arn
    role_arn   = aws_iam_role.arviu_aws_firehose_ecs_role.arn
    index_name = "test"
    type_name  = "test"

    processing_configuration {
      enabled = "false"

    }
  }
}