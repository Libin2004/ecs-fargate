variable "subnet_1" {}
variable "subnet_2" {}
variable "alb_sg_id" {}
variable "vpc_id" {}


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