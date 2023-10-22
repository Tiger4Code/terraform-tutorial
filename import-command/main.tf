provider "aws" {
  region = "us-east-1"
}

resource "local_file" "a_file" {
  filename = "files/a_file.txt"
  content  = sensitive("Hello Terraform!")
}

import {
  to = aws_s3_bucket.imported_bucket
  id = "tiger4code-manual-bucket"
}

