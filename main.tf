module "vpc" {
  source = "modules/vpc"

  # for_each = {
  #   vpc_a = "10.10.0.0/16"
  #   vpc_b = "10.20.0.0/16"
  #   vpc_c = "10.30.0.0/16"
  # }
  vpc_name = "vpc_a"
  vpc_cidr = "10.10.0.0/16"
  igw_name = "igw-vpc_a"
  rt_name = "route_table-public_subnet"
}
