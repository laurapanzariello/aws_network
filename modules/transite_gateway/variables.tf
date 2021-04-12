variable "tgw_name" {
  description = "Transit Gateway Name"
  type = string
}

variable "vpc" {
  description = "VPC id"
  type = list(string)
  default = []
}