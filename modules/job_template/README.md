# AWX Job Template Terraform Module

Terraform module which creates an [AWX Job Template](https://docs.ansible.com/ansible-tower/latest/html/userguide/job_templates.html) using the [ilijamt/awx](https://registry.terraform.io/providers/ilijamt/awx/latest/docs) provider.

**Provider:** [ilijamt/awx](https://registry.terraform.io/providers/ilijamt/awx/latest/docs) >= 0.7

## Usage

### Basic Job Template

```hcl
module "deploy_job" {
  source = "../../modules/job_template"

  name         = "Deploy Application"
  job_type     = "run"
  inventory_id = module.inventory.id
  project_id   = module.project.id
  playbook     = "deploy.yml"

  description = "Deploy the application to production"
  verbosity   = 1
  timeout     = 3600
}
```

### Check Mode Job Template

```hcl
module "check_config" {
  source = "../../modules/job_template"

  name         = "Check Configuration"
  job_type     = "check"
  inventory_id = module.inventory.id
  project_id   = module.project.id
  playbook     = "site.yml"

  diff_mode      = true
  become_enabled = true
}
```

### Job Template with Runtime Prompts

```hcl
module "flexible_job" {
  source = "../../modules/job_template"

  name         = "Flexible Deployment"
  job_type     = "run"
  inventory_id = module.inventory.id
  project_id   = module.project.id
  playbook     = "deploy.yml"

  ask_inventory_on_launch = true
  ask_limit_on_launch     = true
  ask_variables_on_launch = true

  extra_vars = jsonencode({
    app_version = "1.0.0"
    environment = "staging"
  })
}
```

### Job Template with Credentials

```hcl
module "deploy_job" {
  source = "../../modules/job_template"

  name         = "Deploy Application"
  inventory_id = module.inventory.id
  project_id   = module.project.id
  playbook     = "deploy.yml"

  credential_ids = [
    module.machine_credential.id,
    module.vault_credential.id,
  ]
}
```

## Conditional Creation

```hcl
module "awx_job_template" {
  source = "../../modules/job_template"

  create = false

  name         = "my-job"
  inventory_id = 1
  project_id   = 1
  playbook     = "site.yml"
}
```

### Job Template with Job Slicing

```hcl
module "sliced_deploy" {
  source = "../../modules/job_template"

  name         = "Sliced Deploy"
  job_type     = "run"
  inventory_id = module.inventory.id
  project_id   = module.project.id
  playbook     = "site.yml"

  job_slice_count = 4
  description     = "Deploy across 4 parallel slices of the inventory"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3 |
| <a name="requirement_awx"></a> [awx](#requirement_awx) | >= 0.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_awx"></a> [awx](#provider_awx) | >= 0.7 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awx_job_template.this](https://registry.terraform.io/providers/ilijamt/awx/latest/docs/resources/job_template) | resource |
| [awx_job_template_associate_credential.this](https://registry.terraform.io/providers/ilijamt/awx/latest/docs/resources/job_template_associate_credential) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_simultaneous"></a> [allow_simultaneous](#input_allow_simultaneous) | Allow multiple jobs from this template to run at once. | `bool` | `false` | no |
| <a name="input_ask_credential_on_launch"></a> [ask_credential_on_launch](#input_ask_credential_on_launch) | Prompt for credential on launch. | `bool` | `false` | no |
| <a name="input_ask_inventory_on_launch"></a> [ask_inventory_on_launch](#input_ask_inventory_on_launch) | Prompt for inventory on launch. | `bool` | `false` | no |
| <a name="input_ask_job_slice_count_on_launch"></a> [ask_job_slice_count_on_launch](#input_ask_job_slice_count_on_launch) | Prompt for job slice count on launch. | `bool` | `false` | no |
| <a name="input_ask_job_type_on_launch"></a> [ask_job_type_on_launch](#input_ask_job_type_on_launch) | Prompt for job type on launch. | `bool` | `false` | no |
| <a name="input_ask_limit_on_launch"></a> [ask_limit_on_launch](#input_ask_limit_on_launch) | Prompt for limit on launch. | `bool` | `false` | no |
| <a name="input_ask_skip_tags_on_launch"></a> [ask_skip_tags_on_launch](#input_ask_skip_tags_on_launch) | Prompt for skip tags on launch. | `bool` | `false` | no |
| <a name="input_ask_tags_on_launch"></a> [ask_tags_on_launch](#input_ask_tags_on_launch) | Prompt for tags on launch. | `bool` | `false` | no |
| <a name="input_ask_variables_on_launch"></a> [ask_variables_on_launch](#input_ask_variables_on_launch) | Prompt for extra variables on launch. | `bool` | `false` | no |
| <a name="input_become_enabled"></a> [become_enabled](#input_become_enabled) | Enable privilege escalation. | `bool` | `false` | no |
| <a name="input_credential_id"></a> [credential_id](#input_credential_id) | Optional single credential ID to attach to the job template. | `number` | `null` | no |
| <a name="input_credential_ids"></a> [credential_ids](#input_credential_ids) | Optional list of credential IDs to attach to the job template. Any value in credential_id is included automatically. | `list(number)` | `[]` | no |
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this job template. | `string` | `null` | no |
| <a name="input_diff_mode"></a> [diff_mode](#input_diff_mode) | Show changes made by Ansible tasks. | `bool` | `false` | no |
| <a name="input_extra_vars"></a> [extra_vars](#input_extra_vars) | Extra variables for the job template in YAML or JSON format. | `string` | `null` | no |
| <a name="input_force_handlers"></a> [force_handlers](#input_force_handlers) | Force Ansible to run handlers even if a task fails. | `bool` | `false` | no |
| <a name="input_forks"></a> [forks](#input_forks) | Number of parallel processes to use. | `number` | `0` | no |
| <a name="input_host_config_key"></a> [host_config_key](#input_host_config_key) | Allow provisioning callbacks using this host config key. | `string` | `null` | no |
| <a name="input_inventory_id"></a> [inventory_id](#input_inventory_id) | Inventory ID for the job template. | `number` | n/a | yes |
| <a name="input_job_slice_count"></a> [job_slice_count](#input_job_slice_count) | Number of slices to divide the job into. A value greater than 1 causes the job template to launch a workflow that runs the playbook on a subset of the inventory per slice. | `number` | `1` | no |
| <a name="input_job_tags"></a> [job_tags](#input_job_tags) | Comma-separated list of playbook tags to run. | `string` | `null` | no |
| <a name="input_job_type"></a> [job_type](#input_job_type) | Job type. Valid values: run, check. | `string` | `"run"` | no |
| <a name="input_limit"></a> [limit](#input_limit) | Limit the execution to a subset of the inventory. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input_name) | Name of this job template. | `string` | n/a | yes |
| <a name="input_playbook"></a> [playbook](#input_playbook) | Playbook to run from the project. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project_id](#input_project_id) | Project ID for the job template. | `number` | n/a | yes |
| <a name="input_skip_tags"></a> [skip_tags](#input_skip_tags) | Comma-separated list of playbook tags to skip. | `string` | `null` | no |
| <a name="input_start_at_task"></a> [start_at_task](#input_start_at_task) | Start the playbook at this task. | `string` | `null` | no |
| <a name="input_timeout"></a> [timeout](#input_timeout) | Maximum time in seconds for the job to run (0 = no timeout). | `number` | `0` | no |
| <a name="input_use_fact_cache"></a> [use_fact_cache](#input_use_fact_cache) | Use cached facts if available. | `bool` | `false` | no |
| <a name="input_verbosity"></a> [verbosity](#input_verbosity) | Ansible verbosity level (0-5). | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the job template. |
| <a name="output_inventory_id"></a> [inventory_id](#output_inventory_id) | The inventory ID of the template. |
| <a name="output_job_slice_count"></a> [job_slice_count](#output_job_slice_count) | The number of job slices configured on the template. |
| <a name="output_job_type"></a> [job_type](#output_job_type) | The job type of the template. |
| <a name="output_name"></a> [name](#output_name) | The name of the job template. |
| <a name="output_project_id"></a> [project_id](#output_project_id) | The project ID of the template. |
<!-- END_TF_DOCS -->
