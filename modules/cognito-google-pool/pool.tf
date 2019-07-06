variable "pool-name" {
  type = "string"
}

variable "callback-urls" {
  type = "list"
}


resource "aws_cognito_user_pool" "pool" {
  name = "${var.pool-name}"
  username_attributes = ["email"]
}
