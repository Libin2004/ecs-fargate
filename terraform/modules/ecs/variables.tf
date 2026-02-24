variable "cluster_id" {
  description = "ECS Cluster ID"
  type        = string
}

variable "subnet_1" {}
variable "subnet_2" {}
variable "ecs_sg_id" {}

variable "blue_tg_arn" {
  description = "Blue target group ARN"
  type        = string
}

variable "green_tg_arn" {
  description = "Green target group ARN"
  type        = string
}

variable "image" {
  description = "ECR image URI"
  type        = string
}


variable "execution_role_arn" {
  description = "Execution role ARN"
  type        = string
}

variable "task_role_arn" {
  description = "Task role ARN"
  type        = string
}