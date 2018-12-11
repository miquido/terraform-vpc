variable "azs" {
  type = "list"
  default = ["a","b","c"]
}

variable "subnets" {
  default = 2
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "project_name" {
    type = "string"
}

variable "common_tags" {
    type = "map"
}

variable "region" {}