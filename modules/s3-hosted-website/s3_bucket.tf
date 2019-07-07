variable "website-host-name" {}

resource "aws_s3_bucket" "web_bucket" {
  bucket = "${var.website-host-name}"
  acl    = "public-read"
  policy = "${data.template_file.policy_template.rendered}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

data "template_file" "policy_template" {
  template = "${file("${path.module}/bucket-policy.json")}"

  vars {
    website-host-name = "${var.website-host-name}"
  }
}
