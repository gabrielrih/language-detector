variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "lambda_zip_path" {
    type = string
    default = "../../src/language-detector/language-detector.zip"
}
