variable "ports" {
  type    = list(number)
  default = [22, 80, 443] # list of ports
}

resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
