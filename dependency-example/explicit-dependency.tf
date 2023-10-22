# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a resource for an S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket-name-tiger4code"
}

# Create a resource for an EC2 instance that depends on the S3 bucket
resource "aws_instance" "webserver" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"

  # Specify the dependency on the S3 bucket resource
  depends_on = [aws_s3_bucket.example_bucket]

  tags = {
    Name = "Webserver"
  }
}


