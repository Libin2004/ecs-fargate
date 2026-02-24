variable "vpc_id" {
  type = string
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