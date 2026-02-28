# module-configmgmt

Terraform module collection for managing [Ansible AWX](https://github.com/ansible/awx) resources using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) Terraform provider.

Inspired by and structured after the [terraform-aws-modules](https://github.com/terraform-aws-modules) project.

## Available Modules

| Module | Description |
|--------|-------------|
| [organization](./modules/organization) | Creates and manages an AWX Organization |
| [team](./modules/team) | Creates and manages an AWX Team with optional role entitlements |
| [inventory](./modules/inventory) | Creates and manages an AWX Inventory with optional groups and external sources |
| [credential](./modules/credential) | Creates and manages an AWX Credential |

## Provider Configuration

All modules require the `denouche/awx` provider to be configured:

```hcl
terraform {
  required_providers {
    awx = {
      source  = "denouche/awx"
      version = ">= 0.24"
    }
  }
}

provider "awx" {
  hostname = "https://awx.example.com"
  username = "admin"
  password = var.awx_password
  # Or use a token:
  # token = var.awx_token
}
```

## Usage

### Organization

```hcl
module "organization" {
  source = "github.com/jamestrichardson/module-configmgmt//modules/organization"

  name        = "my-org"
  description = "My AWX Organization"
  max_hosts   = 100
}
```

### Team

```hcl
module "team" {
  source = "github.com/jamestrichardson/module-configmgmt//modules/team"

  name            = "ops-team"
  organization_id = module.organization.id
  description     = "Operations team"
}
```

### Inventory

```hcl
module "inventory" {
  source = "github.com/jamestrichardson/module-configmgmt//modules/inventory"

  name            = "my-inventory"
  organization_id = module.organization.id
  description     = "Main inventory"

  variables = <<-YAML
    ---
    ansible_connection: ssh
  YAML

  groups = {
    web = {
      name        = "web-servers"
      description = "Web server group"
    }
  }
}
```

### Credential

```hcl
data "awx_credential_type" "machine" {
  name = "Machine"
}

module "credential" {
  source = "github.com/jamestrichardson/module-configmgmt//modules/credential"

  name               = "my-ssh-key"
  organization_id    = module.organization.id
  credential_type_id = data.awx_credential_type.machine.id

  inputs = jsonencode({
    username     = "ansible"
    ssh_key_data = file("~/.ssh/id_rsa")
  })
}
```

## Examples

| Example | Description |
|---------|-------------|
| [organization](./examples/organization) | Simple organization example |
| [team](./examples/team) | Team within an organization |
| [inventory](./examples/inventory) | Inventory with host groups |
| [complete](./examples/complete) | All modules used together |

## Notes on Execution Environments

Execution Environments (EEs) are a feature of AWX 18+ / Ansible Automation Platform 2.x.
The `denouche/awx` provider does not currently include a resource for managing EEs directly.
To manage execution environments, consider using the AWX CLI or AWX REST API alongside
Terraform's `null_resource` / `local-exec` provisioner, or track the upstream provider for
future support.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3 |
| awx provider | >= 0.24 |
