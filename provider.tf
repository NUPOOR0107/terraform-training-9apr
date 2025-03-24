terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1" # Choose your desired AWS region
  assume_role {
    role_arn     = "arn:aws:iam::975050107505:role/terraform-assume-role-to-be-removed" # IAM role ARN to assume
    session_name = "terraform-tht-session"                                              # Session name for the assume role
  }
}