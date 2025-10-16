# output "eks_cluster_name" {
#   description = "Name of the EKS cluster"
#   value       = aws_eks_cluster.this.cluster_name
# }

# output "eks_cluster_endpoint" {
#   description = "Endpoint for the Kubernetes API server"
#   value       = aws_eks_cluster.this.endpoint
# }

# output "eks_cluster_arn" {
#   description = "ARN of the EKS cluster"
#   value       = aws_eks_cluster.this.cluster_arn
# }

# output "eks_node_group_names" {
#   description = "List of EKS managed node group names"
#   value       = [for ng in aws_eks_cluster.this.eks_managed_node_groups : ng.node_group_name]
# }