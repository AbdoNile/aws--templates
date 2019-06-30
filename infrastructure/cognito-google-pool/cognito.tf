resource "aws_cognito_user_pool" "pool" {
  name = "${var.pool-name}"
  username_attributes = ["email"]
}


resource "aws_cognito_user_pool_client" "client" {
  name = "${var.pool-name}"
  callback_urls = ["https://${aws_s3_bucket.web_bucket.website_endpoint}/login-call-back" , "http://localhost:3000/login-call-back"]
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
  allowed_oauth_flows = ["implicit" ]
  allowed_oauth_scopes = ["openid", "profile" , "email"]
  supported_identity_providers = ["Google"]
  allowed_oauth_flows_user_pool_client = true
}

resource "googel_" "name" {
  
}
