terraform {
  backend "s3" {
    bucket       = "telco-dev-use2-s3-tfstate-01"
    key          = "aws/dev.tfstate"
    region       = "us-east-2"
    profile      = "telco-tf"
    encrypt      = true
    use_lockfile = true # native S3 locking, no DynamoDB table
  }
}
