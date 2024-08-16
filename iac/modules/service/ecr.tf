resource "aws_ecr_repository" "service_ecr" {
    name = var.service_name
    force_delete = true  # it deletes the repository even if it contains images
}
