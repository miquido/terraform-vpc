module "single-nat-label" {
  source    = "git@github.com:cloudposse/terraform-terraform-label?ref=0.2.1"
  name      = "${var.name}"
  namespace = "${var.project}"
  stage     = "${var.environment}"
  tags      = "${var.tags}"
}

resource "aws_eip" "single-nat" {
  count = "${local.nat_gateway_single_enabled == "true" ? 1 : 0}"

  vpc  = true
  tags = "${module.single-nat-label.tags}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "single-nat" {
  count = "${local.nat_gateway_single_enabled == "true" ? 1 : 0}"

  allocation_id = "${element(aws_eip.single-nat.*.id, count.index)}"
  subnet_id     = "${element(module.dynamic-subnets.public_subnet_ids, count.index)}"
  tags          = "${module.single-nat-label.tags}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route" "default" {
  count = "${local.nat_gateway_single_enabled ? local.private_subnets_count : 0}"

  route_table_id         = "${element(module.dynamic-subnets.private_route_table_ids, count.index)}"
  nat_gateway_id         = "${element(aws_nat_gateway.single-nat.*.id, 0)}"
  destination_cidr_block = "0.0.0.0/0"
}
