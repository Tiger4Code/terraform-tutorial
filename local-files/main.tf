resource "local_file" "a_file" {
  filename = "files/a_file.txt"
  content  = sensitive("Hello Terraform!")
}

resource "local_file" "b_file" {
  filename = "files/b_file.txt"
  content  = sensitive("Terraform tutorial for begineers")
}


