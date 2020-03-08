resource "aws_s3_bucket" "athena" {
  bucket = "wildmouse-athena-pragmatic-terraform"
  force_destroy = true
  acl = "private"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}