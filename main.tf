module "vpc" {
  source                         = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.8.0"
  name                           = var.name
  namespace                      = var.project
  stage                          = var.environment
  cidr_block                     = var.cidr
  tags                           = var.tags
  instance_tenancy               = var.instance_tenancy
  enable_dns_hostnames           = "true"
  enable_dns_support             = "true"
  enable_classiclink             = "false"
  enable_classiclink_dns_support = "false"
}

locals {
  nat = {
    "gateway-per-az" = {
      nat_gateway_enabled        = "true"
      nat_instance_enabled       = "false"
      nat_gateway_single_enabled = "false"
    }
    "gateway-single" = {
      nat_gateway_enabled        = "false"
      nat_instance_enabled       = "false"
      nat_gateway_single_enabled = "true"
    }
    "instance-per-az" = {
      nat_gateway_enabled        = "false"
      nat_instance_enabled       = "true"
      nat_gateway_single_enabled = "false"
    }
    "off" = {
      nat_gateway_enabled        = "false"
      nat_instance_enabled       = "false"
      nat_gateway_single_enabled = "false"
    }
  }

  nat_gateway_enabled        = local.nat[var.nat_type]["nat_gateway_enabled"]
  nat_instance_enabled       = local.nat[var.nat_type]["nat_instance_enabled"]
  nat_gateway_single_enabled = local.nat[var.nat_type]["nat_gateway_single_enabled"]

  public_subnets_count  = var.public_subnet_count == "0" ? length(var.azs) : var.public_subnet_count
  private_subnets_count = var.private_subnet_count == "0" ? length(var.azs) : var.private_subnet_count
}

module "dynamic-subnets" {
  source                       = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.16.0"
  name                         = var.name
  namespace                    = var.project
  stage                        = var.environment
  availability_zones           = var.azs
  vpc_id                       = module.vpc.vpc_id
  igw_id                       = module.vpc.igw_id
  cidr_block                   = var.cidr
  nat_gateway_enabled          = local.nat_gateway_enabled
  nat_instance_enabled         = local.nat_instance_enabled
  nat_instance_type            = var.nat_instance_type
  max_subnet_count             = var.max_subnet_count
  subnet_type_tag_key          = var.subnet_type_tag_key
  subnet_type_tag_value_format = var.subnet_type_tag_value_format
  public_network_acl_id        = var.public_network_acl_id
  private_network_acl_id       = var.private_network_acl_id
  map_public_ip_on_launch      = var.map_public_ip_on_launch
  tags                         = var.tags
}

