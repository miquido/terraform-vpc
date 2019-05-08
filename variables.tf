variable "environment" {
  default     = ""
  description = "Environment name"
}

variable "name" {
  type        = "string"
  description = "Resource common name"
}

variable "project" {
  type        = "string"
  description = "Account/Project Name"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Tags to apply on repository"
}

variable "cidr" {
  type        = "string"
  default     = "10.0.0.0/16"
  description = "CIDR for the VPC"
}

variable "region" {
  type        = "string"
  description = "AWS Region"
}

variable "azs" {
  type        = "list"
  default     = []
  description = "List of Availability Zones where subnets will be created"
}

variable "nat_gateway_mode" {
  type        = "string"
  description = "Flag to enable/disable NAT gateways for private subnets. Possible values: off, standard, single"
  default     = "standard"
}

variable "enable_ecs_fargate_private_link" {
  type        = "string"
  description = "Controls whether to create VPC Endpoints regarding AWS ECS with Fargate services in managed VPC"
  default     = "false"
}
