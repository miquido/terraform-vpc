variable "azs" {
  type = "list"
  default = ["a","b","c"]
}

variable "project_name" {
    type = "string"
}

variable "common_tags" {
    type = "map"
}

variable "region" {}