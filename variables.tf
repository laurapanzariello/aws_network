variable "region" {
  description = "AWS region"
  default = "us-west-2"
}

variable "vpc_cidr" {
  description = "List of network blocks to vpcs"
  type = "list"
  default = ["10.10.0.0/16", "10.20.0.0/16", "10.30.0.0/16"] 
}