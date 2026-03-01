# AWX Organization Terraform Module

Terraform module which creates an [AWX Organization](https://docs.ansible.com/ansible-tower/latest/html/userguide/organizations.html) using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) provider.

## Usage

```hcl
module "awx_organization" {
  source = "../../modules/organization"

  name        = "my-organization"
  description = "My AWX Organization"
  max_hosts   = 100
}
```

## Conditional Creation

```hcl
module "awx_organization" {
  source = "../../modules/organization"

  create = false

  name = "my-organization"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3 |
| <a name="requirement_awx"></a> [awx](#requirement_awx) | >= 0.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider_awx) | 0.29.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awx_organization.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_custom_virtualenv"></a> [custom_virtualenv](#input_custom_virtualenv) | Local absolute file path containing a custom Python virtualenv to use. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this organization. | `string` | `null` | no |
| <a name="input_max_hosts"></a> [max_hosts](#input_max_hosts) | Maximum number of hosts allowed to be managed by this organization. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this organization. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the organization. |
| <a name="output_name"></a> [name](#output_name) | The name of the organization. |
<!-- END_TF_DOCS -->

## Requirements

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3 |
| <a name="requirement_awx"></a> [awx](#requirement_awx) | >= 0.24 |

## Providers

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider_awx) | 0.29.1 |

## Modules

## Modules

No modules.

## Resources

## Resources

| Name | Type |
|------|------|
| [awx_organization.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/organization) | resource |

## Inputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_custom_virtualenv"></a> [custom_virtualenv](#input_custom_virtualenv) | Local absolute file path containing a custom Python virtualenv to use. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this organization. | `string` | `null` | no |
| <a name="input_max_hosts"></a> [max_hosts](#input_max_hosts) | Maximum number of hosts allowed to be managed by this organization. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this organization. | `string` | n/a | yes |

## Outputs

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the organization. |
| <a name="output_name"></a> [name](#output_name) | The name of the organization. |
<!-- END_TF_DOCS -->

## Requirements

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3 |
| <a name="requirement_awx"></a> [awx](#requirement_awx) | >= 0.24 |

## Providers

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider_awx) | 0.29.1 |

## Modules

## Modules

No modules.

## Resources

## Resources

| Name | Type |
|------|------|
| [awx_organization.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/organization) | resource |

## Inputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_custom_virtualenv"></a> [custom_virtualenv](#input_custom_virtualenv) | Local absolute file path containing a custom Python virtualenv to use. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this organization. | `string` | `null` | no |
| <a name="input_max_hosts"></a> [max_hosts](#input_max_hosts) | Maximum number of hosts allowed to be managed by this organization. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this organization. | `string` | n/a | yes |

## Outputs

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the organization. |
| <a name="output_name"></a> [name](#output_name) | The name of the organization. |
<!-- END_TF_DOCS -->

## Requirements

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3 |
| <a name="requirement_awx"></a> [awx](#requirement_awx) | >= 0.24 |

## Providers

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider_awx) | 0.29.1 |

## Modules

## Modules

No modules.

## Resources

## Resources

| Name | Type |
|------|------|
| [awx_organization.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/organization) | resource |

## Inputs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_custom_virtualenv"></a> [custom_virtualenv](#input_custom_virtualenv) | Local absolute file path containing a custom Python virtualenv to use. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this organization. | `string` | `null` | no |
| <a name="input_max_hosts"></a> [max_hosts](#input_max_hosts) | Maximum number of hosts allowed to be managed by this organization. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this organization. | `string` | n/a | yes |

## Outputs

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the organization. |
| <a name="output_name"></a> [name](#output_name) | The name of the organization. |
<!-- END_TF_DOCS -->
