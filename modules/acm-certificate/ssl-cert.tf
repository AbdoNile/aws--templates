variable "ssl-domain-root" {
  
}



resource "aws_acm_certificate" "certificate" {
  domain_name       = "${var.ssl-domain-root}"
  validation_method = "DNS"
  subject_alternative_names = ["*.${var.ssl-domain-root}"]

  lifecycle {
    create_before_destroy = true
  }
}

