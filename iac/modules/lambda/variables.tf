variable "aws_region" {
    type = string
}

variable "lambda_zip_path" {
    type = string
}

variable "lambda_layer_zip_path" {
    type = string
}

variable "python_runtime" {
    type = string
    default = "python3.11"
}
