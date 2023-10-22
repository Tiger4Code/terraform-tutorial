resource "aws_s3_bucket" "tfbucket" {
  bucket = "tfbucket-20232908-${var.bucket_name}"
  tags = {
    Description = "Test tf tag"
  }

  force_destroy = var.destroyvar
}


# you can override the value of this variable 
variable "destroyvar" {
  default = false
}

resource "aws_s3_object" "tfbucketobject" {
  content = "${path.module}./random-policy.json"
  key     = "testrandompolicy.json"
  bucket  = aws_s3_bucket.tfbucket.id
}
