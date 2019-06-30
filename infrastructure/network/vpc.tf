variable  "vpc_cidr"  {}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"
  
  tags {
    Name = "${var.network_name} VPC"
  }
}

resource "aws_internet_gateway" "InternetGateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.network_name} IG"
  }
}



resource "aws_nat_gateway" "nat-gateway" {
    allocation_id = "${aws_eip.nat-eip.id}"
    subnet_id = "${aws_subnet.public1.id}"
}


