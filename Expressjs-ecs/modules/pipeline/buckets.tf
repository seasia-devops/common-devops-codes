resource "aws_s3_bucket" "source" {
  bucket        = "expressjsbucket11"
  acl           = "private"
  force_destroy = true
  #region = "${var.aws_region}-ap-south-1"
}

