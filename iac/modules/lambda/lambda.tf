resource "aws_lambda_function" "language_detector" {
    function_name = "language-detector"
    filename = var.lambda_zip_path
    handler = "lambda.handler"  # main file + main function
    runtime = var.python_runtime
    memory_size = 256
    source_code_hash = filebase64sha256("${var.lambda_zip_path}")
    ephemeral_storage {
      size = 512
    }
    role = aws_iam_role.language_detector.arn
    layers = [
        aws_lambda_layer_version.lambda_layer.arn
    ]
    timeout = 120
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = var.lambda_layer_zip_path
  layer_name = "scikit_learn"
  compatible_runtimes = [var.python_runtime]
}

resource "aws_iam_role" "language_detector" {
    name = "language-detector-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })
}
