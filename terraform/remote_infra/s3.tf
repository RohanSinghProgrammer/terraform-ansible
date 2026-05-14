resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "rohan-terraform-state-bucket-2026-0513"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}