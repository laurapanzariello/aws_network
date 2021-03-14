resource "aws_vpc" "vpc_a" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_subnet" "subnet_a_1" {
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "10.10.0.0/18"  
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_subnet" "subnet_a_2" {
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "10.10.64.0/18"    
  availability_zone = "${data.aws_availability_zones.available.names[1]}"  
}

resource "aws_subnet" "subnet_a_3" {
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "10.10.128.0/18"    
  availability_zone = "${data.aws_availability_zones.available.names[2]}"  
}

resource "aws_subnet" "subnet_a_4" {
  vpc_id = "${aws_vpc.vpc_a.id}"
  cidr_block = "10.10.192.0/18"    
  availability_zone = "${data.aws_availability_zones.available.names[3]}" 
}
