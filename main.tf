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
  access_key = "AKIA6O2T2R7FFKRXG7XH"
  secret_key = "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"
}

