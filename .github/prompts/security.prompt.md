# Terraform security guidance for module-configmgmt
#
# This prompt file is picked up by VS Code GitHub Copilot Chat when referenced
# with @workspace or when a .tf file is active.

## Security rules

- Never store AWX credentials, tokens, or passwords in `.tf` files.
  Always source them from `var.*` input variables marked `sensitive = true`.
- Mark any variable that holds a secret (password, token, key) with
  `sensitive = true`:
  ```hcl
  variable "awx_password" {
    description = "AWX admin password"
    type        = string
    sensitive   = true
  }
  ```
- Do not create Terraform outputs that expose sensitive values unless the
  output itself is marked `sensitive = true`.
- Prefer Trivy scan results over manual security review; the pre-commit hook
  runs `trivy` on every commit.
- Never commit `.tfvars` files that contain real credentials; add them to
  `.gitignore`.
