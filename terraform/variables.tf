
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR for public subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR for public subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az1" {
  description = "Availability Zone 1"
  type        = string
  default     = "us-east-1a"
}

variable "az2" {
  description = "Availability Zone 2"
  type        = string
  default     = "us-east-1b"
}


variable "image" {
  description = "ECR image URI for ECS task"
  type        = string
}


variable "codedeploy_role_arn" {
  description = "IAM role ARN for CodeDeploy ECS deployment"
  type        = string
}

variable "execution_role_arn" {
  description = "ECS execution role ARN"
  type        = string
}

variable "task_role_arn" {
  description = "ECS task role ARN"
  type        = string
}
