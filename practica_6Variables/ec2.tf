
resource "aws_instance" "public_instance" {
# para obtener una ami lo podes encontrar en EC2->Launch Instances y busar la imagen de linux.
# https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#LaunchInstances:

  ami           = "ami-0182f373e66f89c85"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id

}
