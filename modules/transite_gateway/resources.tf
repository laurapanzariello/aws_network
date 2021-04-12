resource "aws_ec2_transit_gateway" "tgw" {
  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  tags = {
    "Name" = var.tgw_name
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attach" {
  count = lenght(var.vpc.ids)
  # subnet_ids = var.vpc[count.index].aws_subnet.private_subnet.ids[0]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id = var.vpc.ids[count.index]
}