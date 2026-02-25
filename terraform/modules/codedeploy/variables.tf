variable "codedeploy_role_arn" {}
variable "cluster_name" {}
variable "service_name" {}
variable "blue_tg_name" {
  type = string
}

variable "green_tg_name" {
  type = string
}
variable "listener_arn" {}