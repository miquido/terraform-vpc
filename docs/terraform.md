## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azs | List of Availability Zones where subnets will be created | list | `<list>` | no |
| cidr | CIDR for the VPC | string | `10.0.0.0/16` | no |
| enable_vpc_private_link | Controls whether to create VPC Endpoints regarding AWS S3/ECR services in managed VPC | string | `false` | no |
| environment | Environment name | string | `` | no |
| name | Resource common name | string | - | yes |
| nat_gateway_mode | Flag to enable/disable NAT gateways for private subnets. Possible values: off, standard, single | string | `standard` | no |
| project | Account/Project Name | string | - | yes |
| region | AWS Region | string | - | yes |
| tags | Tags to apply on repository | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| igw_id | - |
| private_route_table_ids | - |
| private_subnet_ids | - |
| public_route_table_ids | - |
| public_subnet_ids | - |
| vpc_cidr | - |
| vpc_default_network_acl_id | The ID of the network ACL created by default on VPC creation |
| vpc_default_route_table_id | The ID of the route table created by default on VPC creation |
| vpc_default_security_group_id | The ID of the security group created by default on VPC creation |
| vpc_id | - |

