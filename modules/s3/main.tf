resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
    name = var.environment
  }
}

#Adds an ACL to bucket
resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  bucket = var.bucket_name
  acl    = "private"
}
