module "aws_s3_bucket_ariu" {
    source = "./modules/s3"
    vers = var.vers
    bucketname = var.bucketname

}
