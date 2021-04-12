data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = var.igw_name
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.all_address   
    gateway_id = aws_internet_gateway.igw.id
  }     
  tags = {
    "Name" = var.rt_name
  }
}

resource "aws_subnet" "public_subnet" {
  #to do: create a variable to define the number of the subnets
  count = 4
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    "Name" = "public_subnet_data.aws_availability_zones.available.names[count.index]"
  }
}

resource "aws_route_table_association" "route_table_public_subnet" {
  count = 4
  subnet_id = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.route_table.id
}

resource "aws_subnet" "private_subnet" {
  #to do: create a variable to define the number of the subnets  
  count = 4
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index+4)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    "Name" = "private_subnet_data.aws_availability_zones.available.names[count.index]"
  }
}

resource "aws_subnet" "private_db_subnet" {
  #to do: create a variable to define the number of the subnets  
  count = 4
  vpc_id = aws_vpc.vpc.id
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, count.index+8)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    "Name" = "private_db_subnet_data.aws_availability_zones.available.names[count.index]"
  }
}
