resource "aws_s3_bucket" "proveedores" {
  bucket = "proveedores_regional_buenosaires_bgal"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}