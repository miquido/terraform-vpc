<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![Miquido][logo]](https://www.miquido.com/)

# miquido-vpc
Provides AWS VPC with Private Subnets and optional NAT Gateways.
---
Terraform Module

BitBucket Repository: https://bitbucket.org/miquido/terraform-vpc
## Usage


## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| azs | List of Availability Zones where subnets will be created | list | `<list>` | no |
| cidr | CIDR for the VPC | string | `10.0.0.0/16` | no |
| enable_ecs_fargate_private_link | Controls whether to create VPC Endpoints regarding AWS ECS with Fargate services in managed VPC | string | `false` | no |
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



## Developing

1. Make changes in terraform files

2. Regerate documentation

    ```bash
    bash <(curl -s https://terraform.s3.k.miquido.net/update.sh)
    ```

3. Run lint

    ```
    make lint
    ```

## Copyright

Copyright © 2017-2019 [Miquido](https://miquido.com)



### Contributors

|  [![Konrad Obal][k911_avatar]][k911_homepage]<br/>[Konrad Obal][k911_homepage] |
|---|

  [k911_homepage]: https://github.com/k911
  [k911_avatar]: https://github.com/k911.png?size=150



  [logo]: https://www.miquido.com/img/logos/logo__miquido.svg
  [website]: https://www.miquido.com/
  [github]: https://github.com/miquido
  [bitbucket]: https://bitbucket.org/miquido
