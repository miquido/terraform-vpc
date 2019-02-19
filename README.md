## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azs | Defines available availibity, array of letters appended to region name | list | `<list>` | no |
| cidr | VPC Main CIDR, between /16 and /28 | string | `10.0.0.0/16` | no |
| common\_tags | Tags to be attached to every possible resource | map | - | yes |
| nat | Defines whether create NAT gateway for private subnet to reach internet (true/false) | string | - | yes |
| project\_name | Project name, added to names of resources | string | - | yes |
| region | AWS region | string | - | yes |
| subnets | Defines how many subnets to create (public and private), should not be more that azs | string | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_subnets | IDs of private subnets |
| public\_subnets | IDs of public subnets |
| vpc\_id | IDs of VPC |