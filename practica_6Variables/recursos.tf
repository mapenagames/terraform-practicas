resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virgina_cidr
  ## el tag siguiente se agrega a los tags definidos como default en provider.
  tags = {
    Name = "VPC_VIRGINIA"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[0]
  #el subnet publica tiene que podes asignar ip publica y para eso lo debemos indicar explicitamente: (x default es false)
  map_public_ip_on_launch = true
  ## el tag siguiente se agrega a los tags definidos como default en provider.
  tags = {
    Name = "PUBLIC SUBNET temp"
  }
}
resource "aws_subnet" "private_subnet_NEW" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  ## el tag siguiente se agrega a los tags definidos como default en provider.
  tags = {
    Name = "PRIVATE SUBNET temp"
  }
  depends_on = [aws_subnet.public_subnet]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
