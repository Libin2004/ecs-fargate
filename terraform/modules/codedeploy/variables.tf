variable "codedeploy_role_arn" {}


variable "blue_tg_name" {
  type = string
}

variable "green_tg_name" {
  type = string
}

variable "prod_listener_arn" {
  type = string
}



variable "cluster_name" {
description = "ECS cluster name"
type        = string
default     = "strapi-cluster-libin"
}

variable "service_name" {
description = "ECS service name"
type        = string
default     = "strapi-service-libin"
}
