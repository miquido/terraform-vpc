###########################
# VPC Endpoints S3, ECR API, ECR DKR
###########################

data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

resource "aws_vpc_endpoint" "s3" {
  count = var.enable_ecs_fargate_private_link == "true" ? 1 : 0

  vpc_id       = module.vpc.vpc_id
  service_name = data.aws_vpc_endpoint_service.s3.service_name
}

resource "aws_vpc_endpoint_route_table_association" "private-s3" {
  count = var.enable_ecs_fargate_private_link == "true" ? local.private_subnets_count : 0

  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(module.dynamic-subnets.private_route_table_ids, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "public-s3" {
  count = var.enable_ecs_fargate_private_link == "true" ? local.public_subnets_count : 0

  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(module.dynamic-subnets.public_route_table_ids, count.index)
}

data "aws_vpc_endpoint_service" "ecr-dkr" {
  service = "ecr.dkr"
}

resource "aws_vpc_endpoint" "ecr-dkr" {
  count = var.enable_ecs_fargate_private_link == "true" ? 1 : 0

  vpc_id              = module.vpc.vpc_id
  service_name        = data.aws_vpc_endpoint_service.ecr-dkr.service_name
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = [module.vpc.vpc_default_security_group_id]
  subnet_ids          = module.dynamic-subnets.private_subnet_ids
}

