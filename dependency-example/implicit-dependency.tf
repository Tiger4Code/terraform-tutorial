# # Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1"
# }

# resource "aws_security_group" "ssh-access" {
#   name        = "ssh-access"
#   description = "Allow ssh access from specific IP address"
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["21.110.0.5/32"]
#   }
# }

# resource "aws_instance" "example_instance" {
#   ami           = "ami-051f7e7f6c2f40dc1"
#   instance_type = "t2.micro"

#   vpc_security_group_ids = ["${aws_security_group.ssh-access.id}"]
# }



