resource "aws_vpc" "vpc_a" {
  cidr_block = "${var.vpc_cidr[0]}"
  tags = {
    "Name" = "VPC_A"
  }
}

resource "aws_internet_gateway" "igw_vpc_a" {
  vpc_id = "${aws_vpc.vpc_a.id}"
  tags = {
    "Name" = "IGW_VPC_A"
  }
}

resource "aws_route_table" "route_table_a" {
  vpc_id = "${aws_vpc.vpc_a.id}"
  route {
    cidr_block = "0.0.0.0/0"   
    gateway_id = "${aws_internet_gateway.igw_vpc_a.id}"
  }     
  tags = {
    "Name" = "route_table_public_subnet"
  }
}

resource "aws_subnet" "public_subnet" {
  count = 4
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc_a.cidr_block, 4, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    "Name" = "public_subnet_${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_route_table_association" "route_table_public_subnet" {
  count = 4
  subnet_id = "${aws_subnet.public_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.route_table_a.id}"
}

resource "aws_subnet" "private_subnet" {
  count = 4
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc_a.cidr_block, 4, count.index+4)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    "Name" = "private_subnet_${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_subnet" "private_db_subnet" {
  count = 4
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc_a.cidr_block, 4, count.index+8)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    "Name" = "private_db_subnet_${data.aws_availability_zones.available.names[count.index]}"
  }
}

###

resource "aws_vpc" "vpc_b" {
  cidr_block = "${var.vpc_cidr[1]}"
  tags = {
    "Name" = "VPC_B"
  }
}

resource "aws_internet_gateway" "igw_vpc_b" {
  vpc_id = "${aws_vpc.vpc_b.id}"
  tags = {
    "Name" = "IGW_VPC_B"
  }
}

resource "aws_route_table" "route_table_b" {
  vpc_id = "${aws_vpc.vpc_b.id}"
  route {
    cidr_block = "0.0.0.0/0"   
    gateway_id = "${aws_internet_gateway.igw_vpc_b.id}"
  }     
  tags = {
    "Name" = "route_table_public_subnet"
  }
}

resource "aws_subnet" "public_subnet_b" {
  count = 4
  vpc_id = "${aws_vpc.vpc_b.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc_b.cidr_block, 4, count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    "Name" = "public_subnet_${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_route_table_association" "route_table_public_subnet_b" {
  count = 4
  subnet_id = "${aws_subnet.public_subnet_b.*.id[count.index]}"
  route_table_id = "${aws_route_table.route_table_b.id}"
}

resource "aws_subnet" "private_subnet_b" {
  count = 4
  vpc_id = "${aws_vpc.vpc_b.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc_b.cidr_block, 4, count.index+4)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    "Name" = "private_subnet_${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_subnet" "private_db_subnet_b" {
  count = 4
  vpc_id = "${aws_vpc.vpc_b.id}"
  cidr_block = "${cidrsubnet(aws_vpc.vpc_b.cidr_block, 4, count.index+8)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
    "Name" = "private_db_subnet_${data.aws_availability_zones.available.names[count.index]}"
  }
}
