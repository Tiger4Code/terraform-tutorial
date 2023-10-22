provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami             = "ami-051f7e7f6c2f40dc1"
  instance_type   = "t2.micro"
  key_name        = "tiger4code-key-pair"
  security_groups = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./tiger4code-key-pair.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }
}
