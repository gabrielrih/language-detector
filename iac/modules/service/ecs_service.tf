resource "aws_cloudwatch_log_group" "service_log_group" {
  name = "/ecs/service/${var.service_name}"
}

resource "aws_ecs_task_definition" "service_ecs_task_definition" {
  family                   = "${var.service_name}-task-definition"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.task_execution_role.arn
  container_definitions    = <<DEFINITION
  [
    {
      "name": "${var.service_name}",
      "image": "${aws_ecr_repository.service_ecr.repository_url}:${var.service_version}",
      "essential": true,
      "memory": 512,
      "cpu": 256,
      "networkMode": "awsvpc",
      "taskRoleArn": "${aws_iam_role.task_execution_role.arn}",
      "executionRoleArn": "${aws_iam_role.task_execution_role.arn}",
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.service_log_group.name}",
          "awslogs-region": "${var.aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
      },
      "environment": [
        {
          "name": "SERVICE_INTERNAL_PORT",
          "value": "${var.service_internal_port}"
        }
      ],
      "portMappings": [
        {
          "containerPort": ${var.service_internal_port},
          "hostPort": ${var.service_internal_port}
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_security_group" "service_sg" {
    name = "ecs-sg"
    ingress {
        from_port = var.service_internal_port
        to_port = var.service_internal_port
        protocol = "tcp"
        security_groups = [ aws_security_group.load_balancer_sg.id ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_ecs_service" "service_ecs_service" {
  name            = "${var.service_name}"
  cluster         = var.aws_ecs_cluster_id
  task_definition = aws_ecs_task_definition.service_ecs_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [var.aws_default_subnet_a_id]
    security_groups  = [aws_security_group.service_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.service_lb_tg.arn
    container_name   = aws_ecs_task_definition.service_ecs_task_definition.family
    container_port   = var.service_internal_port
  }

  depends_on = [aws_lb_listener.service_lb_listener]
}
