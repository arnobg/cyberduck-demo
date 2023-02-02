terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "us-east-1"
  access_key = "<AWS ACCESS KEY>"
  secret_key = "<AWS SECRET KEY>"
}

