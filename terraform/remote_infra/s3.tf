resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "terraform_state_bucket"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}