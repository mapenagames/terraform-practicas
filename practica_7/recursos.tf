#######################################################################################
resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virgina_cidr
  ## el tag siguiente se agrega a los tags definidos como default en provider.
  tags = {
    Name = "VPC_VIRGINIA"
  }
}
#######################################################################################
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[0]
  #el subnet publica tiene que podes asignar ip publica y para eso lo debemos indicar explicitamente: (x default es false)
  map_public_ip_on_launch = true
  ## el tag siguiente se agrega a los tags definidos como default en provider.
  tags = {
    Name = "PUBLIC SUBNET"
  }
}
#######################################################################################
resource "aws_subnet" "private_subnet_NEW" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  ## el tag siguiente se agrega a los tags definidos como default en provider.
  tags = {
    Name = "PRIVATE SUBNET"
  }
  depends_on = [aws_subnet.public_subnet]
}
#######################################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw vpc virginia"
  }
}
#######################################################################################
resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public crt"
  }
}
#######################################################################################
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}
#######################################################################################
resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance SG"
  description = "Allow SSH inbound traffic and all egress traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  ingress {
    description = "ssh over Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }
  egress {
    description      = ""
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "Public Instence SG"
  }
}
#######################################################################################
