variable "bucekt-host-name" {
  
}

resource "aws_s3_bucket" "web_bucket" {
  bucket = "${var.bucket-host-name}"
  acl    = "public-read"
  policy = "${data.template_file.policy_template.rendered}"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

data "template_file" "policy_template" {
  template = "${file("bucket-policy.json")}"

  vars {
    fq-name = "${var.bucket-host-name}"
  }
}

