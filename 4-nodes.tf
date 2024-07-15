resource "aws_eks_node_group" "app" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "backend"
  node_role_arn   = "arn:aws:iam::414203079915:role/LabRole"
  subnet_ids      = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

}