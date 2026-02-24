
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  az1                  = var.az1
  az2                  = var.az2
}


module "sg" {
  source = "./modules/secgrp"

  vpc_id = module.vpc.vpc_id
}


module "alb" {
  source = "./modules/alb"

  subnet_1  = module.vpc.public_subnet_1_id
  subnet_2  = module.vpc.public_subnet_2_id
  alb_sg_id = module.sg.alb_sg_id
  vpc_id    = module.vpc.vpc_id
}

# 🔹 ECS CLUSTER (ROOT LEVEL)
resource "aws_ecs_cluster" "cluster" {
  name = "strapi-cluster-libin"
}


module "ecs" {
  source = "./modules/ecs"

  cluster_id   = aws_ecs_cluster.cluster.id
  subnet_1     = module.vpc.public_subnet_1_id
  subnet_2     = module.vpc.public_subnet_2_id
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

  blue_tg_name  = "strapi-blue-tg"
  green_tg_name = "strapi-green-tg"

  listener_arn = module.alb.listener_arn
}