/*
 * Terraform Base Mod - S3+CF
 * Author: Andrei Marinescu
 */

module "frontend_1" {
  source            = "./modules/s3-cf-static-website"
  cf_root_arn       = "<your us-east-1 ACM ARN>"
  site_domain_name  = "<FQDN for the deployment e.g. app.example.com>"
  cache_policy_id   = aws_cloudfront_cache_policy.cors.id
  cors_s3_policy_id = aws_cloudfront_origin_request_policy.cors_s3.id
}

module "frontend_2" {
  source            = "./modules/s3-cf-static-website"
  cf_root_arn       = "<your us-east-1 ACM ARN>"
  site_domain_name  = "<FQDN for the deployment e.g. dashboard.example.com>"
  cache_policy_id   = aws_cloudfront_cache_policy.cors.id
  cors_s3_policy_id = aws_cloudfront_origin_request_policy.cors_s3.id
}

resource "aws_cloudfront_origin_request_policy" "cors_s3" {
  name    = "Terraform-CORS-S3Origin"
  comment = "Policy for S3 origin with CORS"
  cookies_config {
    cookie_behavior = "none"
  }
  headers_config {
    header_behavior = "whitelist"
    headers {
      items = ["origin", "access-control-request-headers", "access-control-request-method"]
    }
  }
  query_strings_config {
    query_string_behavior = "none"
  }
}

resource "aws_cloudfront_cache_policy" "cors" {
  name        = "Terraform-CORS"
  comment     = "Cache CORS origin headers"
  default_ttl = 86400
  max_ttl     = 31536000
  min_ttl     = 1
  parameters_in_cache_key_and_forwarded_to_origin {
    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip   = true
    headers_config {
      header_behavior = "whitelist"
      headers {
        items = ["Origin", "Access-Control-Request-Method", "Access-Control-Request-Headers"]
      }
    }
    query_strings_config {
      query_string_behavior = "none"
    }
    cookies_config {
      cookie_behavior = "none"
    }
  }
}