## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azs | Defines available availibity, array of letters appended to region name | list(string) | `<list>` | no |
| cidr | VPC Main CIDR, between /16 and /28 | string | `10.0.0.0/16` | no |
| common_tags | Tags to be attached to every possible resource | map(string) | - | yes |
| enable_dns_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC | string | `true` | no |
| enable_dns_support | A boolean flag to enable/disable DNS support in the VPC | string | `true` | no |
| project_name | Project name, added to names of resources | string | - | yes |
| region | AWS region | string | - | yes |
| subnets | Defines how many subnets to create (public and private), should not be more that azs | string | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| private_subnets | IDs of private subnets |
| public_subnets | IDs of public subnets |
| vpc_id | IDs of VPC |

