output "default_vpc_id" {
  description = "The default VPC id"
  value       = aws_default_vpc.default.id
}

output "default_subnet_a_id" {
    description = "The default subnet A id"
    value = aws_default_subnet.default_a.id
}

output "default_subnet_b_id" {
    description = "The default subnet B id"
    value = aws_default_subnet.default_b.id
}

output "ecs_cluster_id" {
    description = "ECS cluster id"
    value = aws_ecs_cluster.common.id
}