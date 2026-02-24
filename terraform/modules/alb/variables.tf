variable "subnet_1" {
  description = "Public subnet 1 ID"
  type        = string
}

variable "subnet_2" {
  description = "Public subnet 2 ID"
  type        = string
}

variable "alb_sg_id" {
  description = "ALB Security Group ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_name" {
  description = "ALB Name"
  type        = string
  default     = "strapi-alb-libin"
}

variable "alb_tag_name" {
  description = "ALB Tag Name"
  type        = string
  default     = "strapi-alb"
}

variable "target_group_name" {
  description = "Target Group Name"
  type        = string
  default     = "strapi-tg-libin"
}