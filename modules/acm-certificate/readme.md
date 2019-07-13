# Provisions an AWS ACM Certificate and Validation

- Provisions a certificate in ACM
- all sub domains of the passed domain will be registered as alternative names
- if there is a hosted zone with same domain name in Route53 , it will vaidate the SSL certificate by updating the relevant hosted zone records

## inputs
ssl-domain-root: example.com


## outpus
arn : certificate arn

