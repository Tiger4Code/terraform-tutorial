provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
  key_name      = "key-pair-name" # Replace it with your key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo amazon-linux-extras install -y nginx1
              sudo systemctl start nginx
              EOF
}


