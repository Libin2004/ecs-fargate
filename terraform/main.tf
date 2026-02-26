data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


module "sg" {
  source = "./modules/secgrp"
  
  vpc_id = data.aws_vpc.default.id
}


module "alb" {
  source = "./modules/alb"

  subnet_1  = data.aws_subnets.default.ids[0]
  subnet_2  = data.aws_subnets.default.ids[1]
  alb_sg_id = module.sg.alb_sg_id
  vpc_id    = data.aws_vpc.default.id
}


resource "aws_ecs_cluster" "cluster" {
  name = "strapi-cluster-libin"
}


module "ecs" {
  source = "./modules/ecs"

  cluster_id   = aws_ecs_cluster.cluster.id
  subnet_1     = data.aws_subnets.default.ids[0]
  subnet_2     = data.aws_subnets.default.ids[1]
  ecs_sg_id    = module.sg.ecs_sg_id

  blue_tg_arn  = module.alb.blue_tg_arn
  green_tg_arn = module.alb.green_tg_arn

  image = var.image
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
  task_definition_arn = aws_ecs_task_definition.strapi.arn
}


module "codedeploy" {
  source = "./modules/codedeploy"

  codedeploy_role_arn = var.codedeploy_role_arn
  cluster_name        = "strapi-cluster-libin"
  service_name        = module.ecs.service_name

  blue_tg_name       = module.alb.blue_tg_name
  green_tg_name      = module.alb.green_tg_name
  prod_listener_arn  = module.alb.prod_listener_arn
  test_listener_arn  = module.alb.test_listener_arn
}

resource "aws_ecs_task_definition" "strapi" {
  family                   = "strapi-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"

  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn

  container_definitions = jsonencode([
    {
      name  = "strapi"
      image = var.image
      essential = true

      portMappings = [
        {
          containerPort = 1337
          hostPort      = 1337
        }
      ]

      environment = [
        { name = "HOST", value = "0.0.0.0" },
        { name = "PORT", value = "1337" }
      ]
    }
  ])
}