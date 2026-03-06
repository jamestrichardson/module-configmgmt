# AWX Project Terraform Module

Terraform module which creates an [AWX Project](https://docs.ansible.com/ansible-tower/latest/html/userguide/projects.html) using the [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) provider.

**Provider:** [denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs) >= 0.24

## Usage

### Git Project

```hcl
module "awx_project" {
  source = "../../modules/project"

  name            = "my-ansible-project"
  organization_id = module.awx_organization.id
  scm_type        = "git"
  scm_url         = "https://github.com/example/ansible-playbooks.git"
  scm_branch      = "main"
  credential_id   = module.scm_credential.id

  scm_update_on_launch     = true
  scm_update_cache_timeout = 86400
}
```

### Manual Project

```hcl
module "awx_project" {
  source = "../../modules/project"

  name            = "manual-project"
  organization_id = module.awx_organization.id
  scm_type        = ""
  local_path      = "my_playbooks"
}
```

## Conditional Creation

```hcl
module "awx_project" {
  source = "../../modules/project"

  create = false

  name            = "my-project"
  organization_id = 1
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
| <a name="provider_awx"></a> [awx](#provider_awx) | >= 0.24 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awx_project.this](https://registry.terraform.io/providers/denouche/awx/latest/docs/resources/project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_override"></a> [allow_override](#input_allow_override) | Allow admins to change ansible variables at launch time. | `bool` | `false` | no |
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_credential_id"></a> [credential_id](#input_credential_id) | Numeric ID of the credential to use for SCM access. | `number` | `null` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this project. | `string` | `null` | no |
| <a name="input_local_path"></a> [local_path](#input_local_path) | Local path (relative to PROJECTS_ROOT) containing playbooks and related files for this project. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this project. | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization_id](#input_organization_id) | Numeric ID of the organization this project belongs to. | `number` | n/a | yes |
| <a name="input_scm_branch"></a> [scm_branch](#input_scm_branch) | Branch, tag, or commit to checkout. Defaults to the SCM's default branch. | `string` | `null` | no |
| <a name="input_scm_clean"></a> [scm_clean](#input_scm_clean) | Remove any local modifications prior to performing an update. | `bool` | `false` | no |
| <a name="input_scm_delete_on_update"></a> [scm_delete_on_update](#input_scm_delete_on_update) | Delete the local repository in its entirety prior to performing an update. | `bool` | `false` | no |
| <a name="input_scm_type"></a> [scm_type](#input_scm_type) | Type of SCM. Valid values: git, svn, insights, archive. Use empty string for manual project. | `string` | `"git"` | no |
| <a name="input_scm_update_cache_timeout"></a> [scm_update_cache_timeout](#input_scm_update_cache_timeout) | The number of seconds after the last project update before a new update is triggered by a job launch. | `number` | `0` | no |
| <a name="input_scm_update_on_launch"></a> [scm_update_on_launch](#input_scm_update_on_launch) | Update the project when a job using the project is launched. | `bool` | `false` | no |
| <a name="input_scm_url"></a> [scm_url](#input_scm_url) | URL to the SCM repository. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the project. |
| <a name="output_name"></a> [name](#output_name) | The name of the project. |
| <a name="output_organization_id"></a> [organization_id](#output_organization_id) | The organization ID the project belongs to. |
| <a name="output_scm_type"></a> [scm_type](#output_scm_type) | The SCM type of the project. |
<!-- END_TF_DOCS -->
