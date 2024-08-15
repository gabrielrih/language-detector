resource "aws_ecs_cluster" "common" {
  name = var.ecs_cluster_name
}
