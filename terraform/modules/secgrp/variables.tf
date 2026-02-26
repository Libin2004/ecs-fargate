variable "vpc_id" {
description = "VPC ID where security groups will be created"
type        = string
}



variable "alb_sg_name" {
description = "Name of the ALB security group"
type        = string
default     = "alb-sg-libin"
}


variable "ecs_sg_name" {
description = "Name of the ECS security group"
type        = string
default     = "ecs-sg-libin"
}



variable "alb_sg_id" {
description = "ALB security group ID (to allow traffic from ALB to ECS)"
type        = string
}
