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
    bucket = "fiap-proj-fase4-equipe15"
    key    = "backend"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}

# provider "helm" {
#   kubernetes {
#     config_path = "~/.kube/config"
#   }
# }

# Retrieve EKS cluster configuration
data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.cluster.name
}

data "aws_eks_cluster_auth" "cluster" {
  name = aws_eks_cluster.cluster.name
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}