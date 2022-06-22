terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  alias = "acm_provider"
  region = "us-east-1"
}

# SSL Certificate
resource "aws_acm_certificate" "ssl_certificate" {
  provider = aws.acm_provider
  domain_name = var.domain_name
  validation_method = "DNS"
  
  lifecycle {
    create_before_destroy = true
  }
}

output "dns-record-to-update" {
  value = aws_acm_certificate.ssl_certificate.domain_validation_options
}

variable "domain_name" {
  type = string
}
