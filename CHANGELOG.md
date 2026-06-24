# 1.0.0 (2026-06-24)


### Bug Fixes

* Add "private_subnet_count" and "public_subnet_count" variables to fix issue with initial deploy ([e7ba4aa](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/e7ba4aa5361af4395e51d10da686c2c5de29d2a6))
* **aws:** Remove requirement for custom aws provider ([f73f294](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/f73f294a68446b2993457cbb43f90002afd088aa))
* ci ([417a948](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/417a948418b1f849edb38193b4d931c87f7eff9d))
* cicd ([8153458](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/8153458602becd1cac394c7a5c01f45976362384))
* CICD ([eb7a935](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/eb7a935e3b59a75809bb0194b96e5cb55440bdde))
* **ipv6:** fixed wrong variable ipv4_enabled passed to ipv6 setting ([35cf409](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/35cf40955e3f09641efedd310a294bb087d66d85))
* **lifecycle:** When changing name process could stuck due to removing security group ([f3255e1](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/f3255e129530075b2488133dbbaa6a27bc3d150f)), closes [#4](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/issues/4)
* NAT + ipv6 ([e1f3ddf](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/e1f3ddfb28b784e827062747ba764e94ee546baa))
* **private-link:** Fix VPC Endpoints configuration for AWS ECS Fargate type Task ([f8aea9c](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/f8aea9cff2457975cf844f1c515faf4f470b035e))
* README ([28e1ae0](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/28e1ae04b4deea4b1b081eb29659fff253d8c788))
* **s3-private-link:** fixed error in aws_vpc_endpoint_service s3 ([9969cd1](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/9969cd1b51f897c81a3fd37960e41a91e5f358a0))
* **subnet:** pass ipv4/ipv6 variables to submodules to correctly generate subnets configurations as currently everything was enabled without checking if we are using ipv4/ipv6 ([b9b40d9](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/b9b40d9f38fc7c8fa04f8deabc526693fef0d314))
* **terraform:** Update modules to remove deprecations ([3fb21a1](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/3fb21a1e2a7de1514eb25bc3350c7f24c769f134)), closes [#3](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/issues/3)
* update ([6e11c14](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/6e11c14b3f89e93fd7385818a9919d3f49a9d12b))
* vpc_default_security_group_id > security_group_id ([dad1313](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/dad13139bba605d73ed4a8f4082d47e7e33f01f2))
* **vpc-endpoints:** Fix 0.12 interpolation list of lists ([867c425](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/867c425613768804512f6e06ee67914d2ba7e1e1))
* **vpc-endpoints:** include all route tables for vpc ([fe9dc5d](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/fe9dc5de421ddaae9c9b8c1c43a521be31d2e5a5))


### Features

* add nat_instance_ami_id variable ([84a1070](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/84a10704f124925724cca348eb4c119604b8446a))
* Added instance-single NAT type ([bb3f048](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/bb3f04803740b7baa91ad9fd6cdaee87dfc5a46f))
* added nat_elastic_ips variable ([5167ad6](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/5167ad6fd32682693c21108e1674e0782647d535))
* **clodposse:** use https protocol instead of git when fetching cloudposse modules ([4a60aad](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/4a60aad9d5e8d765945a7073a25b60d0f1cfe34a))
* ipv6 ([4915fda](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/4915fda0575b78d38b741558247f629b247dd048))
* **nat:** Update dependencies to provide NAT Instance mode ([b951773](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/b951773844187ee76b608550e5c842fde98154a4))
* **provider:** lock AWS provider to version 3.x ([4f0543a](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/4f0543a1971816f475104d3a26a8dbb94270bc55))
* Recreate module using opensource modules ([a411300](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/a4113008f70c7e463473e6e11fe6a97b60416933))
* **subnets:** Add private_subnets_additional_tags and public_subnets_additional_tags variables ([e2b1b2b](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/e2b1b2b775380c74b23403706aa5e7c7bf543041))
* **terraform:** Port to 0.12 ([6e5d4c9](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/6e5d4c925c8ce64e26758351e4a0ce7509153055))
* **terraform:** update to terraform 0.13.5 ([504477d](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/504477d359edc8d0b6120c0234510f557311becd))
* update cloudposses module ([5a25749](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/5a257493e809b8aac077789ca76a834e8d5bf79a))
* update vpc ([fcfb65f](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/fcfb65f92e3676d782ae06a817288ae3fcc4b0b4))
* **vars:** Added variable to setup security group description ([3c14c01](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/3c14c016448915c572b132b55b68380f735d69cb))
* **vpc-endpoints:** always  create vpc endpoint to s3 ([35215cc](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/35215cca601a5e6229b4247b46588c2f52c85044))
* **vpc:** Add main security group ([3c1fa03](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/3c1fa032334d687b90902d79e95a1155ed789666)), closes [#2](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/issues/2)
* **vpc:** Add option to disable creating of VPC Endpoints ([f6d6d94](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/f6d6d942d6698b80ab06fa6aca8a5cbf740ae249))
* **vpc:** introduce security_group_enabled parameter from cloudposse ([d2ec6c9](https://gitlab.miquido.com/miquido/terraform/terraform-vpc/commit/d2ec6c9ead29f1292b80dfb75fa6f0e5fc5dc075))


### BREAKING CHANGES

* **vpc:** Remove `private_subnet_count` and `public_subnet_count` variables, because they were used as workarounds to terraform 0.11 issues with dynamic counting

Approved-by: Paweł Jędruch
* **nat:** Rename "nat_gateway_mode" variable to "nat_type" and its values
