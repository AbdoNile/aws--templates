
output "idp-client-id" {
  value = "${module.idp.client-id}"
}

output "idp-client-secret" {
  value = "${module.idp.client-secret}"
}

output "ssl" {
  value = "${module.certificate.arn}"
}