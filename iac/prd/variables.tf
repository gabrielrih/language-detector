variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "service_name" {
    type = string
    default = "language_detector"
}

variable "service_version" {
    type = string
    default = "0.2.2"
}

variable "service_internal_port" {
    type = number
    default = 8000
}
