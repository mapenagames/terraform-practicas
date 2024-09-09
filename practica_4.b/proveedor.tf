terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # (tome cualquier version dentro del >=4.36.0 y  <5.0.0 y que no sea 4.43.0
      version = ">=4.36.0, <5.0.0, !=4.43.0"
    }
  }
  #required_version = "1.9.5"
  # (tome cualquier version dentro del rango 1.9.algo)
  required_version = "~>1.9.0"
}

provider "aws" {
  region = "us-east-1"
}


