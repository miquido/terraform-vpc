variable "region" {
  type = "string"
  description = "AWS region"
}

variable "azs" {
  type = "list"
  default = ["a","b","c"]
  description = "Defines available availibity, array of letters appended to region name"
}

variable "subnets" {
  default = 2
  description = "Defines how many subnets to create (public and private), should not be more that azs"
}

variable "cidr" {
  default = "10.0.0.0/16"
  description = "VPC Main CIDR, between /16 and /28"
}

variable "project_name" {
    type = "string"
    description = "Project name, added to names of resources"
}

variable "common_tags" {
    type = "map"
    description = "Tags to be attached to every possible resource"
}