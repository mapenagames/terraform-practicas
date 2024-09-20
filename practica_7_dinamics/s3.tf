resource "aws_s3_bucket" "cerberus_buckt" {
  count  = 1
  bucket = "cerberus-${local.s3-sufix}"
  tags = {
    Owner       = "Nazareno"
    Environment = "Dev"
    Office      = "proveedores"
  }
}
