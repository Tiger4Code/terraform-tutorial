resource "local_file" "first_file" {
  filename = "myfile-2.txt"
  content  = sensitive("Hello Terraform!")
}

