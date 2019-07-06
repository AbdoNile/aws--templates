variable "hosted-zone" {
  default = "axetay.com"
}


data "aws_route53_zone" "domain-hosted-zone" {
  name = "${var.hosted-zone}"
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.domain-hosted-zone.zone_id}"
  name    = "${var.bucket-domain-name}"
  type    = "A"

  alias {
    name    = "${aws_s3_bucket.web_bucket.website_endpoint}"
    zone_id = "${aws_s3_bucket.web_bucket.hosted_zone_id}"
    evaluate_target_health = false
  }
}
