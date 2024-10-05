terraform {
  required_version = ">= 1.9.6"

  backend "s3" {
    bucket         = "github-state"
    dynamodb_table = "github-state-locks"
    encrypt        = true
    key            = "terraform.tfstate"
    profile        = "github-state"
    region         = "us-east-1"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}
