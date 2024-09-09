resource "random_string" "sufijo" {
  length  = 4
  special = false
  upper   = false
  numeric = false
  count   = 5
}
