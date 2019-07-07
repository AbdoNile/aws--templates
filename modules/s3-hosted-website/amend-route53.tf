variable "hosted-zone" {}

data "aws_route53_zone" "domain-hosted-zone" {
  name = "${var.hosted-zone}"
}

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.domain-hosted-zone.zone_id}"
  name    = "${var.website-host-name}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.web_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.web_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}
