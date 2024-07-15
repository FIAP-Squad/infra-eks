variable "cluster_name" {
  default = "fiap-fase4-eks"
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
    helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }
  }

  backend "s3" {
    bucket = "fiap-fase4-equipe15"
    key    = "backend"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}