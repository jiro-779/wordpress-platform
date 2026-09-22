variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "environment" {
  description = "Deployment environment: dev or prod"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the environment VPC"
  type        = string
}
variable "az_1" {
  type = string
}

variable "az_2" {
  type = string
}

variable "public_subnet_1_cidr" {
  type = string
}

variable "public_subnet_2_cidr" {
  type = string
}

variable "private_subnet_1_cidr" {
  type = string
}

variable "private_subnet_2_cidr" {
  type = string
}
variable "db_subnet_1_cidr" {
  type = string
}

variable "db_subnet_2_cidr" {
  type = string
}
variable "nat_gateway_count" {
  description = "Number of NAT Gateways"
  type        = number
}