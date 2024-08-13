variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "lambda_zip_path" {
    type = string
    default = "../../src/language-detector/python/language-detector.zip"
}

variable "lambda_layer_zip_path" {
    type = string
    default = "../../src/layers/scikit-learn/package.zip"
}
