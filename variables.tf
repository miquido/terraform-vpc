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

variable "nat_type" {
  type        = "string"
  description = "Configure deployment of NAT instances/gateways for private subnets. Possible values are: gateway-per-az, gateway-single, instance-per-az and off."
  default     = "gateway-per-az"
}

variable "nat_instance_type" {
  description = "NAT Instance type"
  default     = "t3.micro"
}

variable "subnet_type_tag_key" {
  default     = "cpco.io/subnet/type"
  description = "Key for subnet type tag to provide information about the type of subnets, e.g. `cpco.io/subnet/type=private` or `cpco.io/subnet/type=public`"
}

variable "subnet_type_tag_value_format" {
  default     = "%s"
  description = "This is using the format interpolation symbols to allow the value of the subnet_type_tag_key to be modified."
  type        = "string"
}

variable "public_subnet_count" {
  default     = "0"
  description = "Sets the number of deployed public subnets (used for secondary resources as a workaround to terraform issue). When set to 0 it equals number of Availability Zones."
}

variable "private_subnet_count" {
  default     = "0"
  description = "Sets the number of deployed private subnets (used for secondary resources as a workaround to terraform issue). When set to 0 it equals number of Availability Zones."
}

variable "max_subnet_count" {
  default     = 0
  description = "Sets the maximum amount of subnets to deploy. 0 will deploy a subnet for every provided availablility zone (in `availability_zones` variable) within the region"
}

variable "public_network_acl_id" {
  default     = ""
  description = "Network ACL ID that will be added to public subnets. If empty, a new ACL will be created"
}

variable "private_network_acl_id" {
  description = "Network ACL ID that will be added to private subnets. If empty, a new ACL will be created"
  default     = ""
}

variable "map_public_ip_on_launch" {
  default     = "true"
  description = "Instances launched into a public subnet should be assigned a public IP address"
}

variable "enable_ecs_fargate_private_link" {
  type        = "string"
  description = "Controls whether to create VPC Endpoints regarding AWS ECS with Fargate services in managed VPC"
  default     = "false"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}
