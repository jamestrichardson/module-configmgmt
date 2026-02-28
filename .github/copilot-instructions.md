# GitHub Copilot Instructions for module-configmgmt

## Project Context

This repository is a **Terraform module collection** for managing
[Ansible AWX](https://github.com/ansible/awx) resources using the
[denouche/awx](https://registry.terraform.io/providers/denouche/awx/latest/docs)
provider.  The project is structured after the
[terraform-aws-modules](https://github.com/terraform-aws-modules) pattern:
each subdirectory under `modules/` is a standalone, reusable module, and
`examples/` contains fully-worked usage examples.

## Architecture & Conventions

### Module structure

Every module follows this layout:

```
modules/<name>/
  main.tf        – resource definitions
  variables.tf   – input variable declarations (always typed and described)
  outputs.tf     – output value declarations (always described)
  versions.tf    – `terraform {}` block with required_version and required_providers
  README.md      – terraform-docs managed; edit header/footer only
```

### Terraform style rules

- Minimum Terraform version: `>= 1.5`
- Provider source: `denouche/awx`, version `>= 0.24`
- Always define `description` and `type` for every `variable` block.
- Always define `description` for every `output` block.
- Use `snake_case` for all resource, variable, local, and output names.
- Prefer `for_each` over `count` for resource collections.
- Do **not** use `terraform.workspace` – modules must remain workspace-agnostic.
- Format all files with `terraform fmt -recursive` before committing.

### Commit message format

All commits **must** follow the
[Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<optional scope>): <subject>

[optional body]

[optional footer(s)]
```

Allowed types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`,
`build`, `ci`, `chore`, `revert`.

Examples:
```
feat(inventory): add support for inventory source credentials
fix(team): correct role entitlement lookup
docs: update credential module README
chore: bump pre-commit hooks to latest versions
```

### Pull request titles

PR titles must also follow Conventional Commits (validated by the
`Conventional Commits` GitHub Actions workflow and
`amannn/action-semantic-pull-request`).

## Code generation guidelines

When Copilot generates Terraform code for this project:

1. **Always** add `description` to every variable and output.
2. **Always** add appropriate `type` constraints (prefer `string`, `number`,
   `bool`, `list(...)`, `map(...)`, `object({...})` over `any`).
3. Create `versions.tf` for any new module with the standard
   `terraform { required_version … required_providers … }` block.
4. Add `<!-- BEGIN_TF_DOCS -->` / `<!-- END_TF_DOCS -->` markers in new
   module README files so `terraform-docs` can inject documentation.
5. Do **not** hard-code hostnames, passwords, or tokens; always use variables.
6. Prefer optional attributes (`optional(type, default)`) in `object({})` types
   where it makes sense to allow callers to omit fields.
7. When writing examples, always include a `provider "awx"` block that reads
   credentials from variables, never literals.

## Adding additional Copilot prompts

You can extend these instructions in two ways:

### 1. Repository-wide additions (affects all contributors)

Edit **this file** (`.github/copilot-instructions.md`) to add new rules,
context, or patterns. The file is plain Markdown; add new `##` sections as
needed.  Keep instructions concise and action-oriented.

### 2. Per-directory context files

Create a `.github/prompts/<name>.prompt.md` file for topic-specific guidance
(e.g., `security.prompt.md`, `testing.prompt.md`).  These files are picked up
by VS Code's **GitHub Copilot Chat** when you @-reference them or when working
in relevant files.  Use the same Markdown format as this file.

### 3. VS Code workspace settings

Add `"github.copilot.chat.codeGeneration.instructions"` entries to
`.vscode/settings.json` to attach inline instructions to specific glob
patterns:

```json
{
  "github.copilot.chat.codeGeneration.instructions": [
    {
      "file": ".github/copilot-instructions.md"
    },
    {
      "text": "Always use terraform fmt before committing.",
      "pattern": "**/*.tf"
    }
  ]
}
```
