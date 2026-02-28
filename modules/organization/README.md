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
| terraform | >= 1.3 |
| awx | >= 0.24 |

## Providers

| Name | Version |
|------|---------|
| awx | >= 0.24 |

## Resources

| Name | Type |
|------|------|
| [awx_organization.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/organization) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Controls whether resources should be created. | `bool` | `true` | no |
| name | Name of this organization. | `string` | n/a | yes |
| description | Optional description of this organization. | `string` | `null` | no |
| max\_hosts | Maximum number of hosts allowed to be managed by this organization. | `number` | `null` | no |
| custom\_virtualenv | Local absolute file path containing a custom Python virtualenv to use. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the organization. |
| name | The name of the organization. |
<!-- END_TF_DOCS -->
