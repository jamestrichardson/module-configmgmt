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

---

## Development & Contributing

### Prerequisites

| Tool | Purpose |
|------|---------|
| [pre-commit](https://pre-commit.com/) | Local hook runner |
| [terraform](https://developer.hashicorp.com/terraform/install) >= 1.3 | Fmt / validate |
| [tflint](https://github.com/terraform-linters/tflint) | Terraform linting |
| [terraform-docs](https://terraform-docs.io/) | README generation |
| [trivy](https://trivy.dev/) | Security scanning |
| [Node.js](https://nodejs.org/) >= 18 | commitlint (optional, runs in CI) |

### Quick start

```bash
# 1. Install pre-commit
pip install pre-commit

# 2. Install the git hooks (pre-commit + commit-msg)
pre-commit install

# 3. (Optional) Run all hooks against the full tree right now
pre-commit run --all-files
```

---

## CI/CD & Automation

### Workflows

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| [Build](.github/workflows/build.yml) | push / PR → `main` | SonarQube static analysis |
| [Check pre-commit](.github/workflows/pre-commit.yml) | push / PR → `main` | Runs all pre-commit hooks (terraform fmt, tflint, trivy, terraform-docs) |
| [Conventional Commits](.github/workflows/conventional-commits.yml) | PR opened/edited, push → `main` | Lints commit messages and PR titles against the Conventional Commits spec |
| [Release Please](.github/workflows/release-please.yml) | push → `main` | Automates changelog generation, version bumping, and GitHub Releases |

### Dependabot

[`.github/dependabot.yml`](.github/dependabot.yml) is configured to open automated
PRs on a weekly schedule for:

- **GitHub Actions** action versions (all workflows)
- **Terraform provider** versions in every module and example directory

Dependabot PRs use the `build` commit-message prefix for Terraform and `ci` for
GitHub Actions, keeping them compatible with Conventional Commits and release-please.

### Release management

Releases are automated via [release-please](https://github.com/googleapis/release-please).

1. Merge Conventional-Commit PRs into `main`.
2. release-please opens (or updates) a "Release PR" with a bumped version and
   generated `CHANGELOG.md`.
3. When that PR is merged, a GitHub Release and git tag (e.g. `v1.2.3`) are
   created automatically.
4. Floating major (`v1`) and minor (`v1.2`) tags are also updated so Terraform
   module sources can pin loosely.

Configuration lives in [`release-please-config.json`](release-please-config.json)
and [`.release-please-manifest.json`](.release-please-manifest.json).

---

## Commit Message Convention

This project enforces the [Conventional Commits](https://www.conventionalcommits.org/)
specification via:

- A **commit-msg** pre-commit hook (local, installed by `pre-commit install`).
- The **Conventional Commits** GitHub Actions workflow (CI enforcement).
- The **release-please** workflow (drives automated versioning).

```
<type>(<optional scope>): <subject>

[optional body]

[optional footer(s)]
```

Allowed types: `feat` · `fix` · `docs` · `style` · `refactor` · `perf` ·
`test` · `build` · `ci` · `chore` · `revert`.

---

## AI / GitHub Copilot

Project-specific Copilot instructions live in
[`.github/copilot-instructions.md`](.github/copilot-instructions.md).
These are automatically picked up by VS Code's GitHub Copilot Chat extension
and bias code generation toward this project's conventions (typed variables,
described outputs, `snake_case` naming, etc.).

To extend the instruction set see the **Adding additional Copilot prompts**
section of that file.
