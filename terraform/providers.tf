terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.5"
    }
  }
  

  backend "s3" {
    bucket       = "rohan-terraform-state-bucket-2026-0513"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = "ap-south-1"
}
