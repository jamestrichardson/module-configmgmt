# AWX Execution Environment Terraform Module

Terraform module which creates an [AWX Execution Environment](https://docs.ansible.com/automation-controller/latest/html/userguide/execution_environments.html) using the [ilijamt/awx](https://registry.terraform.io/providers/ilijamt/awx/latest/docs) provider.

**Provider:** [ilijamt/awx](https://registry.terraform.io/providers/ilijamt/awx/latest/docs) >= 0.7

Execution Environments are container images that contain collections, Python dependencies, and Ansible runtime for executing automation jobs.

## Usage

### Basic Execution Environment

```hcl
module "ee_ansible" {
  source = "../../modules/execution_environment"

  name  = "Default Ansible EE"
  image = "quay.io/ansible/awx-ee:latest"

  description = "Default execution environment with core collections"
}
```

### Execution Environment with Private Registry

```hcl
module "ee_custom" {
  source = "../../modules/execution_environment"

  name            = "Custom EE"
  image           = "registry.example.com/ansible-ee:v1.0.0"
  organization_id = module.organization.id
  credential_id   = module.registry_credential.id
  pull            = "always"

  description = "Custom execution environment with company-specific collections"
}
```

### Execution Environment with Specific Pull Policy

```hcl
module "ee_production" {
  source = "../../modules/execution_environment"

  name            = "Production EE"
  image           = "quay.io/myorg/production-ee:stable"
  organization_id = module.organization.id
  pull            = "missing"

  description = "Production execution environment - stable version"
}
```

## Conditional Creation

```hcl
module "awx_execution_environment" {
  source = "../../modules/execution_environment"

  create = false

  name  = "my-ee"
  image = "quay.io/ansible/awx-ee:latest"
}
```

## Pull Policies

- **`always`**: Always pull the image from the registry, even if it exists locally
- **`missing`**: Only pull if the image is not present locally (default)
- **`never`**: Never pull the image; use the local copy only

## Building Custom Execution Environments

To create custom execution environments, use [ansible-builder](https://github.com/ansible/ansible-builder):

```yaml
# execution-environment.yml
version: 3
images:
  base_image:
    name: quay.io/ansible/ansible-runner:latest

dependencies:
  galaxy: requirements.yml
  python: requirements.txt
  system: bindep.txt

additional_build_steps:
  append_final:
    - RUN echo "Custom build step"
```

Build command:
```bash
ansible-builder build --tag registry.example.com/ansible-ee:v1.0.0
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
| <a name="provider_awx"></a> [awx](#provider_awx) | 23.8.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awx_execution_environment.this](https://registry.terraform.io/providers/ilijamt/awx/latest/docs/resources/execution_environment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input_create) | Controls whether resources should be created. | `bool` | `true` | no |
| <a name="input_credential_id"></a> [credential_id](#input_credential_id) | The credential ID to use for authenticating to the container registry. | `number` | `null` | no |
| <a name="input_description"></a> [description](#input_description) | Optional description of this execution environment. | `string` | `null` | no |
| <a name="input_image"></a> [image](#input_image) | The full image location, including the container registry, image name, and version tag. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input_name) | Name of this execution environment. | `string` | n/a | yes |
| <a name="input_organization_id"></a> [organization_id](#input_organization_id) | The organization ID to associate with this execution environment. | `number` | `null` | no |
| <a name="input_pull"></a> [pull](#input_pull) | The pull behavior for the container image. Valid values: always, missing, never. | `string` | `"missing"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output_id) | The ID of the execution environment. |
| <a name="output_image"></a> [image](#output_image) | The container image for this execution environment. |
| <a name="output_name"></a> [name](#output_name) | The name of the execution environment. |
| <a name="output_organization_id"></a> [organization_id](#output_organization_id) | The organization ID associated with this execution environment. |
<!-- END_TF_DOCS -->
