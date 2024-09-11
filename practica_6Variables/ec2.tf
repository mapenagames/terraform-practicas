
resource "aws_instance" "public_instance" {
  ami                     = "ami-0182f373e66f89c85"
  instance_type           = "t2.micro"
  subnet_id = aws_subnet.public_subnet.id
}
