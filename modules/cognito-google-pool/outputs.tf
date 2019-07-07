
output "client-id" {
  value = "${aws_cognito_user_pool_client.client.id}"
}

output "client-secret" {
  value = "${aws_cognito_user_pool_client.client.client_secret}"
}
