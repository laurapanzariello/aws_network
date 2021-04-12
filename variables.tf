variable "region" {
  description = "AWS region"
  default = "us-west-2"
}

variable "vpc_info" {
  type = map
  default = {
    vpc_a = "10.10.0.0/16"
    vpc_b = "10.20.0.0/16"
    vpc_c = "10.30.0.0/16"    
  }
}
