resource "aws_cognito_user_pool_client" "client" {
  name                                 = "${var.pool-name}"
  callback_urls                        = "${var.callback-urls}"
  user_pool_id                         = "${aws_cognito_user_pool.pool.id}"
  allowed_oauth_flows                  = ["implicit"]
  allowed_oauth_scopes                 = ["openid", "profile", "email"]
  supported_identity_providers         = ["Google"]
  generate_secret                      = true
  allowed_oauth_flows_user_pool_client = true
}
