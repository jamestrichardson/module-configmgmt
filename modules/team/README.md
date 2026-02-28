# AWX Team Terraform Module

Terraform module which creates an [AWX Team](https://docs.ansible.com/ansible-tower/latest/html/userguide/teams.html) using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) provider.

## Usage

### Basic team

```hcl
module "awx_team" {
  source = "../../modules/team"

  name            = "ops-team"
  organization_id = module.awx_organization.id
  description     = "Operations team"
}
```

### Team with role entitlements

```hcl
data "awx_inventory_role" "admin" {
  name         = "Admin"
  inventory_id = module.awx_inventory.id
}

module "awx_team" {
  source = "../../modules/team"

  name            = "ops-team"
  organization_id = module.awx_organization.id
  description     = "Operations team"

  role_entitlements = [
    { role_id = data.awx_inventory_role.admin.id }
  ]
}
```

## Conditional Creation

```hcl
module "awx_team" {
  source = "../../modules/team"

  create = false

  name            = "ops-team"
  organization_id = 1
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
| [awx_team.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/team) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Controls whether resources should be created. | `bool` | `true` | no |
| name | Name of this team. | `string` | n/a | yes |
| organization\_id | Numeric ID of the organization this team belongs to. | `number` | n/a | yes |
| description | Optional description of this team. | `string` | `null` | no |
| role\_entitlements | List of role IDs to grant to this team. Each object must contain a `role_id` attribute. | `list(object({role_id = number}))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the team. |
| name | The name of the team. |
| organization\_id | The organization ID the team belongs to. |
<!-- END_TF_DOCS -->
