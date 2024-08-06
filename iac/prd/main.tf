provider "aws" {
    region = var.aws_region
}

module "lambda" {
    source = "../modules/lambda"
    aws_region = ""
    lambda_zip_path = ""
}
