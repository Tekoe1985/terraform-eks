

module "eks" {
  source             = "terraform-aws-modules/eks/aws"
  version            = "21.14.0"
  name               = var.cluster_name
  kubernetes_version = var.Kubernetes_version
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnets

  eks_managed_node_groups = {
    aws-eks-nodes = {
    ami_type               = "AL2023_x86_64_STANDARD"
    #vpc_security_group_ids = [aws_security_group.eks-sg.id]
      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.medium"]
    }
  }
}


