resource "aws_ec2_transit_gateway" "tgw" {
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = {
    "Name" = "tgw_abc"
  }
}

module "vpc" {
  source = "./modules/vpc"

  for_each = var.vpc_info

  vpc_name = each.key
  vpc_cidr = each.value
  igw_name = "igw-${each.key}"
  rt_name = "route_table-public_subnet"
  tgw_id = aws_ec2_transit_gateway.tgw.id
}
