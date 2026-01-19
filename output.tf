output "cluster_id" {
    description = "The ID of the EKS cluster"
    value       = module.eks.cluster_id
  
}
output "cluster_endpoint" {
    description = "The endpoint of the EKS cluster"
    value       = module.eks.cluster_endpoint
}
output "cluster_security_group_id" {
    description = "The security group ID of the EKS cluster"
    value       = module.eks.cluster_security_group_id
/*}
#output "cluster_kubeconfig_certificate_authority_data" {
    #description = "The certificate authority data for the EKS cluster kubeconfig"
    #value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
*/}
output "region" {
    description = "The AWS region of the EKS cluster"
    value       = var.region
}
output "oidc_provider_arn" {
    description = "The OIDC provider ARN of the EKS cluster"
    value       = module.eks.oidc_provider_arn
}