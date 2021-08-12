provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

module "label" {
  source = "github.com/mitlibraries/tf-mod-name?ref=0.13"
  name   = var.name
  tags   = var.tags
}

resource "aws_s3_bucket" "default" {
  bucket        = var.hostname
  acl           = "public-read"
  tags          = module.label.tags
  region        = var.region
  force_destroy = var.force_destroy

  website {
    index_document = var.index_document
    error_document = var.error_document
    routing_rules  = var.routing_rules
  }

  cors_rule {
    allowed_headers = var.cors_allowed_headers
    allowed_methods = var.cors_allowed_methods
    allowed_origins = var.cors_allowed_origins
    expose_headers  = var.cors_expose_headers
    max_age_seconds = var.cors_max_age_seconds
  }

  versioning {
    enabled = var.versioning_enabled
  }
}

resource "aws_route53_record" "domain_hostname" {
  name    = var.hostname
  type    = "A"
  zone_id = var.parent_zone_id

  alias {
    name                   = aws_s3_bucket.default.website_domain
    zone_id                = aws_s3_bucket.default.hosted_zone_id
    evaluate_target_health = "false"
  }
}

