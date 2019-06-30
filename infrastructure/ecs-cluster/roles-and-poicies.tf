resource "aws_iam_role" "ecsInstanceRole" {
  name = "EcsInstanceRole"
  assume_role_policy = "${data.template_file.instance-iam-role.rendered}"
}


data "template_file" "instance-iam-role" {
  template = "${file("ecs-instance-iam-role.json")}"
}

resource "aws_iam_role_policy_attachment" "attachEC2Policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role       = "${aws_iam_role.ecsInstanceRole.name}"
}
