module "main_app" {
  source      = "../../modules/s3_bucket"
  bucket_name = "luna-us"
}

module "sgmodule" {
  source = "../../modules/ec2_instance"
}

resource "aws_instance" "web" {
  ami = "ami-0ca285d4c2cda3300"
  instance_type = "t3.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id]
}