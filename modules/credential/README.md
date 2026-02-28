# AWX Credential Terraform Module

Terraform module which creates an [AWX Credential](https://docs.ansible.com/ansible-tower/latest/html/userguide/credentials.html) using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) provider.

## Usage

### Machine credential (SSH)

```hcl
# Look up the machine credential type ID from AWX (usually 1)
data "awx_credential_type" "machine" {
  name = "Machine"
}

module "awx_credential" {
  source = "../../modules/credential"

  name               = "my-ssh-credential"
  organization_id    = module.awx_organization.id
  credential_type_id = data.awx_credential_type.machine.id

  inputs = jsonencode({
    username   = "ansible"
    ssh_key_data = file("~/.ssh/id_rsa")
  })
}
```

### SCM credential

```hcl
data "awx_credential_type" "scm" {
  name = "Source Control"
}

module "awx_scm_credential" {
  source = "../../modules/credential"

  name               = "my-git-credential"
  organization_id    = module.awx_organization.id
  credential_type_id = data.awx_credential_type.scm.id

  inputs = jsonencode({
    username = "git-user"
    password = var.git_password
  })
}
```

## Conditional Creation

```hcl
module "awx_credential" {
  source = "../../modules/credential"

  create = false

  name               = "my-credential"
  organization_id    = 1
  credential_type_id = 1
  inputs             = "{}"
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
| [awx_credential.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/credential) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Controls whether resources should be created. | `bool` | `true` | no |
| name | Name of this credential. | `string` | n/a | yes |
| organization\_id | Numeric ID of the organization this credential belongs to. | `number` | n/a | yes |
| credential\_type\_id | Numeric ID of the credential type. | `number` | n/a | yes |
| description | Optional description of this credential. | `string` | `null` | no |
| inputs | JSON or YAML encoded credential inputs. Sensitive. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the credential. |
| name | The name of the credential. |
| organization\_id | The organization ID the credential belongs to. |
| credential\_type\_id | The credential type ID. |
<!-- END_TF_DOCS -->
