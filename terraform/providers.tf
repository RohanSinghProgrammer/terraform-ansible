terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "aws" {
    bucket = "terraform_state_bucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform_tfstate_dynamodb_table"
  }
}

provider "aws" {
  region = "ap-south-1"
}
