resource "aws_vpc" "vpc_a" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  count = 4
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc_a.cidr_block, 2, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    "Name" = "public_subnet_${data.aws_availability_zones.available.names[count.index]}"
  }
}
