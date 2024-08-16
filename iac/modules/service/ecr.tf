resource "aws_ecr_repository" "service_ecr" {
    name = var.service_name
}
