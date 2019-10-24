## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azs | List of Availability Zones where subnets will be created | list(string) | `<list>` | no |
| cidr | CIDR for the VPC | string | `10.0.0.0/16` | no |
| enable_ecs_fargate_private_link | Controls whether to create VPC Endpoints regarding AWS ECS with Fargate services in managed VPC | string | `false` | no |
| environment | Environment name | string | `` | no |
| instance_tenancy | A tenancy option for instances launched into the VPC | string | `default` | no |
| map_public_ip_on_launch | Instances launched into a public subnet should be assigned a public IP address | string | `true` | no |
| max_subnet_count | Sets the maximum amount of subnets to deploy. 0 will deploy a subnet for every provided availablility zone (in `availability_zones` variable) within the region | string | `0` | no |
| name | Resource common name | string | - | yes |
| nat_instance_type | NAT Instance type | string | `t3.micro` | no |
| nat_type | Configure deployment of NAT instances/gateways for private subnets. Possible values are: gateway-per-az, gateway-single, instance-per-az and off. | string | `gateway-per-az` | no |
| private_network_acl_id | Network ACL ID that will be added to private subnets. If empty, a new ACL will be created | string | `` | no |
| project | Account/Project Name | string | - | yes |
| public_network_acl_id | Network ACL ID that will be added to public subnets. If empty, a new ACL will be created | string | `` | no |
| subnet_type_tag_key | Key for subnet type tag to provide information about the type of subnets, e.g. `cpco.io/subnet/type=private` or `cpco.io/subnet/type=public` | string | `miquido.com/subnet/type` | no |
| subnet_type_tag_value_format | This is using the format interpolation symbols to allow the value of the subnet_type_tag_key to be modified. | string | `%s` | no |
| tags | Tags to apply on repository | map(string) | `<map>` | no |
| vpc_main_security_group_allow_all_egress | Add rule to main security group that allows all egress traffic | bool | `true` | no |
| vpc_main_security_group_allow_self_ingress | Add rule to main security group that allows all ingress traffic from the same group | bool | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| availability_zones | List of Availability Zones where subnets were created |
| igw_id | - |
| nat_gateway_ids | IDs of the NAT Gateways created |
| nat_instance_ids | IDs of the NAT Instances created |
| private_route_table_ids | IDs of the created private route tables |
| private_subnet_cidrs | CIDR blocks of the created private subnets |
| private_subnet_ids | IDs of the created private subnets |
| public_route_table_ids | IDs of the created public route tables |
| public_subnet_cidrs | CIDR blocks of the created public subnets |
| public_subnet_ids | IDs of the created public subnets |
| vpc_cidr | - |
| vpc_default_network_acl_id | The ID of the network ACL created by default on VPC creation |
| vpc_default_route_table_id | The ID of the route table created by default on VPC creation |
| vpc_default_security_group_id | The ID of the security group created by default on VPC creation |
| vpc_id | - |
| vpc_ipv6_association_id | The association ID for the IPv6 CIDR block |
| vpc_ipv6_cidr | The IPv6 CIDR block |
| vpc_main_route_table_id | The ID of the main route table associated with this VPC |
| vpc_main_security_group_id | The ID of the main security group associated with this VPC |

