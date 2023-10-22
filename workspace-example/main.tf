provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
  type = map(any)

  default = {
    default = "t2.nano"
    staging     = "t2.micro"
    prod    = "t2.large"
  }
}

