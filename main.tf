module "vpc" {
  source                         = "git@github.com:cloudposse/terraform-aws-vpc?ref=0.4.0"
  name                           = "${var.name}"
  namespace                      = "${var.project}"
  stage                          = "${var.environment}"
  cidr_block                     = "${var.cidr}"
  tags                           = "${var.tags}"
  enable_dns_hostnames           = "true"
  enable_dns_support             = "true"
  enable_classiclink             = "false"
  enable_classiclink_dns_support = "false"
}

locals {
  nat_gateway = {
    "standard" = {
      single_nat_gateway_enabled = "false"
      nat_gateway_per_az_enabled = "true"
    }

    "single" = {
      single_nat_gateway_enabled = "true"
      nat_gateway_per_az_enabled = "false"
    }

    "off" = {
      single_nat_gateway_enabled = "false"
      nat_gateway_per_az_enabled = "false"
    }
  }
}

module "dynamic-subnets" {
  source              = "git@github.com:cloudposse/terraform-aws-dynamic-subnets?ref=0.8.0"
  name                = "${var.name}"
  namespace           = "${var.project}"
  stage               = "${var.environment}"
  region              = "${var.region}"
  availability_zones  = "${var.azs}"
  vpc_id              = "${module.vpc.vpc_id}"
  igw_id              = "${module.vpc.igw_id}"
  cidr_block          = "${var.cidr}"
  nat_gateway_enabled = "${lookup(local.nat_gateway[var.nat_gateway_mode], "nat_gateway_per_az_enabled")}"
  tags                = "${var.tags}"
}

###########################
# VPC Endpoints S3, ECR API, ECR DKR
###########################

data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = "${module.vpc.vpc_id}"
  service_name = "${data.aws_vpc_endpoint_service.s3.service_name}"
}

resource "aws_vpc_endpoint_route_table_association" "private-s3" {
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
  route_table_id  = "${element(module.dynamic-subnets.private_route_table_ids, count.index)}"
}

resource "aws_vpc_endpoint_route_table_association" "public-s3" {
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
  route_table_id  = "${element(module.dynamic-subnets.public_route_table_ids, count.index)}"
}

data "aws_vpc_endpoint_service" "ecr-api" {
  service = "ecr.api"
}

resource "aws_vpc_endpoint" "ecr-api" {
  vpc_id            = "${module.vpc.vpc_id}"
  service_name      = "${data.aws_vpc_endpoint_service.ecr-api.service_name}"
  vpc_endpoint_type = "Interface"

  security_group_ids = ["${module.vpc.vpc_default_security_group_id}"]
  subnet_ids         = ["${module.dynamic-subnets.private_subnet_ids}"]
}

data "aws_vpc_endpoint_service" "ecr-dkr" {
  service = "ecr.dkr"
}

resource "aws_vpc_endpoint" "ecr-dkr" {
  vpc_id            = "${module.vpc.vpc_id}"
  service_name      = "${data.aws_vpc_endpoint_service.ecr-dkr.service_name}"
  vpc_endpoint_type = "Interface"

  security_group_ids = ["${module.vpc.vpc_default_security_group_id}"]
  subnet_ids         = ["${module.dynamic-subnets.private_subnet_ids}"]
}
