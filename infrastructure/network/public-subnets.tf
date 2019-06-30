variable  "public1_subnet_cidr"  {}
variable  "public2_subnet_cidr"  {}

resource "aws_subnet" "public1" {
  availability_zone = "${var.first_az}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.public1_subnet_cidr}"
  tags {
    Name = "${var.network_name} Public Subnet 1"
  }
  
}

resource "aws_subnet" "public2" {
  availability_zone = "${var.second_az}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.public2_subnet_cidr}"
  tags {
    Name = "${var.network_name}  Public Subnet 2"
  }
}


resource "aws_route_table_association" "route-association1" {
  route_table_id = "${aws_route_table.public-network.id}"
  subnet_id      = "${aws_subnet.public1.id}"
}


resource "aws_route_table_association" "route-association2" {
  route_table_id = "${aws_route_table.public-network.id}"
  subnet_id      = "${aws_subnet.public2.id}"
}

