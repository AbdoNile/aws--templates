
variable "vpc_id" {}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

resource "aws_security_group" "traffic-to-ecs" {
  name   = "Local  allowed"
  vpc_id = "${data.aws_vpc.selected.id}"

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["${data.aws_vpc.selected.cidr_block}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Traffic to ecs"
  }
}
