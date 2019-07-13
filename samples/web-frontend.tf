module "website" {
  source = "../modules/s3-hosted-website"
  "website-host-name" = "test.axetay.com"
  "hosted-zone" = "axetay.com"
  "ssl-certificate-arn" = "${module.certificate.arn}"
}

module "certificate" {
  source = "../modules/acm-certificate"
  "ssl-domain-root" = "axetay.com"
}
