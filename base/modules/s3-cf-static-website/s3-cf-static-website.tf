/*
 * S3+CloudFront static website module
 * Author: Eduard Bulai, Andrei Marinescu
 */


resource "aws_s3_bucket" "site" {
  # Our bucket's name is going to be the same as our site's domain name.
  bucket = var.site_domain_name
  # Because we want our site to be available on the internet, we set this so
  # anyone can read this bucket.
  acl = "public-read"
  # We also need to create a policy that allows anyone to view the content.
  # This is basically duplicating what we did in the ACL but it's required by
  # AWS. This post: http://amzn.to/2Fa04ul explains why.
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Id": "SourceIP",
  "Statement":[
    {
      "Sid":"SourceIP",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:*"],
      "Resource":"arn:aws:s3:::${var.site_domain_name}/*",
      "Condition": {
        "NotIpAddress": {
          "aws:SourceIp": [
            "173.245.48.0/20",
            "103.21.244.0/22",
            "103.22.200.0/22",
            "103.31.4.0/22",
            "141.101.64.0/18",
            "108.162.192.0/18",
            "190.93.240.0/20",
            "188.114.96.0/20",
            "197.234.240.0/22",
            "198.41.128.0/17",
            "162.158.0.0/15",
            "172.64.0.0/13",
            "131.0.72.0/22",
            "104.16.0.0/13",
            "104.24.0.0/14",
            "2400:cb00::/32",
            "2606:4700::/32",
            "2803:f800::/32",
            "2405:b500::/32",
            "2405:8100::/32",
            "2a06:98c0::/29",
            "2c0f:f248::/32"
          ]
          }
      }
    }
  ]
}
POLICY

  # S3 understands what it means to host a website.
  website {
    # Here we tell S3 what to use when a request comes in to the root
    # ex. https://www.example.io
    index_document = "index.html"
    # The page to serve up if a request results in an error or a non-existing
    # page.
    error_document = "404.html"
  }
}

# redirect root domain to site domain (www)
# as exemplified here https://www.pbxdom.com/how-redirect-non-www-to-www-with-amazon-cloud-front-route-53-and-s3
# resource "aws_s3_bucket" "site_root" {
#   # Our bucket's name is going to be the same as our site's domain name.
#   bucket = var.root_domain_name
#   # Because we want our site to be available on the internet, we set this so
#   # anyone can read this bucket.
#   acl    = "public-read"
#   # We also need to create a policy that allows anyone to view the content.
#   # This is basically duplicating what we did in the ACL but it's required by
#   # AWS. This post: http://amzn.to/2Fa04ul explains why.
#   policy = <<POLICY
# {
#   "Version":"2012-10-17",
#   "Statement":[
#     {
#       "Sid":"AddPerm",
#       "Effect":"Allow",
#       "Principal": "*",
#       "Action":["s3:GetObject"],
#       "Resource":["arn:aws:s3:::${var.root_domain_name}/*"]
#     }
#   ]
# }
# POLICY

#   # S3 understands what it means to host a website.
#   website {
#     # # Here we tell S3 what to use when a request comes in to the root
#     # # ex. https://www.example.io
#     # index_document = "index.html"
#     # # The page to serve up if a request results in an error or a non-existing
#     # # page.
#     # error_document = "404.html"
#     redirect_all_requests_to = var.site_domain_name
#   }
# }

resource "aws_cloudfront_distribution" "site_distribution" {
  # origin is where CloudFront gets its content from.
  origin {
    # We need to set up a "custom" origin because otherwise CloudFront won't
    # redirect traffic from the root domain to the www domain, that is from
    # example.io to www.example.io.
    custom_origin_config {
      # These are all the defaults.
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    # Here we're using our S3 bucket's URL!
    domain_name = aws_s3_bucket.site.website_endpoint
    # This can be any name to identify this origin.
    origin_id = var.site_domain_name
  }

  enabled             = true
  default_root_object = "index.html"

  # All values are defaults from the AWS console.
  default_cache_behavior {
    cache_policy_id          = var.cache_policy_id   //aws_cloudfront_cache_policy.cors.id
    origin_request_policy_id = var.cors_s3_policy_id //aws_cloudfront_origin_request_policy.cors_s3.id
    viewer_protocol_policy   = "redirect-to-https"
    compress                 = true
    allowed_methods          = ["GET", "HEAD", "OPTIONS"]
    cached_methods           = ["GET", "HEAD"]
    # This needs to match the `origin_id` above.
    target_origin_id = var.site_domain_name
    min_ttl          = 0
    default_ttl      = 0
    max_ttl          = 0

    # forwarded_values {
    #  query_string = false
    #  cookies {
    #    forward = "none"
    #  }
    #}

    # lambda_function_association {
    #   event_type   = "origin-request"
    #   include_body = false
    #   lambda_arn   = "arn:aws:lambda:us-east-1:909361223211:function:app-redirect:6"
    # }
  }

  custom_error_response {
    error_caching_min_ttl = 300
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }

  # Here we're ensuring we can hit this distribution using www.example.io
  # rather than the domain name CloudFront gives us.
  aliases = [
    var.site_domain_name,
    # var.root_domain_name
  ]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # Here's where our certificate is loaded in
  viewer_certificate {
    acm_certificate_arn = var.cf_root_arn
    ssl_support_method  = "sni-only"
  }
}


