terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = ""
    key            = ""
    region         = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = ""
    encrypt        = true
    access_key     = ""
    secret_key     = ""
  }
}
