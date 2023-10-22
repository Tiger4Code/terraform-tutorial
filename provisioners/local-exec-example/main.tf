# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = var.ec2_instance_type

  tags = {
    Name        = "webserver"
    Description = "Test webserver"
  }

  provisioner "local-exec" {
    when = destroy
    # store the ip address locally
    command = "echo ${aws_instance.webserver.public_ip} >> ./ips.txt "
  }
}