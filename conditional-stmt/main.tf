variable "is_production" {
  default = false
}

# Using the ternary conditional expression
resource "aws_instance" "example" {
  ami = var.is_production ? "ami-12345678" : "ami-87654321"
  instance_type = var.is_production ? "t2.micro" : "t2.small"
}

