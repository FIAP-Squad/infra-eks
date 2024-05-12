provider "aws" {
  region = "us-east-1"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

variable "cluster_name" {
  default = "fiap-fase3-eks"
}

variable "cluster_version" {
  default = "1.29"
}

variable "role" {
  default = "arn:aws:iam::725886856494:role/LabRole"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.1"
    }
  }

  backend "s3" {
    bucket = "fiap-fase3-equipe15"
    key    = "backend"
    region = "us-east-1"
  }

}