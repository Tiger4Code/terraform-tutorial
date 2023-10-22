terraform {
  backend "s3" {
    bucket = "tiger4code"
    key    = "terraform_remote_state/terraform-project-1.tfstate"
    region = "us-east-1"

    dynamodb_table = "state-locking"
  }
}

resource "local_file" "a_file" {
  filename = "files/a_file.txt"
  content  = sensitive("Hello Terraform!")
}

resource "local_file" "b_file" {
  filename = "files/b_file.txt"
  content  = sensitive("Terraform tutorial for begineers")
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "tiger4code-terraform-test-bucket"
  tags = {
    Name        = "Tiger4code test bucket"
    Environment = "Test"
  }
}

