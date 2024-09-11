virgina_cidr = "10.10.0.0/16"
#public_subnet  = "10.10.0.0/24"
#private_subnet = "10.10.1.0/24"

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env"   = "dev"
  "owner" = "mp"
  "cloud" = "aws"
  #IAC = Insfraestructura como codigo
  "IAC"         = "Terraform"
  "IAC_Version" = "1.3.6"
}
