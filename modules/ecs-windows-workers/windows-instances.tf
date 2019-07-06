data "template_file" "windows-user-data" {
  template = "${file("windows.userdata.tpl")}"

  vars {
    cluster-name = "${aws_ecs_cluster.ecs.name}"
  }
}

variable "ecs-nodes-subnets-ids" {
  type = "list"
}

variable "ami-image-id" {
  
}


resource "aws_launch_configuration" "ecs-windows" {
  image_id             = "${var.ami-image-id}"
  instance_type        = "t2.micro"
  name_prefix          = "ecs-instance-"
  key_name             = "${var.pem_key_name}"
  iam_instance_profile = "${aws_iam_role.ecsInstanceRole.arn}"
  user_data            = "${data.template_file.windows-user-data.rendered}"
  security_groups = [
    "${aws_security_group.traffic-to-ecs.id}",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "ecs-instances" {
  name                 = "ECS Windows Instances"
  max_size             = 2
  min_size             = 0
  desired_capacity     = 2
  placement_group      = "${aws_placement_group.windows-placement-strategy.id}"
  launch_configuration = "${aws_launch_configuration.ecs-windows.id}"
  vpc_zone_identifier  = ["${var.ecs-nodes-subnet-ids}"]
  
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_placement_group" "windows-placement-strategy" {
  strategy = "spread"
}