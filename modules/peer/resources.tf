# data "aws_route_tables" "owner" {
#   vpc_id = "${aws_vpc.vpc_a.id}"
# }

# data "aws_route_tables" "accepter" {
#   vpc_id = "${aws_vpc.vpc_b.id}"
# }

# resource "aws_vpc_peering_connection" "peering_vpc_a_to_b" {
#   peer_vpc_id = "${aws_vpc.vpc_b.id}"
#   vpc_id = "${aws_vpc.vpc_a.id}"
# }

# resource "aws_vpc_peering_connection_accepter" "peer_accept" {
#   vpc_peering_connection_id = "${aws_vpc_peering_connection.peering_vpc_a_to_b.id}"
#   auto_accept = true
# }

# resource "aws_route" "owner" {
#   count = "${length(data.aws_route_tables.owner.ids)}"
#   route_table_id = "${data.aws_route_tables.owner.ids[count.index]}"
#   destination_cidr_block = "${var.vpc_cidr[1]}"
#   vpc_peering_connection_id = "${aws_vpc_peering_connection.peering_vpc_a_to_b.id}" 
# }

# resource "aws_route" "accepter" {
#   count = "${length(data.aws_route_tables.accepter.ids)}"
#   route_table_id = "${data.aws_route_tables.accepter.ids[count.index]}"
#   destination_cidr_block = "${var.vpc_cidr[0]}"
#   vpc_peering_connection_id = "${aws_vpc_peering_connection.peering_vpc_a_to_b.id}" 
# }