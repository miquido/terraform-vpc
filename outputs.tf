output "igw_id" {
  value = "${module.vpc.igw_id}"
}

output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_default_route_table_id" {
  value       = "${module.vpc.vpc_default_route_table_id}"
  description = "The ID of the route table created by default on VPC creation"
}

output "vpc_default_network_acl_id" {
  value       = "${module.vpc.vpc_default_network_acl_id}"
  description = "The ID of the network ACL created by default on VPC creation"
}

output "vpc_default_security_group_id" {
  value       = "${module.vpc.vpc_default_security_group_id}"
  description = "The ID of the security group created by default on VPC creation"
}

output "private_route_table_ids" {
  value = "${module.dynamic-subnets.private_route_table_ids}"
}

output "private_subnet_ids" {
  value = "${module.dynamic-subnets.private_subnet_ids}"
}

output "public_route_table_ids" {
  value = "${module.dynamic-subnets.public_route_table_ids}"
}

output "public_subnet_ids" {
  value = "${module.dynamic-subnets.public_subnet_ids}"
}
