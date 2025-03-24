terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
  }
  backend "s3" {
    bucket = "terraform-backend-nupoor"
    key = "newstate/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "state_lock_nupoor"

  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}
