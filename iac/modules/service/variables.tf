variable "service_name" {
    type = string
}

variable "service_version" {
    type = string
}

variable "service_internal_port" {
    type = number
}

variable "aws_region" {
    type = string
}

variable "aws_default_vpc_id" {
    type = string
}

variable "aws_default_subnet_a_id" {
    type = string
}

variable "aws_default_subnet_b_id" {
    type = string
}

variable "aws_ecs_cluster_id" {
    type = string
}
