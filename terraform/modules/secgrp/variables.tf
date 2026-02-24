variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "ecs_sg_name" {
  description = "ECS Security Group Name"
  type        = string
  default     = "ecs-sg-libin"
}

variable "alb_sg_name" {
  description = "ALB Security Group Name"
  type        = string
  default     = "alb-sg-libin"
}