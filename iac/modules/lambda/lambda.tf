resource "aws_lambda_function" "language_detector" {
    function_name = "language-detector"
    filename = var.lambda_zip_path
    handler = "lambda.handler"  # main file + main function
    runtime = "python3.11"
    memory_size = 256
    source_code_hash = filebase64sha256("${var.lambda_zip_path}")
    ephemeral_storage {
      size = 512
    }
    role = aws_iam_role.github_clone_lambda.arn
    layers = [
        "arn:aws:lambda:${var.aws_region}:553035198032:layer:git-lambda2:8"
    ]
    timeout = 120
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
