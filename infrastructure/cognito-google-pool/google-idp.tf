variable "google-client-id" {}
variable "google-client-secret" {}

resource "aws_cognito_identity_provider" "google" {
  user_pool_id  = "${aws_cognito_user_pool.pool.id}"
  provider_name = "Google"
  provider_type = "Google"

  provider_details {
    authorize_scopes = "profile email openid"
    client_id        = "${var.google-client-id}"
    client_secret    = "${var.google-client-secret}"
  }

  attribute_mapping {
    email    = "email"
    username = "sub"
    family_name = "family_name"
    given_name ="given_name"
    picture = "picture"
    birthdate = "birthdays"
    gender = "genders"
  }
}