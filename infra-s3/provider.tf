terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket = "pgr301-terraform-state"  
    key    = "kandidat-61-s3.tfstate"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
