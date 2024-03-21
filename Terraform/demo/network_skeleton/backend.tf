terraform {
  backend "s3" {
    bucket = "kpmg-demo-terraform"
    key    = "env/prod/network.tfstate"
    region = "us-east-1"
  }
}