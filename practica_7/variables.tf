#en este archivo se definen las variables y no se asignan los valores

variable "virgina_cidr" {
  description = "CIDR VIRGINIA"
  type        = string
  sensitive   = false
}

#variable "public_subnet" {
#  description = "CIDR public subnet"
#  type        = string
#}
#
#variable "private_subnet" {
#  description = "CIDR private subnet"
#  type        = string
#}

variable "subnets" {
  description = "lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proycto"
  type        = map(string)

}
variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string

}
