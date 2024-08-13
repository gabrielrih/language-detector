provider "aws" {
    region = var.aws_region
}

module "lambda" {
    source = "../modules/lambda"
    aws_region = var.aws_region
    lambda_zip_path = var.lambda_zip_path
    lambda_layer_zip_path = var.lambda_layer_zip_path
}
