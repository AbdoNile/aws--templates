variable "hosted-zone" {}

data "aws_route53_zone" "domain-hosted-zone" {
  name = "${var.hosted-zone}"
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = "${aws_acm_certificate.certificate.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}

resource "aws_route53_record" "cert_validation" {
  name    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.domain-hosted-zone.id}"
  records = ["${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}