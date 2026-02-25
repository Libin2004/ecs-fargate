resource "aws_ecs_service" "service" {
  name            = "strapi-service"
  cluster         = var.cluster_id
  task_definition = var.task_definition_arn
  desired_count   = 1

 
  deployment_controller {
    type = "CODE_DEPLOY"
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }

 
  load_balancer {
    target_group_arn = var.blue_tg_arn
    container_name   = "strapi"
    container_port   = 1337
  }

  network_configuration {
     subnets = [
    var.subnet_1,
    var.subnet_2
    ]
    security_groups  = [var.ecs_sg_id]
    assign_public_ip = true
  }
lifecycle {
  ignore_changes = [
    task_definition,
    network_configuration,
    load_balancer
  ]
 }
}