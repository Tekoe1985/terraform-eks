

provider "aws" {
  region = var.region
}
data "aws_availability_zones" "available" {}

locals {
  cluster_name = "nella-eks-${random_string.suffix.result}"
}
resource "random_string" "suffix" {
  length = 8
  lower  = false
  upper  = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = "nella-eks-vpc"
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway   = true
  enable_vpn_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = false
  enable_dns_support   = false

  tags = {
    Name        = "nella-eks-vpc"
    Environment = "dev"
  }
}