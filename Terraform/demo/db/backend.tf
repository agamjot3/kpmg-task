terraform {
  backend "s3" {
    bucket = "kpmg-demo-terraform"
    key    = "env/prod/db.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "resources" {
  backend = "s3"

  config = {
    bucket = "kpmg-demo-terraform"
    key    = "env/prod/resources.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "kpmg-demo-terraform"
    key    = "env/prod/network.tfstate"
    region = "us-east-1"
  }
}