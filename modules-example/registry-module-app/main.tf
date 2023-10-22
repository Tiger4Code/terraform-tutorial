# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "s3-bucket_example_complete" {
  source  = "terraform-aws-modules/s3-bucket/aws//examples/complete"
  version = "3.15.1"
}