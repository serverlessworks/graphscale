data "aws_caller_identity" "current" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "local" {
    path = "./graphscale.tfstate"
  }
  #   backend "s3" {
  #     encrypt        = true
  #     region         = var.region
  #     key            = "graphscale.tfstate"
  #     dynamodb_table = "terraform-state-lock"
  #   }
}

provider "aws" {
  region = var.region
}
