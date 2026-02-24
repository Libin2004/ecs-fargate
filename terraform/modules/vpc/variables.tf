variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "strapi-vpc-libin"
}

variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
  default     = "strapi-igw-libin"
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

variable "public_subnet_1_name" {
  type    = string
  default = "strapi-public-1"
}

variable "public_subnet_2_name" {
  type    = string
  default = "strapi-public-2"
}

variable "route_table_name" {
  type    = string
  default = "strapi-public-rt"
}