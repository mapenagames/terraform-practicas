locals {
  sufix = "${var.tags.project}-${var.tags.env}-${var.tags.region}"
}

resource "random_string" "sufijo-s3" {
  length  = 8
  special = false
  upper   = false
}

#locals { ## tiene valores random dado que en aws el nombre no se puede repetir
#  s3-sufix = "${var.tags.project}-${random_string.sufijo-s3.id}"
#}
