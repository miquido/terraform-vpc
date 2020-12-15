<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![Miquido][logo]](https://www.miquido.com/)

# miquido-vpc
Provides AWS VPC with Private Subnets and optional NAT Gateways.
---
**Terraform Module**
## Usage


### With single NAT gateway

```hcl
module "vpc" {
  source                          = "git::ssh://git@bitbucket.org/miquido/terraform-vpc.git?ref=master"
  name                            = "main"
  project                         = "example"
  environment                     = "dev"
  tags                            = var.tags
  azs                             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  nat_type                        = "gateway-single"
  enable_ecs_fargate_private_link = false
}
```

You can also deploy VPC without NAT, with NAT instance or NAT gateway per AZ by modyfing value of `nat_type` variable.
<!-- markdownlint-disable -->
## Makefile Targets
```text
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint Terraform code

```
<!-- markdownlint-restore -->
<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 2.0 |
| local | >= 1.2 |
| null | >= 2.0 |
| template | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azs | List of Availability Zones where subnets will be created | `list(string)` | `[]` | no |
| cidr | CIDR for the VPC | `string` | `"10.0.0.0/16"` | no |
| enable\_ecs\_fargate\_private\_link | Controls whether to create VPC Endpoints regarding AWS ECS with Fargate services in managed VPC | `bool` | `false` | no |
| environment | Environment name | `string` | `""` | no |
| instance\_tenancy | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| map\_public\_ip\_on\_launch | Instances launched into a public subnet should be assigned a public IP address | `bool` | `true` | no |
| max\_subnet\_count | Sets the maximum amount of subnets to deploy. 0 will deploy a subnet for every provided availablility zone (in `availability_zones` variable) within the region | `number` | `0` | no |
| name | Resource common name | `string` | n/a | yes |
| nat\_instance\_type | NAT Instance type | `string` | `"t3.micro"` | no |
| nat\_type | Configure deployment of NAT instances/gateways for private subnets. Possible values are: gateway-per-az, gateway-single, instance-per-az and off. | `string` | `"gateway-per-az"` | no |
| private\_network\_acl\_id | Network ACL ID that will be added to private subnets. If empty, a new ACL will be created | `string` | `""` | no |
| private\_subnets\_additional\_tags | Additional tags to be added to private subnets | `map(string)` | `{}` | no |
| project | Account/Project Name | `string` | n/a | yes |
| public\_network\_acl\_id | Network ACL ID that will be added to public subnets. If empty, a new ACL will be created | `string` | `""` | no |
| public\_subnets\_additional\_tags | Additional tags to be added to public subnets | `map(string)` | `{}` | no |
| subnet\_type\_tag\_key | Key for subnet type tag to provide information about the type of subnets, e.g. `cpco.io/subnet/type=private` or `cpco.io/subnet/type=public` | `string` | `"miquido.com/subnet/type"` | no |
| subnet\_type\_tag\_value\_format | This is using the format interpolation symbols to allow the value of the subnet\_type\_tag\_key to be modified. | `string` | `"%s"` | no |
| tags | Tags to apply on repository | `map(string)` | `{}` | no |
| vpc\_main\_security\_group\_allow\_all\_egress | Add rule to main security group that allows all egress traffic | `bool` | `true` | no |
| vpc\_main\_security\_group\_allow\_self\_ingress | Add rule to main security group that allows all ingress traffic from the same group | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| availability\_zones | List of Availability Zones where subnets were created |
| igw\_id | n/a |
| nat\_gateway\_ids | IDs of the NAT Gateways created |
| nat\_instance\_ids | IDs of the NAT Instances created |
| private\_route\_table\_ids | IDs of the created private route tables |
| private\_subnet\_cidrs | CIDR blocks of the created private subnets |
| private\_subnet\_ids | IDs of the created private subnets |
| public\_route\_table\_ids | IDs of the created public route tables |
| public\_subnet\_cidrs | CIDR blocks of the created public subnets |
| public\_subnet\_ids | IDs of the created public subnets |
| vpc\_cidr | n/a |
| vpc\_default\_network\_acl\_id | The ID of the network ACL created by default on VPC creation |
| vpc\_default\_route\_table\_id | The ID of the route table created by default on VPC creation |
| vpc\_default\_security\_group\_id | The ID of the security group created by default on VPC creation |
| vpc\_id | n/a |
| vpc\_ipv6\_association\_id | The association ID for the IPv6 CIDR block |
| vpc\_ipv6\_cidr | The IPv6 CIDR block |
| vpc\_main\_route\_table\_id | The ID of the main route table associated with this VPC |
| vpc\_main\_security\_group\_id | The ID of the main security group associated with this VPC |

<!-- markdownlint-restore -->


## Developing

1. Make changes in terraform files

2. Regenerate documentation

    ```bash
    bash <(curl -s https://terraform.s3.k.miquido.net/update.sh)
    ```

3. Run lint

    ```
    make lint
    ```

## Copyright

Copyright © 2017-2020 [Miquido](https://miquido.com)



### Contributors

|  [![Konrad Obal][k911_avatar]][k911_homepage]<br/>[Konrad Obal][k911_homepage] |
|---|

  [k911_homepage]: https://github.com/k911
  [k911_avatar]: https://github.com/k911.png?size=150



  [logo]: https://www.miquido.com/img/logos/logo__miquido.svg
  [website]: https://www.miquido.com/
  [gitlab]: https://gitlab.com/miquido
  [github]: https://github.com/miquido
  [bitbucket]: https://bitbucket.org/miquido

