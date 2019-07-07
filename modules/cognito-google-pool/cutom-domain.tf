variable "ssl-certificate-arn" {
  
}

variable "login-custom-domain" {
  
}


resource "aws_cognito_user_pool_domain" "custom-domain" {
  domain          = "${var.login-custom-domain}"
  certificate_arn = "${var.ssl-certificate-arn}"
  user_pool_id    = "${aws_cognito_user_pool.pool.id}"
}

