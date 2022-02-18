/*
 * Terraform Base Mod - ACM
 * Author: Andrei Marinescu
 */

resource "aws_acm_certificate" "cert" {
  domain_name               = var.main_common_name
  subject_alternative_names = var.main_alternate_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

//noinspection HILUnresolvedReference
resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.hosted_zone
}

resource "aws_acm_certificate_validation" "domain_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}
