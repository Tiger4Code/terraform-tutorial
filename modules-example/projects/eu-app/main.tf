module "main_app" {
  source      = "../../modules/s3_bucket"
  bucket_name = "luna-eu"
  destroyvar  = true
}

# variable "pre" {
#   default = "moon"
# }