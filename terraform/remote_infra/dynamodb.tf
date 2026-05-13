resource "aws_dynamodb_table" "terraform_tfstate_dynamodb_table" {
  name           = "terraform_tfstate_dynamodb_table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}