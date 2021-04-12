variable "vpc_cidr" {
  description = "List of network blocks to vpcs"
  type = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type = string
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type = string
}

variable "rt_name" {
  description = "Name of the Route Table"
  type = string
}

variable "tgw_id" {
  description = "Transit Gateway Id"
  type = string
}

variable "all_address" {
  description = "Represents all cidr blocks"
  type = string
  default = "0.0.0.0/0"
}