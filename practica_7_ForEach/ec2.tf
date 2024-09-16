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
    "Name" = var.instancias[count.index] ## var.instancias[0] la 1ra vez, [1] la 2da vez.
  }
}



