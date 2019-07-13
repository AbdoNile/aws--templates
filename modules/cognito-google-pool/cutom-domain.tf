variable "ssl-certificate-arn" {
}

variable "login-custom-domain" {
}

variable "hosted-zone" {
}

data "aws_route53_zone" "hosted-zone" {
  name = "${var.hosted-zone}"
}

resource "aws_route53_record" "auth" {
  zone_id = "${data.aws_route53_zone.hosted-zone.zone_id}"
  name    = "${var.login-custom-domain}"
  type    = "A"
  alias {
    name                   = "${aws_cognito_user_pool_domain.custom-domain.cloudfront_distribution_arn}"
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_cognito_user_pool_domain" "custom-domain" {
  domain          = "${var.login-custom-domain}"
  certificate_arn = "${var.ssl-certificate-arn}"
  user_pool_id    = "${aws_cognito_user_pool.pool.id}"
}

