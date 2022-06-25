terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}

cloud {
    organization = "teashaped"

    workspaces {
      name = "fridge-mate"
    }
  }

resource "random_pet" "lambda_bucket_name" {
  prefix = "lambda-artifacts"
  length = 1
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = random_pet.lambda_bucket_name.id
  force_destroy = true
}

locals {
  mime_types = jsondecode(file("${path.module}/mime.json"))
}

