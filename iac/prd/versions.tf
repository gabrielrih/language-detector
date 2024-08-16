terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ae2b1fca515949e5d54fb22b8ed95575"
    workspaces {
      name = "language-detector"
    }
  }
}
