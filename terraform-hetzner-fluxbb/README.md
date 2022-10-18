# FluxBB for Hetzner

This repo contains a Terraform Module for how to deploy a [FluxBB](https://fluxbb.org/) instance on the
[Hetzner](https://www.hetzner.com/) using [Terraform](https://www.terraform.io/).

__FluxBB__, is designed as a lighter, faster alternative to some of the traditional feature heavy forum applications. It is easy to use and has a proven track record of stability and security making it an ideal choice of forum for your website.

## What's a Terraform Module?

A Terraform Module refers to a self-contained packages of Terraform configurations that are managed as a group. This repo
is a Terraform Module and contains many "submodules" which can be composed together to create useful infrastructure patterns.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2.8 |
| hetzner | >= 1.35.1 |

## Providers

| Name | Version |
|------|---------|
| hetzner | >= 1.35.1 |

## Resources

| Name | Type |
|------|------|
| [hcloud_ssh_key](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |
| [hcloud_firewall](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_volume](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |
| [hcloud_floating_ip](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/primary_ip) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| hcloud_api_token | API key for hetzner. | `string` | `""` | yes |
| hcloud_location | The name of the location to deploy the FluxBB into. | `string` | `""` | yes |
| hcloud_image | The name is to set the os_type. | `string` | `""` | yes |
| hcloud_server_type | The server type to use for the server. | `string` | `""` | yes |
| hcloud_name | The name of the fluxBB instance. | `string` | `""` | yes |
| ssh_pub_key | Public Key Pair to use for the instance. | `string` | `""` | yes |
| user | 	Set the instance user name. | `string` | `""` | yes |
| private_key | Set the private key value for the instance from the hostmachine | `string` | `""` | yes |
## Outputs

| Name | Description |
|------|-------------|
| gateway\_url | The url of the FluxBB gateway |
| ipv4\_address | The public IP address of the fluxBB instance |

