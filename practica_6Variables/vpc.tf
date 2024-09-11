resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virgina_cidr
  tags = {
    Name = "VPC_VIRGINIA"
    name = "prueba"
    env  = "Dev"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.public_subnet
  #el subnet publica tiene que podes asignar ip publica y para eso lo debemos indicar explicitamente: (x default es false)
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.private_subnet
}
