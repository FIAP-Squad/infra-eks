provider "aws" {
  region = "us-east-1"
}

variable "cluster_name" {
  default = "fiap-fase3-eks"
}

variable "cluster_version" {
  default = "1.29"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "fiap-fase3-eks-tf"
    key    = "backend"
    region = "us-east-1"
  }

}