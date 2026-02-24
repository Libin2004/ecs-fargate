
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
}


module "codedeploy" {
  source = "./modules/codedeploy"

  codedeploy_role_arn = var.codedeploy_role_arn
  cluster_name        = "strapi-cluster-libin"
  service_name        = module.ecs.service_name

  blue_tg_name  = "strapi-blue-tg-libin"
  green_tg_name = "strapi-green-tg-libin"

  listener_arn = module.alb.listener_arn
}