# AWX Inventory Terraform Module

Terraform module which creates an [AWX Inventory](https://docs.ansible.com/ansible-tower/latest/html/userguide/inventories.html) along with optional inventory groups and sources using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) provider.

## Usage

### Basic inventory

```hcl
module "awx_inventory" {
  source = "../../modules/inventory"

  name            = "my-inventory"
  organization_id = module.awx_organization.id
  description     = "My AWX Inventory"
  variables       = <<-YAML
    ---
    ansible_connection: ssh
  YAML
}
```

### Inventory with groups

```hcl
module "awx_inventory" {
  source = "../../modules/inventory"

  name            = "my-inventory"
  organization_id = module.awx_organization.id

  groups = {
    web = {
      name        = "web-servers"
      description = "Web server hosts"
      variables   = "---\nhttp_port: 80\n"
    }
    db = {
      name        = "db-servers"
      description = "Database server hosts"
    }
  }
}
```

### Inventory with an external source

```hcl
module "awx_inventory" {
  source = "../../modules/inventory"

  name            = "cloud-inventory"
  organization_id = module.awx_organization.id

  sources = {
    aws_ec2 = {
      name              = "aws-ec2-source"
      source            = "ec2"
      credential_id     = module.awx_credential.id
      update_on_launch  = true
      overwrite         = true
      overwrite_vars    = true
    }
  }
}
```

## Conditional Creation

```hcl
module "awx_inventory" {
  source = "../../modules/inventory"

  create = false

  name            = "my-inventory"
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
| [awx_inventory.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/inventory) | resource |
| [awx_inventory_group.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/inventory_group) | resource |
| [awx_inventory_source.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/inventory_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Controls whether resources should be created. | `bool` | `true` | no |
| name | Name of this inventory. | `string` | n/a | yes |
| organization\_id | Numeric ID of the organization this inventory belongs to. | `number` | n/a | yes |
| description | Optional description of this inventory. | `string` | `null` | no |
| kind | Kind of inventory (`""` for regular or `"smart"`). | `string` | `null` | no |
| host\_filter | Filter applied to the hosts of this inventory. | `string` | `null` | no |
| variables | YAML or JSON inventory variables. | `string` | `null` | no |
| groups | Map of inventory groups to create. | `any` | `{}` | no |
| sources | Map of inventory sources to create. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the inventory. |
| name | The name of the inventory. |
| organization\_id | The organization ID the inventory belongs to. |
| group\_ids | Map of group logical names to their IDs. |
| source\_ids | Map of source logical names to their IDs. |
<!-- END_TF_DOCS -->
