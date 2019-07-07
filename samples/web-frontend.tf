module "website" {
  source = "../modules/s3-hosted-website"
  "ssl-domain-root" = "axetay.com"
  "website-host-name" = "test.axetay.com"
  "hosted-zone" = "axetay.com"
}
