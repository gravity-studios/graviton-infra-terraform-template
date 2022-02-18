/*
 * S3+CloudFront static website module
 * Author: Eduard Bulai, Andrei Marinescu
 */

output "cloudfront_url" {
  value = aws_cloudfront_distribution.site_distribution.domain_name
}