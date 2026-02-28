# Contributing to module-configmgmt

Thank you for taking the time to contribute!  Please take a moment to read
through this guide before opening issues or pull requests.

---

## Prerequisites

Install the development toolchain before making any changes:

```bash
# Python-based tools
pip install pre-commit

# Install git hooks (pre-commit + commit-msg stages)
pre-commit install

# Terraform (https://developer.hashicorp.com/terraform/install)
# tflint  (https://github.com/terraform-linters/tflint)
# terraform-docs (https://terraform-docs.io)
# trivy   (https://trivy.dev)
```

---

## Development workflow

1. **Fork** the repository and create a feature branch:

   ```bash
   git checkout -b feat/<short-description>
   ```

2. **Make your changes** following the conventions in
   [`.github/copilot-instructions.md`](.github/copilot-instructions.md).

3. **Run pre-commit locally** to catch issues before pushing:

   ```bash
   pre-commit run --all-files
   ```

4. **Commit** using the [Conventional Commits](https://www.conventionalcommits.org/)
   format (the `commit-msg` hook enforces this automatically):

   ```
   feat(inventory): add support for inventory source credentials
   ```

5. **Open a Pull Request** against `main`.  The PR title must also follow
   Conventional Commits (validated by CI).

---

## Terraform authoring guidelines

| Rule | Detail |
|------|--------|
| Required Terraform version | `>= 1.3` |
| Provider | `denouche/awx >= 0.24` |
| Variable `description` | **Required** on every variable |
| Variable `type` | **Required**; avoid `any` |
| Output `description` | **Required** on every output |
| Naming | `snake_case` throughout |
| Collections | Prefer `for_each` over `count` |
| Workspace | Do not use `terraform.workspace` |
| Formatting | `terraform fmt -recursive` (enforced by pre-commit) |
| Secrets | Never hard-code credentials; always use variables |

### Adding a new module

```
modules/<name>/
  main.tf       – resource definitions
  variables.tf  – typed, described inputs
  outputs.tf    – described outputs
  versions.tf   – required_version + required_providers block
  README.md     – add <!-- BEGIN_TF_DOCS --> / <!-- END_TF_DOCS --> markers
```

Run `terraform-docs modules/<name>` or let the pre-commit hook inject the docs
automatically.

---

## Commit type reference

| Type | When to use |
|------|-------------|
| `feat` | New feature or resource support |
| `fix` | Bug fix |
| `docs` | Documentation only changes |
| `style` | Formatting, missing semicolons (no logic change) |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf` | Performance improvement |
| `test` | Adding or correcting tests |
| `build` | Changes to build system or external dependencies (e.g. provider bumps) |
| `ci` | CI/CD configuration changes |
| `chore` | Maintenance tasks not covered by the above |
| `revert` | Reverts a previous commit |

---

## Release process

Releases are fully automated via
[release-please](https://github.com/googleapis/release-please).  You do not
need to manually bump versions or edit `CHANGELOG.md`.

1. Merge Conventional-Commit PRs into `main`.
2. release-please opens/updates a release PR.
3. Review and merge the release PR to publish the GitHub Release and tags.
