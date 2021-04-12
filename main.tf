module "vpc" {
  source = "./modules/vpc"

  for_each = {
    vpc_a = "10.10.0.0/16"
    vpc_b = "10.20.0.0/16"
    vpc_c = "10.30.0.0/16"
  }
  vpc_name = each.key
  vpc_cidr = each.value
  igw_name = "igw-${each.key}"
  rt_name = "route_table-public_subnet"
}
