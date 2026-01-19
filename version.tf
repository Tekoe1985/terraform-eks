terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">=3.8.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.28.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.7.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }
  }

}