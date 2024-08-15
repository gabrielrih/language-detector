resource "null_resource" "push" {
    depends_on = [ aws_ecr_repository.service_ecr ]

    provisioner "local-exec" {
        command = "docker build -t ${service_name}:${var.service_version} ${path.root}/../../"
    }

    provisioner "local-exec" {
        command = "docker tag ${service_name}:${var.service_version} ${aws_ecr_repository.service_ecr.repository_url}:${var.service_version}"
    }

    provisioner "local-exec" {
        command = "aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${aws_ecr_repository.service_ecr.repository_url}"
    }

    provisioner "local-exec" {
        command = "docker push ${aws_ecr_repository.service_ecr.repository_url}:${var.service_version}"
    }

    triggers = {
      version = var.service_version
    }
}
