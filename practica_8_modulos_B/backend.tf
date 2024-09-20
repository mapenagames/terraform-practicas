terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    region  = "us-east-1"
    bucket  = "marceeje-us-east-1-prodtwity-terraform-state"
    key     = "terraform.tfstate"
    profile = ""
    encrypt = "true"

    dynamodb_table = "marceeje-us-east-1-prodtwity-terraform-state-lock"
  }
}
