## uso del count para replicar recursos, en este ejemplo 3 recursos.
variable "instancias" {
  description = "Nombre de las instancias"
  type        = list(string)
  default     = ["apache", "mysql", "jumserver"]
}
resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")
  count                  = length(var.instancias)

  tags = {
    "Name" = var.instancias[count.index]
  }
}
###variable "instancias" {
###  description = "Nombre de las instancias"
###  type        = set(string)
###  default     = ["apache", "mysql", "jumserver"]
###  #default = ["mysql", "jumserver"]
###}
###
###resource "aws_instance" "public_instance" {
###  for_each               = var.instancias
###  ami                    = var.ec2_specs.ami
###  instance_type          = var.ec2_specs.instance_type
###  subnet_id              = aws_subnet.public_subnet.id
###  key_name               = data.aws_key_pair.key.key_name
###  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
###  user_data              = file("scripts/userdata.sh")
###
###
###  tags = {
###    "Name" = each.value
###  }
###}
###
###

