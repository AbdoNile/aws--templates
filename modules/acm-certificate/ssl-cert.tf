variable "ssl-domain-root" {
  
}



resource "aws_acm_certificate" "certificate" {
  domain_name       = "*.${var.ssl-domain-root}"
  validation_method = "DNS"
  subject_alternative_names = ["*.${var.ssl-domain-root}"]
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = "${aws_acm_certificate.certificate.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}

