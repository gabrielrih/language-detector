resource "aws_iam_role" "task_execution_role" {
  name               = "${var.service_name}-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.task_execution_role_assume_role_policy.json
}

data "aws_iam_policy_document" "task_execution_role_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "task_execution_role_policy_attachment" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# resource "aws_iam_role_policy" "task_execution_role_policy" {
#   name   = "${var.service_name}-task-execution-role-policy"
#   role   = aws_iam_role.task_execution_role.id
#   policy = data.aws_iam_policy_document.task_execution_role_policy.json
# }
