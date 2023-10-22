terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Existing security group "AllowPublicAccessSG"
data "aws_security_group" "public_access_sg" {
  name = "AllowPublicAccessSG"
}

resource "aws_instance" "webserver" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [data.aws_security_group.public_access_sg.id]
  tags = {
    Name        = "webserver"
    Description = "Test webserver"
  }

  provisioner "local-exec" {
    # when = destroy
    # on_failure = continue
    # store the ip address locally
    command = "echo ${aws_instance.webserver.public_ip} >> ./ips.txt "
  }
}

output "ec2_public_ip" {
  value = aws_instance.webserver.public_ip
}

variable "ec2_instance_type" {
  default     = "t2.micro"
  description = "EC2 Instance Type"
}

variable "ec2_description" {}


