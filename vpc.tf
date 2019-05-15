resource "aws_vpc" "main" {
  cidr_block = "${var.cidr}"

  tags = "${merge(var.common_tags,
  map(
      "Name",  "${var.project_name} VPC"
  )
  )}"

  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
  tags   = "${var.common_tags}"
}

resource "aws_subnet" "public_subnets" {
  count                   = "${var.subnets}"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${cidrsubnet("10.0.0.0/16",8, count.index)}"
  availability_zone       = "${var.region}${element(var.azs, count.index)}"
  map_public_ip_on_launch = true

  tags = "${merge(var.common_tags,
  map(
      "Name",  "${format("${var.project_name} public subnet %03d", count.index + 1)}"
  )
  )}"
}

resource "aws_subnet" "private_subnets" {
  count             = "${var.subnets}"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet("10.0.0.0/16",8, count.index + var.subnets)}"
  availability_zone = "${var.region}${element(var.azs, count.index)}"

  tags = "${merge(var.common_tags,
  map(
      "Name",  "${format("${var.project_name} private subnet %03d", count.index + 1)}"
  )
  )}"
}

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public_subnets.0.id}"
}

resource "aws_default_route_table" "public" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route" "public" {
  route_table_id         = "${aws_default_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}

resource "aws_route" "private" {
  route_table_id         = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat_gw.id}"
}

resource "aws_route_table_association" "public" {
  count          = "${var.subnets}"
  subnet_id      = "${element(aws_subnet.public_subnets.*.id, count.index)}"
  route_table_id = "${aws_default_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  count          = "${var.subnets}"
  subnet_id      = "${element(aws_subnet.private_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.private.id}"
}
