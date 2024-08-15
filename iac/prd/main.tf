provider "aws" {
    region = var.aws_region
}

module "common" {
    source = "../modules/common"
    aws_region = var.aws_region
    ecs_cluster_name = var.service_name
}

module "service" {
    source = "../modules/service"
    service_name = var.service_name
    service_version = var.service_version
    service_internal_port = var.service_internal_port
    aws_region = var.aws_region
    aws_default_vpc_id = module.common.default_vpc_id
    aws_default_subnet_a_id = module.common.default_subnet_a_id
    aws_default_subnet_b_id = module.common.default_subnet_b_id
    aws_ecs_cluster_id = module.common.ecs_cluster_id
}
